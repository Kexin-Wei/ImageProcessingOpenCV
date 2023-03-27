OpenCV Learning Notes
===
> A linux based learning tutorial and notes, install step by step. If want to use docker file, proceed to end of this document.
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
    - [Cmake offical tutorial](https://cmalske.org/cmake/help/latest/guide/tutorial/index.html)
2.  CMake & C++ Project / Library Explan
    - https://matgomes.com/add-library-cmake-create-libraries/
    - https://kubasejdak.com/modern-cmake-is-like-inheritance
    - https://crascit.com/professional-cmake/

# 6. Install docker from docker file

- **Create a Dockerfile**: Create a new directory for your project, and inside that directory, create a `Dockerfile` with the following content, which sets up a Docker image based on Ubuntu 20.04, installs the required packages, and builds OpenCV from source.
    ``` bash
    # Use the official Ubuntu image as the base
    FROM ubuntu:20.04
    
    # Set environment variables to avoid interactive prompts during package installation
    ENV DEBIAN_FRONTEND=noninteractive
    
    # Update the package index and install required packages
    RUN apt-get update && apt-get install -y \
        build-essential \
        cmake \
        git \
        libgtk2.0-dev \
        pkg-config \
        libavcodec-dev \
        libavformat-dev \
        libswscale-dev \
        python3-dev \
        python3-numpy \
        libtbb2 \
        libtbb-dev \
        libjpeg-dev \
        libpng-dev \
        libtiff-dev \
        libdc1394-22-dev
    
    # Download and build OpenCV
    RUN cd ~ && \
        git clone https://github.com/opencv/opencv.git && \
        git clone https://github.com/opencv/opencv_contrib.git && \
        cd opencv && \
        mkdir build && \
        cd build && \
        cmake -D CMAKE_BUILD_TYPE=Release \
            -D CMAKE_INSTALL_PREFIX=/usr/local \
            -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules \
            .. && \
        make -j$(nproc) && \
        make install && \
        ldconfig
    
    # Set the default command to run a Bash shell
    CMD ["bash"]
    ```
- **Build the Docker image**: In the terminal, navigate to the directory containing the Dockerfile and build the Docker image using the following command: `docker build -t ubuntu-20-opencv .`
- **Run the Docker container**: Run the Docker container using the following command: `docker run -it --rm ubuntu-20-opencv`
- Mount local directory to docker container: `docker run -it --name c11 -v /Users/kexinwei/GitRepos/ImageProcessingOpenCV/:/gitrepo vac611/ubuntu-20-opencv`
- Add opencv python linkage (rebuild opencv) and update image: the default python package path is somehow wrong and we need to modify it by using `PYTHON3_PACKAGES_PATH=/usr/lib/python3.8/dist-packages` in [this post](https://rodosingh.medium.com/using-cmake-to-build-and-install-opencv-for-python-and-c-in-ubuntu-20-04-6c5881eebd9a)