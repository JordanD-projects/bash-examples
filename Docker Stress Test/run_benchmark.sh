#!/bin/sh
# Enable this option if you want to run a "log stream --info --debug --predicate "subsystem beginswith 'com.jamf.protect'"" in a separate Terminal window.
RUN_WITH_LOG_STREAM=1 

# Enable this option if you want to run "protectctl diagnostics --duration 60 &" during testing. 
RUN_WITH_DIAGNOSTICS=1

if [ "$RUN_WITH_LOG_STREAM" -eq 1 ]; then
    osascript <<EOF
    tell application "Terminal"
        do script "log stream --info --debug --predicate \\"subsystem beginswith 'com.jamf.protect'\\""
    end tell
EOF
fi

# Rebuild our Docker image
docker build -t file-stress-test .

# Run our Docker image
docker run -it --rm file-stress-test

if [ "$RUN_WITH_DIAGNOSTICS" -eq 1 ]; then
    # Gather diagnostics from Protect
    protectctl diagnostics --duration 60 &
fi 