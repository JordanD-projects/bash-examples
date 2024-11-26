#!/bin/bash

# Define the number of iterations
NUM_ITERATIONS=10

# Define the directory containing the .c file
SOURCE_DIR="path_to_helloworld.c_here"

# Define the name of the .c file
SOURCE_FILE="helloworld.c"

# Define the directory where you want to compile and execute the files
TARGET_DIR="path_to_directory_for_output"

# Clean up old output
sudo rm -rf "$TARGET_DIR"
# Create new output directory
sudo mkdir "$TARGET_DIR"

sleep 5

# Loop for the specified number of iterations
for ((i=0; i<NUM_ITERATIONS; i++)); do

    echo "Iteration number: $($i+1) \n"

    # Copy the .c file
    cp "$SOURCE_DIR/$SOURCE_FILE" "$TARGET_DIR/${SOURCE_FILE}_$i.c"

    # Compile the file
    gcc "$TARGET_DIR/${SOURCE_FILE}_$i.c" -o "$TARGET_DIR/${SOURCE_FILE}_${i}.out"

    # Execute the compiled file
    "$TARGET_DIR/${SOURCE_FILE}_${i}.out" &
done
