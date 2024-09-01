# src/CMakeLists.txt

add_executable(Sunya main.cpp)

if(EMSCRIPTEN)
    set_target_properties(Sunya PROPERTIES SUFFIX ".html")
endif()
