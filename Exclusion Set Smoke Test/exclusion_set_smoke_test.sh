#!/bin/bash

# Step 1 - alert is created, no exceptions on Plan
echo "\n-- Step 1 -- \n\n"
echo "Please verify that no exception sets are added to your plan and then press enter or any other key to check the local Plan hash."
read -s -n 1 key1

# If this wasn't an enter, keep asking until it is
while [[ "${key1}" != $'\0A' ]]; do
    read -s -n 1 key1
    echo "Current Plan hash: $(sudo protectctl info)"
    echo "Please press enter to continue."
done

touch '/Library/LaunchAgents/com.exception.reported.plist'
echo "Creating 'sudo touch /Library/LaunchAgents/com.exception.reported.plist' - please check to see that an alert was created in Jamf Protect"
echo "Run 'sudo protectctl info -v' and verify that Monitors -> File increments the Matched and Reported fields."
echo "$(sudo protectctl info -v)"

echo "\n"
echo "Press enter when you have verified these items are correct."
read -s -n 1 key2

# If this wasn't an enter, keep asking until it is
while [[ "${key2}" != $'\0A' ]]; do
    read -s -n 1 key2
    echo "Protect info: \n $(sudo protectctl info -v)"
    echo "Please press enter to continue."
done

# Step 2 - exception set added, no alert created
echo "\n\n -- Step 2 -- \n\n"
echo "Please update your Plan in Jamf Protect to include your exception set and verify the Plan hash updates on this computer. Press enter when this is done or any other key to check the local Plan hash."
echo "Current Plan hash: \n $(sudo protectctl info)"
read -s -n 1 key3

# If this wasn't an enter, keep asking until it is
while [[ "${key3}" != $'\0A' ]]; do
    read -s -n 1 key3
    echo "Current Plan hash: \n $(sudo protectctl info)"
    echo "Please press enter to continue."
done

touch '/Library/LaunchAgents/com.exception.test.plist'
echo "Creating 'sudo touch /Library/LaunchAgents/com.exception.test.plist' - please check to see that NO alert was created in Jamf Protect"
echo "Run 'sudo protectctl info -v' and verify that Monitors -> File DID NOT increment the Matched and Reported fields."
echo "Protect info: \n $(sudo protectctl info -v)"

echo "\n"
echo "Press enter when you have verified these items are correct."
read -s -n 1 key4

# If this wasn't an enter, keep asking until it is
while [[ "${key4}" != $'\0A' ]]; do
    read -s -n 1 key4
    echo "Protect info: \n $(sudo protectctl info -v)"
    echo "Please press enter to continue."
done

# Step 3 - excecption set still in place, alert created due to type in file name
echo "\n\n -- Step 3 -- \n\n"
touch '/Library/LaunchAgents/com.exceptions.test.plist'
echo "Creating 'sudo touch /Library/LaunchAgents/com.exceptions.test.plist' - please check to see that an alert was created in Jamf Protect"
echo "Run 'sudo protectctl info -v' and verify that Monitors -> File increments the Matched and Reported fields."
echo "Protect info: \n $(sudo protectctl info -v)"

echo "\n"
echo "Press enter when you have verified these items are correct."
read -s -n 1 key5

# If this wasn't an enter, keep asking until it is
while [[ "${key5}" != $'\0A' ]]; do
    read -s -n 1 key5
    echo "Protect info: \n $(sudo protectctl info -v)"
    echo "Please press enter to continue."
done

echo "\n\n"
echo "Please remove the added exception from the plan, verify that the Plan hash has updated with 'sudo protectctl info -v', and press enter to continue or any other key to check the local Plan hash."
echo "Current Plan hash: \n $(sudo protectctl info)"
read -s -n 1 key6

# If this wasn't an enter, keep asking until it is
while [[ "${key6}" != $'\0A' ]]; do
    read -s -n 1 key6
    echo "Current Plan hash: \n $(sudo protectctl info)"
    echo "Please press enter to continue."
done

# Step 4 - no exception set, alert created in Pro
echo "\n\n -- Step 4 -- \n\n"
touch '/Library/LaunchAgents/com.exception.new.plist'
echo "Creating 'sudo touch /Library/LaunchAgents/com.exception.new.plist' - please check to see that an alert was created in Jamf Protect"
echo "Run 'sudo protectctl info -v' and verify that Monitors -> File increments the Matched and Reported fields."
echo "Protect info: \n $(sudo protectctl info -v)"

echo "\n"
echo "Press enter when you have verified these items are correct."
read -s -n 1 key7

# If this wasn't an enter, keep asking until it is
while [[ "${key7}" != $'\0A' ]]; do
    read -s -n 1 key7
    echo "Protect info: \n $(sudo protectctl info -v)"
    echo "Please press enter to continue."
done

# Clean up - delete files and clean up
rm '/Library/LaunchAgents/com.exception.reported.plist'
rm '/Library/LaunchAgents/com.exception.test.plist'
rm '/Library/LaunchAgents/com.exceptions.test.plist'
rm '/Library/LaunchAgents/com.exception.new.plist'

echo "\n\n"
echo "Running clean up of created PLIST files"
echo "\n All done :)"