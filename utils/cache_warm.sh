#!/bin/bash -l

# ensure EMAIL, PASSWORD, DOMAIN
env=false
arg=false
if [ -z "$DOMAIN" ] && [ -z "$EMAIL" ] && [ -z "$PASSWORD" ]; then
  env=true
fi
if [ ! $# == 3 ]; then
  arg=true
fi

if $arg && $env; then
  echo "$(basename "$0") [DOMAIN] [EMAIL] [PASSWORD] -- warm the cache for the client app using the domain and credentials supplied. May also be environment variables.

where:
    DOMAIN   - base URL to use (e.g. client.changehealthcare.com)
    EMAIL    - email address used to login (e.g. cache_warm+all@changehealthcare.com
    PASSWORD - password tied to email (e.g. @sdf1234)"
  exit 1;
fi

if $env; then
  domain="$1"
  email="$2"
  pass="$3"
else
  domain="$DOMAIN"
  email="$EMAIL"
  pass="$PASSWORD"
fi

#APP_ROOT='/var/www/prod/client.changehealthcare.com'
#APP_USER='www'
#CACHE_LOG="${APP_ROOT}/log/cache.log"
#
## Tee std output to a file (ree will also display stdout)
#exec > >(tee -a ${CACHE_LOG})
#exec 2>&1
#
## datestamp the logfile
#echo `date`
#
## verify correct user
#if [[ `whoami` != "${APP_USER}" ]]; then
#  echo "This script must be run as the ${APP_USER} user."
#  exit 1
#fi
#
## change to app dir
#cd $APP_ROOT || exit 1
#
#RAILS_ENV=production rails runner "ba = ClientUser.find_by_email('${email}').benefits_administrator;cached={};cached[:employers]=ba.employers_filtered_by_tpa_id(nil);emp_ids=cached[:employers].collect{|e| e.id};key=CacheHelper.gen_key(:base => 'employer_stats', :employers => emp_ids, :tpa_id => nil);cached[:employer_stats]=CacheHelper.fetch_or_store(key){ba.all_employer_stats(nil)};"

# set authenticity_token for credentials
authToken=`curl -s --cookie-jar session "$domain" | grep csrf-token | awk '{print $2;}' | awk -F"\"" '{print $2;}'`
if [ -z "$authToken" ] && [ "${authToken+'xxx'}" == "xxx" ]
then
  echo "Did not receive authenticity_token." 1>&2
  exit 1;
fi
echo "authToken set to: $authToken"

# login
curl -s -X POST --data-urlencode "client_user_session[email]=$email" --data-urlencode "client_user_session[password]=$pass" --data-urlencode "authenticity_token=$authToken" --cookie session --cookie-jar auth "$domain/user_session" > /dev/null
if [ ! -f auth ]
  then
  echo "Unable to log in."
  exit 1;
fi
echo "logged in"

# include --cookie auth on all requests for this session

# get all employer links
curl -s --cookie auth "$domain/employers" | awk '/employers\/[0-9]+/' | awk -F"\"" '{print $2;}' > emps
if [ ! -f emps ]
  then
  echo "Unable to retrieve list of employers." 1>&2
  exit 1;
fi
echo "Employer listing successful."

# call http://clientapp.changehealthcare.com/employers/123 for each
for emp in $(cat emps)
do
  curl -s --cookie auth "$domain$emp" > /dev/null
  echo "Cached employer: $emp"
done

# cleanup
rm session auth emps 
