#!/bin/sh
SOURCE_DIR="/delete_files"
FILE_CONTENTS="/lorem_ipsum.txt"

# Function to create, delete, and change permissions on files
stress_files_delete_files() {
  echo "Creating directory... \n"
  mkdir -p $SOURCE_DIR
  
  echo "Creating files... \n"
  seq 1 "$NUM_ITERATIONS_DELETE" | parallel --eta echo "Creating file and placing contents in: $SOURCE_DIR/file{}.txt \n" ' ; ' touch "$SOURCE_DIR/file{}.txt" \; echo "$FILE_CONTENTS" > "$SOURCE_DIR/file{}.txt"
  
  echo "Waiting for file creation to complete... \n"
  wait
  
  echo "Deleting files... \n"
  rm -rf $SOURCE_DIR

  echo "Done \n"
}

# Call the function
stress_files_delete_files

# clean up script
rm -rf $SOURCE_DIR