CPP Project Directory Structure
===

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
 
 
