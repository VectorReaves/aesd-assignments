#!/bin/bash

# Check if exactly two arguments are provided
if [ $# -ne 2 ]; then
    echo "Error: Two arguments are required: <writefile> <writestr>"
    exit 1
fi

# Assign arguments to variables
writefile="$1"
writestr="$2"

# Extract the directory path from writefile
writedir=$(dirname "$writefile")

# Create the directory path if it doesn't exist
mkdir -p "$writedir" 2>/dev/null
if [ $? -ne 0 ]; then
    echo "Error: Could not create directory path '$writedir'"
    exit 1
fi

# Write the string to the file, overwriting if it exists
echo "$writestr" > "$writefile" 2>/dev/null
if [ $? -ne 0 ]; then
    echo "Error: Could not create or write to file '$writefile'"
    exit 1
fi

exit 0
