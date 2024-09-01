# Collect all source and header files
file(GLOB_RECURSE SOURCES CONFIGURE_DEPENDS "*.cpp")
file(GLOB_RECURSE HEADERS CONFIGURE_DEPENDS "*.h" "*.hpp")

# Define the executable target
add_executable(Sunya ${SOURCES} ${HEADERS})

# Link necessary libraries
find_package(OpenCV REQUIRED)
find_package(TensorFlow REQUIRED)
find_package(Vulkan REQUIRED)
find_package(CGAL REQUIRED)
# Add other required find_package commands for your dependencies

target_include_directories(Sunya PRIVATE ${OpenCV_INCLUDE_DIRS} ${CGAL_INCLUDE_DIRS})
target_link_libraries(Sunya PRIVATE ${OpenCV_LIBS} ${TensorFlow_LIBRARIES} ${Vulkan_LIBRARIES} ${CGAL_LIBRARIES})
# Link other necessary libraries here