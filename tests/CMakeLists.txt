# Enable testing with CTest
enable_testing()

# Find necessary test libraries (e.g., Google Test, Catch2)
find_package(GTest REQUIRED)

# Add test executable
add_executable(SunyaTests test_main.cpp)
target_link_libraries(SunyaTests PRIVATE GTest::GTest GTest::Main)

# Register tests with CTest
add_test(NAME SunyaTests COMMAND SunyaTests)