CPP Project with Qt Creator
===

# QT Creator SetUp
Set up the kit path for Qt, G++/Clang++, GDB
- somehow Ninja tested failed, change to unix makefile

# General Structure

Project Folder
 |
 - include
 |  |
 |  dog.h  (head file)
 |
 - src
 |  |
 |  dog.cpp (lib file) #include <dog.h>
 |
 main.cpp #include <dog.h>
 
 
# CMakeList.txt Adding Contents
 
```cmake
# add source cpp
add_executable(qtCreatorCPPTest main.cpp
               src/dog.cpp)
# add head files             
target_include_directories(qtCreatorCPPTest PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/include)
```
