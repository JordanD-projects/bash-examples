#!/bin/sh
NUM_ITERATIONS=1000

# Function to run Tamper Prevention tests
stress_tamper_prev() {
  
  # Loop for the specified number of iterations
  for ((i=0; i<$NUM_ITERATIONS; i++)); do
    echo "Tamper Prevention Iteration: $i"
    
    echo "Try to hide Protect app"
    chflags -R hidden /Applications/JamfProtect.app

    echo "Try to delete Protect App"
    rm -rf /Applications/JamfProtect.app

    echo "Try to delete Protect Application Support directory"
    rm -rf "/Library/Application Support/JamfProtect"
  done

  echo -e "Please verify the following:\n"
  echo "1. That \"/Applications/JamfProtect.app\" is not hidden (no flag changes)"
  ls -lO "/Applications/JamfProtect.app"
  
  echo -e "\n2. That \"/Applications/JamfProtect.app\" has not been deleted"
  ls "/Applications/JamfProtect.app"

  # We can put these back later but for now they are causing issues. 
  echo -e "\n3. That \"rm -rf /Library/Application\\ Support/JamfProtect\" has not been executed"
  ls "/Library/Application Support/JamfProtect"

  echo -e "\nDone"

}

# Call the function
stress_tamper_prev