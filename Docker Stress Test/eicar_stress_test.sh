#!/bin/sh
SOURCE_DIR="/test_eicar"

# TODO: Implement this test

# Function to create, delete, and change permissions on files
stress_eicar_test() {
  echo "Creating directory..."
  mkdir -p $SOURCE_DIR

  hash="X5O!P%@AP[4\\PZX54(P^)7CC)7}\$EICAR-STANDARD-ANTIVIRUS-TEST-FILE!\$H+H*"
  
  # Decode the base 64 encoded string.
  decodedHash=$(echo "$hash" | base64 --decode)
  
  # Create a .sh script with the contents of the hash, then attempt to execute it.
  echo "Running Eicar file..."
  seq 1 "$NUM_ITERATIONS_EICAR" | parallel --eta 'echo "Running eicar test file iternation: {}" ; touch "$SOURCE_DIR/myScript{}.sh" ; echo "$decodedHash" > "$SOURCE_DIR/myScript{}.sh" ; sh "$SOURCE_DIR/myScript{}.sh"'
  
  echo "Waiting for file creation to complete..."
  wait
  
  echo "Deleting files..."
  rm -rf $SOURCE_DIR

  echo "Done"
}

# Call the function
stress_eicar_test

# clean up script
rm -rf $SOURCE_DIR