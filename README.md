OpenCV Learning Notes
===
> A linux based learning tutorial and notes
# 1. Pre-requiste for Linux
## 1.1 Install C++

1. Install `gcc`

    ```bash
    # show whether gcc is installed
    gcc -v

    # (if not) install gcc in ubuntu
    sudo apt-get update

    # install the GNU compiler tools and the GDB debugger with this command
    sudo apt-get install build-essential gdb
    ```

2. Test C++ with a project
follow [Visual Studio Code Example](https://code.visualstudio.com/docs/cpp/config-linux)
- create `CMakeLists.txt` file
- add `cmake_minimum_required()`, `project()`, `add_executable()`
- run
    ```shell
    mkdir build
    cd build
    cmake ..
    make
    # then run the exe by call
    ./your-exectue-file
    ```

## 1.2 Install OpenCV
Refer to [^1] and [^2].
> `libgtk2.0-dev` and `pkg-config` are required for OpenCV to show image in linux

1. Install `libgtk2.0-dev` and `pkg-config` using `sudo apt install libgtk2.0-dev pkg-config`
2. Install and build `OpenCV`

    ```bash
    # Install minimal prerequisites (Ubuntu 18.04 as reference)
    sudo apt update && sudo apt install -y cmake make g++ wget unzip
    # Download and unpack sources
    wget -O opencv.zip https://github.com/opencv/opencv/archive/4.x.zip
    unzip opencv.zip
    # Create build directory
    mkdir -p build && cd build
    # Configure
    cmake  ../opencv-4.x
    # Build
    make -j4
    # Install the OpenCV package
    sudo make install
    ```

3. Add `"/usr/local/include/opencv4"` to Visual Studio Code C++ Extension Settings
    - Go to VS code press `CTRL+SHIFT+P` search for c/c++ edit configuration.
    - Inside `c_cpp_properties.json` file under include path add the path `"/usr/local/include/opencv4"`

[^1]: [opencv official install in Linux](https://docs.opencv.org/4.x/d7/d9f/tutorial_linux_install.html)

[^2]: [GeeksforGeeks Install Reference](https://www.geeksforgeeks.org/how-to-install-opencv-in-c-on-linux/)

# 2. Learn Basic C++ Application
> using Qt Creator as IDE, since VS code requires too much memory

What I read:

- [A website to learn CMake](https://cliutils.gitlab.io/modern-cmake/) : very basic, or list of things you should know but need to read more to comprehend
- CMake book: Professional CMake: a Practical Guide

## 2.1 Project Structure and Cmake

The CMake usage and simple tutorial is in folder `3qtCreatorTest`, which explains:

- How should the project structure be like? 
- How to set CMake for this project? 
- How to include files in main.cpp?

## 2.2 An Advanced Project Structure and Test.cpp

`4CMakeAndTestCPP` demonstrates a simple C++ project managed by CMake with test cpp files in a test folder.

- [ ] Test Cpp and head files in test/test.cpp
  - [ ] Find the answer in modern-cmake

# 3. CMake Tutorial
1. General / Startup 
    - https://pabloariasal.github.io/2018/02/19/its-time-to-do-cmake-right/
    - https://www.youtube.com/watch?v=rLopVhns4Zs
    - [Cmake example](https://github.com/wangzhezhe/5MCST/tree/master/cmake_example)
    - https://stackoverflow.com/questions/26243169/cmake-target-include-directories-meaning-of-scope
    - [Cmake offical tutorial](https://cmake.org/cmake/help/latest/guide/tutorial/index.html)
2.  CMake & C++ Project / Library Explan
    - https://matgomes.com/add-library-cmake-create-libraries/
    - https://kubasejdak.com/modern-cmake-is-like-inheritance
    - https://crascit.com/professional-cmake/
    
# Image Processing Algorithm implemented in OpenCV

check the README.md in folder `opencvAlgo`.
