#!/bin/sh

apikey=$1
service_id=$2

access_token=`curl -X "POST" "https://iam.cloud.ibm.com/oidc/token" \
     -H 'Accept: application/json' \
     -H 'Content-Type: application/x-www-form-urlencoded' \
     --data-urlencode "apikey=${apikey}" \
     --data-urlencode "response_type=cloud_iam" \
     --data-urlencode "grant_type=urn:ibm:params:oauth:grant-type:apikey" | jq -r .access_token`

curl -X DELETE "https://iam.cloud.ibm.com/v1/serviceids/${service_id}/lock" \
        -H "Authorization: Bearer ${access_token}" \
        -H "Content-Type: application/json"