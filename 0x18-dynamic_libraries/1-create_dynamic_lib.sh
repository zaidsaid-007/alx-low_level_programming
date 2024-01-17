#!/bin/bash

# Check if any arguments were provided
if [ "$#" -ne 0 ]; then
    echo "Usage: $0"
    exit 1
fi

# Compile the .c files into object files with -fPIC flag
gcc *.c -c -fPIC

# Check if any object files were created
if [ "$(ls *.o 2>/dev/null)" == "" ]; then
    echo "Error: No object files were created"
    exit 1
fi

# Link the object files into a shared library
gcc *.o -shared -o liball.so

# Check if the shared library was created
if [ ! -f "liball.so" ]; then
    echo "Error: Shared library was not created"
    exit 1
fi

echo "Shared library 'liball.so' created successfully"
