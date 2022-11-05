CMake Usage and Test CPP
===

This is an advanced cmake example to handle a bit complicated C++ project. 

- [ ] Unit test?

# File Structure
```bash
Project Folder
 - include
 	- dog.h  (head file)
    - cat.h
 - src
    - dog.cpp (lib file) #include <dog.h>
    - cat.cpp #include <cat.cpp>
 - test 
    - test.cpp (test function)
 - main.cpp #include <dog.h>
```

# CMakeList.txt Adding Contents

```cmake
# add source cpp
add_executable(qtCreatorCPPTest main.cpp
               src/dog.cpp)
# add head files             
target_include_directories(qtCreatorCPPTest PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/include)
```

# [Modern CMake Notes](https://cliutils.gitlab.io/modern-cmake/)

## [Selecting a minimum in 2022](https://cliutils.gitlab.io/modern-cmake/chapters/intro/dodonot.html)

What minimum CMake should you *run* locally, and what minimum should you *support* for people using your code? Since you are reading this, you should be able to get a release in the last few versions of CMake; do that, it will make your development easier. For support, there are two ways to pick minimums: based on features added (which is what a developer cares about), or on common pre-installed CMakes (which is what a user cares about).

Never select a minimum version older than the oldest compiler version you support. CMake should always be at least as new as your compiler.

### What minimum to choose - OS support:

- 3.4: The bare minimum. Never set less.
- 3.7: Debian old-stable.
- 3.10: Ubuntu 18.04.
- 3.11: CentOS 8 (use EPEL or AppSteams, though)
- 3.13: Debian stable.
- 3.16: Ubuntu 20.04.
- 3.19: First to support Apple Silicon.
- latest: pip/conda-forge/homebew/chocolaty, etc.

### What minimum to choose - Features:

- 3.8: C++ meta features, CUDA, lots more
- 3.11: `IMPORTED INTERFACE` setting, faster, FetchContent, `COMPILE_LANGUAGE` in IDEs
- 3.12: C++20, `cmake --build build -j N`, `SHELL:`, FindPython
- 3.14/3.15: CLI, FindPython updates
- 3.16: Unity builds / precompiled headers, CUDA meta features
- 3.17/3.18: Lots more CUDA, metaprogramming

## [How to structure your project](https://cliutils.gitlab.io/modern-cmake/chapters/basics/structure.html)

The following information is biased. But in a good way, I think. I'm going to tell you how to structure the directories in your project. This is based on convention, but will help you:

- Easily read other projects following the same patterns,
- Avoid a pattern that causes conflicts,
- Keep from muddling and complicating your build.

First, this is what your files should look like when you start if your project is creatively called `project`, with a library called `lib`, and a executable called `app`:

```bash
- project
  - .gitignore
  - README.md
  - LICENCE.md
  - CMakeLists.txt
  - cmake
    - FindSomeLib.cmake
    - something_else.cmake
  - include
    - project
      - lib.hpp
  - src
    - CMakeLists.txt
    - lib.cpp
  - apps
    - CMakeLists.txt
    - app.cpp
  - tests
    - CMakeLists.txt
    - testlib.cpp
  - docs
    - CMakeLists.txt
  - extern
    - googletest
  - scripts
    - helper.py
```

The names are not absolute; you'll see contention about `test/` vs. `tests/`, and the application folder may be called something else (or not exist for a library-only project). You'll also sometime see a `python` folder for python bindings, or a `cmake` folder for helper CMake files, like `Find<library>.cmake` files. But the basics are there.

Notice a few things already apparent; the `CMakeLists.txt` files are split up over all source directories, and are not in the include directories. This is because you should be able to copy the contents of the include directory to `/usr/include` or similar directly (except for configuration headers, which I go over in another chapter), and not have any extra files or cause any conflicts. That's also why there is a directory for your project inside the include directory. Use `add_subdirectory` to add a subdirectory containing a `CMakeLists.txt`.

You often want a `cmake` folder, with all of your helper modules. This is where your `Find*.cmake` files go. An set of some common helpers is at [github.com/CLIUtils/cmake](https://github.com/CLIUtils/cmake). To add this folder to your CMake path:

```cmake
set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake" ${CMAKE_MODULE_PATH})
```

Your `extern` folder should contain git submodules almost exclusively. That way, you can control the version of the dependencies explicitly, but still upgrade easily. See the Testing chapter for an example of adding a submodule.

You should have something like `/build*` in your `.gitignore`, so that users can make build directories in the source directory and use those to build. A few packages prohibit this, but it's much better than doing a true out-of-source build and having to type something different for each package you build.

If you want to avoid the build directory being in a valid source directory, add this near the top of your CMakeLists:

```cmake
### Require out-of-source builds
file(TO_CMAKE_PATH "${PROJECT_BINARY_DIR}/CMakeLists.txt" LOC_PATH)
if(EXISTS "${LOC_PATH}")
    message(FATAL_ERROR "You cannot build in a source directory (or any directory with a CMakeLists.txt file). Please make a build subdirectory. Feel free to remove CMakeCache.txt and CMakeFiles.")
endif()
```
