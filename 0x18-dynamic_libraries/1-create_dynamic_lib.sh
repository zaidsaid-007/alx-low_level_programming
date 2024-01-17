#!/bin/bash
# Compile the .c files into object files with -fPIC flag
gcc *.c -c -fPIC
# Link the object files into a shared library
gcc *.o -shared -o liball.so
