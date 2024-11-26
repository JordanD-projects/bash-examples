#!/bin/bash

# All of these scrits will be run in parallel
# NOTE: Scripts will only be run if they are set to "1" in teh dockerfile.

if [ "$RUN_CREATE" -eq 1 ]; then
    # Create x number of files and then delete them
    sh -x /scripts/create.sh &
fi

if [ "$RUN_CHMOD" -eq 1 ]; then
    # Create x number of files, change permissions on them, and then delete them
    sh -x /scripts/chmod.sh &
fi 

if [ "$RUN_DELETE" -eq 1 ]; then
    # Create x number of files and then delete them
    sh -x /scripts/delete.sh &
fi

if [ "$RUN_EICAR" -eq 1 ]; then
    # Trigger x number of eicar Threat Prevention scripts
    sh -x /scripts/eicar_stress_test.sh &
fi

# Create a bunch of c files and then execute on them
if [ "$RUN_AUTH_EVENTS" -eq 1 ]; then
    sh -x /scripts/auth_event_stress_test.sh &
fi 

if [ "$RUN_TAMP_PREV" -eq 1 ]; then
    # Trigger x number of tamper prevention scripts
    sh -x /scripts/tamper_prevention.sh &
fi

# Wait for all scripts to finish
wait