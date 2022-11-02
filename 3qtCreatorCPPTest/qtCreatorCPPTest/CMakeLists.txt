cmake_minimum_required(VERSION 3.5)

project(qtCreatorCPPTest LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_executable(qtCreatorCPPTest main.cpp
               src/dog.cpp)
target_include_directories(qtCreatorCPPTest PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/include)
