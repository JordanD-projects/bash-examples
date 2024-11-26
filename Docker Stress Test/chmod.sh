#!/bin/sh
SOURCE_DIR="/chmod_files"
FILE_CONTENTS="/lorem_ipsum.txt"

# Function to rename permissions on files
stress_files_chmod() {
  echo "Creating directory..."
  mkdir -p $SOURCE_DIR
  
  echo "Creating files..."
  seq 1 "$NUM_ITERATIONS_CHMOD" | parallel --eta echo "Creating file and placing contents in: $SOURCE_DIR/file{}.txt \n" ' ; ' touch "$SOURCE_DIR/file{}.txt" \; echo "$FILE_CONTENTS" > "$SOURCE_DIR/file{}.txt"
  
  echo "Waiting for file creation to complete..."
  wait
  
  echo "Changing permissions..."
  mkdir -p $SOURCE_DIR
  seq 1 "$NUM_ITERATIONS_CHMOD" | parallel --eta echo "Changing permission for $SOURCE_DIR/file{}.txt" ' ; ' touch "$SOURCE_DIR/file{}.txt" \; echo "$FILE_CONTENTS" > "$SOURCE_DIR/file{}.txt" \; chmod 777 "$SOURCE_DIR/file{}.txt"

  echo "Done"
}

# Call the function
stress_files_chmod

# clean up script
rm -rf $SOURCE_DIR