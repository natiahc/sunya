cmake_minimum_required(VERSION 3.15)
project(Sunya)

# Enable C++17 or higher
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Set the output directories for build files
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

# Include subdirectories
add_subdirectory(src)
add_subdirectory(tests)

# Include third-party dependencies (if using source)
# add_subdirectory(third_party/some_library)