#!/bin/bash

# Create and navigate to build directory
mkdir -p build
cd build

# Run CMake configuration
cmake ..

# Build the project
cmake --build .
