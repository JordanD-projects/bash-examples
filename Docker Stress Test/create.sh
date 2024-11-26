#!/bin/sh
SOURCE_DIR="/create_files"
FILE_CONTENTS="/lorem_ipsum.txt"

# Function to create, delete, and change permissions on files
stress_files_create() {
  echo "Creating directory..."
  mkdir -p $SOURCE_DIR
  
  echo "Creating files..."
  seq 1 "$NUM_ITERATIONS_CREATE" | parallel --eta echo "Creating file and placing contents in: $SOURCE_DIR/file{}.txt \n" ' ; ' touch "$SOURCE_DIR/file{}.txt" \; echo "$FILE_CONTENTS" > "$SOURCE_DIR/file{}.txt"
  
  echo "Waiting for file creation to complete..."
  wait
  
  echo "Deleting files..."
  rm -rf $SOURCE_DIR

  echo "Done"
}

# Call the function
stress_files_create

# clean up script
rm -rf $SOURCE_DIR