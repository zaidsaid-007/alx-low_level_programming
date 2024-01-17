#!/bin/bash

# Check if any .c files are present in the current directory
if [ $(ls *.c 2>/dev/null | wc -l) -eq 0 ]; then
  echo "No .c files found in the current directory."
  exit 1
fi

# Compile the .c files into object files with -fPIC flag
gcc *.c -c -fPIC

# Link the object files into a shared library
gcc *.o -shared -o liball.so

# Check if the library was created successfully
if [ -f liball.so ]; then
  echo "Library created successfully as liball.so"
else
  echo "Error: library creation failed."
  exit 1
fi