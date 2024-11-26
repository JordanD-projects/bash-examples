#!/bin/bash

creds="place_basic_auth_here"
jamfProURL="jamf_pro_url_here"

# Get a token
authToken=$(curl -s -H "Authorization: Basic $creds" https://$jamfProURL/api/v1/auth/token -X POST | awk -F'\"' '/token/{print $4}')

# Get just the complete computer record for computer ID: 100
curl -s -X GET "https://$jamfProURL/api/v1/computers-inventory-detail/100" -H "accept: application/json" -H "Authorization: Bearer $authToken" > /tmp/Computer\ ID\ 100\ Full\ Record.json