# ensure EMAIL, PASSWORD, DOMAIN
if [ -z "$DOMAIN" ] && [ -z "$EMAIL" ] && [ -z "$PASSWORD" ]
then 
  echo "Missing environment variables. Make sure the following are set: \$DOMAIN \$EMAIL \$PASSWORD"
  exit 1;
fi

# create a new session
# curl -s --cookie-jar cookie http://$ > /dev/null
# echo "session setup"

# set authenticity_token for credentials
authToken=`curl -s --cookie-jar session "http://$DOMAIN" | grep csrf-token | awk '{print $2;}' | awk -F"\"" '{print $2;}'`
if [ -z "$authToken" ] && [ -z "${authTOken+xxx}" = "xxx" ]
  then
  echo "Did not receive authenticity_token." 1>&2
  exit 1;
fi
echo "authToken set to: $authToken"

# login
curl -s -X POST -d "client_user_session[email]=$EMAIL" -d "client_user_session[password]=$PASSWORD" -d "authenticity_token=$authToken" --cookie session --cookie-jar auth "http://$DOMAIN/user_session" > /dev/null
if [ ! -f auth ]
  then
  echo "Unable to log in." 1>&2
fi
echo "logged in"

# include --cookie auth on all requests for this session

# get all employer links
curl -s --cookie auth "http://$DOMAIN/employers" | awk '/employers\/[0-9]+/' | awk -F"\"" '{print $2;}' > emps
if [ ! -f emps ]
  then
  echo "Unable to retrieve list of employers." 1>&2
fi
echo "Employer listing successful."

# call http://clientapp.changehealthcare.com/employers/123 for each
for emp in $(cat emps)
do
  curl -s --cookie auth "http://$DOMAIN$emp" > /dev/null
  echo "Cached employer: $emp"
done

# cleanup
rm session auth emps 