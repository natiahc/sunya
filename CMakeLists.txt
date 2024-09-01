cmake_minimum_required(VERSION 3.15)
project(Sunya)

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Include ExternalProject module
include(ExternalProject)

# Define paths for Emscripten
set(EMSDK_INSTALL_PREFIX ${CMAKE_BINARY_DIR}/third_party/emsdk)
set(EMSDK_BIN ${EMSDK_INSTALL_PREFIX}/emsdk/emscripten/latest)

# Check if Emscripten is available
find_program(EMSCRIPTEN_COMPILER emcc HINTS ${EMSDK_BIN})
if(EMSCRIPTEN_COMPILER)
    set(EMSCRIPTEN TRUE)
else()
    set(EMSCRIPTEN FALSE)
endif()

# Automatically download and set up Emscripten if not found
if(NOT EMSCRIPTEN)
    message(STATUS "Emscripten not found, setting up Emscripten SDK...")

    ExternalProject_Add(
        emsdk
        PREFIX ${EMSDK_INSTALL_PREFIX}
        GIT_REPOSITORY https://github.com/emscripten-core/emsdk.git
        GIT_TAG main
        UPDATE_COMMAND ""
        CONFIGURE_COMMAND ""
        BUILD_COMMAND ./emsdk install latest && ./emsdk activate latest
        BUILD_IN_SOURCE 1
        INSTALL_COMMAND ""
    )

    ExternalProject_Add_Step(
        emsdk
        set_env
        COMMAND ${CMAKE_COMMAND} -E env "PATH=${EMSDK_BIN}:$ENV{PATH}"
        DEPENDEES download
        DEPENDERS build
    )

    ExternalProject_Add_Step(
        emsdk
        setup
        COMMAND ${CMAKE_COMMAND} -E env "PATH=${EMSDK_BIN}:$ENV{PATH}" emcc --version
        DEPENDEES set_env
    )

    add_dependencies(Sunya emsdk)
endif()

# Emscripten-specific configuration
if(EMSCRIPTEN)
    set(CMAKE_CXX_COMPILER em++)
    set(CMAKE_C_COMPILER emcc)
    set(CMAKE_EXECUTABLE_SUFFIX ".html")

    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -s USE_WEBGL2=1 -s FULL_ES3=1 -s WASM=1 -s ASSERTIONS=1")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -s ALLOW_MEMORY_GROWTH=1")

    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/wasm)
endif()

# Add source directory
add_subdirectory(src)
