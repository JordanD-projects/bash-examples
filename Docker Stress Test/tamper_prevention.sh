#!/bin/sh
# TODO: Make this test better and update it to support new versions of Tamper Prevention

# Function to run Tamper Prevention tests
stress_tamper_prev() {
  
  echo "Creating files..."
  echo "Try to hide Protect app, try to delete Protect App, try to delete Protect Application Support directory"
  seq 1 "$NUM_ITERATIONS_TAMP_PREV" | parallel --eta echo "Tamper Prevention Iteration {}: \n" ' ; ' chflags -R hidden "/Applications/JamfProtect.app" \; rm -rf "/Applications/JamfProtect.app" \; rm -rf "/Library/Application Support/JamfProtect"
  
  echo "Done"
}

# Call the function
stress_tamper_prev
