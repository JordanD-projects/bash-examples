#!/bin/bash

# Define the name of the .c file
SOURCE_FILE="helloworld.c"

# Define the directory where you want to compile and execute the files
TARGET_DIR="/auth_events_files"

# Clean up old output
rm -rf "$TARGET_DIR"
# Create new output directory
mkdir "$TARGET_DIR"

sleep 5

for i in $(seq 1 $NUM_ITERATIONS_AUTH_EVENTS); do
    echo "Iteration number: $i"

    # Copy the .c file
    cp "$SOURCE_FILE" "$TARGET_DIR/${SOURCE_FILE}_$i.c"
    # Compile the file
    gcc "$TARGET_DIR/${SOURCE_FILE}_$i.c" -o "$TARGET_DIR/${SOURCE_FILE}_$i.out"

    # Execute the compiled file
    "$TARGET_DIR/${SOURCE_FILE}_$i.out" &

done

# Clean up after ourselves and remove the output directory
rm -rf "$TARGET_DIR"