#!/bin/bash

# Variables
jURL="https://jamf_pro_url_here"
jAuth="username_here:password_here"

prompt=$(osascript << EOF
tell application "System Events" to text returned of (display dialog "Match this" default answer "Computer Name Here" buttons {"OK"} default button 1)
EOF
)

# Curl a simple search of computers
curl -ksu "$jAuth" "$jURL/JSSResource/computers/match/$prompt" | xmllint --format -
# Return "size" which is the number of devices in response
responseSize=$(curl -ksu "$jAuth" "$jURL/JSSResource/computers/match/$prompt" | xmllint --xpath '/computers/size/text()' -)

# If response is nothing, we found 0 computers
if [[ "$responseSize" == "0" ]];then
	jamf displayMessage -message "We found $responseSize"
elif [[ "$responseSize" -eq "1" ]];then # If response is 1, we found 1 computer. 
	compName=$(curl -ksu "$jAuth" "$jURL/JSSResource/computers/match/$prompt" | xmllint --xpath '/computers/computer/name/text()' -)
	compBuilding=$(curl -ksu "$jAuth" "$jURL/JSSResource/computers/match/$prompt" | xmllint --xpath '/computers/computer/building/text()' -)

	jamf displayMessage -message "We found $responseSize. It's building is $compBuilding and it's name is $compName"
	echo "$compName" "$compBuilding" > ~/Desktop/foundcomp.txt
	# TODO: reduce code by removing first check for 1 computer and merging it all into a for loop at the bottom. 
	
fi
