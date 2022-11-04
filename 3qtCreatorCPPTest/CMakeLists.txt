cmake_minimum_required(VERSION 3.5)

project(3qtCreatorCPPTest LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_executable(3qtCreatorCPPTest main.cpp
                src/dog.cpp)
target_include_directories(3qtCreatorCPPTest PRIVATE ${CMAKE_CURRENT_LIST_DIR}/include)
