# Works with 3.15 and tested through 3.21
cmake_minimum_required(VERSION 3.15...3.21)
set(LIBRARY_NAME OpenCVAlgo)
project( OpenCVAlgo)
find_package( OpenCV REQUIRED )
include_directories( ${OpenCV_INCLUDE_DIRS} )
add_executable( main main.cpp )
target_link_libraries( OpenCVAlgo ${OpenCV_LIBS} )