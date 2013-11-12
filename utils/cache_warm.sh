#!/bin/bash

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

# set authenticity_token for credentials
authToken=`curl -s --cookie-jar session "http://$domain" | grep csrf-token | awk '{print $2;}' | awk -F"\"" '{print $2;}'`
if [ -z "$authToken" ] && [ -z "${authToken+xxx}" = "xxx" ]
  then
  echo "Did not receive authenticity_token." 1>&2
  exit 1;
fi
echo "authToken set to: $authToken"

# login
curl -s -X POST --data-urlencode "client_user_session[email]=$email" --data-urlencode "client_user_session[password]=$pass" --data-urlencode "authenticity_token=$authToken" --cookie session --cookie-jar auth "http://$domain/user_session" > /dev/null
if [ ! -f auth ]
  then
  echo "Unable to log in."
  exit 1;
fi
echo "logged in"

# include --cookie auth on all requests for this session

# get all employer links
curl -s --cookie auth "http://$domain/employers" | awk '/employers\/[0-9]+/' | awk -F"\"" '{print $2;}' > emps
if [ ! -f emps ]
  then
  echo "Unable to retrieve list of employers." 1>&2
  exit 1;
fi
echo "Employer listing successful."

# call http://clientapp.changehealthcare.com/employers/123 for each
for emp in $(cat emps)
do
  curl -s --cookie auth "http://$domain$emp" > /dev/null
  echo "Cached employer: $emp"
done

# cleanup
rm session auth emps 
