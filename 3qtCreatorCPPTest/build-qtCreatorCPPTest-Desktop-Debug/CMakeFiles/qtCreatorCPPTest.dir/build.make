# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/wkx/Projects/qtCreatorCPPTest/qtCreatorCPPTest

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/wkx/Projects/qtCreatorCPPTest/build-qtCreatorCPPTest-Desktop-Debug

# Include any dependencies generated for this target.
include CMakeFiles/qtCreatorCPPTest.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/qtCreatorCPPTest.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/qtCreatorCPPTest.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/qtCreatorCPPTest.dir/flags.make

CMakeFiles/qtCreatorCPPTest.dir/main.cpp.o: CMakeFiles/qtCreatorCPPTest.dir/flags.make
CMakeFiles/qtCreatorCPPTest.dir/main.cpp.o: /home/wkx/Projects/qtCreatorCPPTest/qtCreatorCPPTest/main.cpp
CMakeFiles/qtCreatorCPPTest.dir/main.cpp.o: CMakeFiles/qtCreatorCPPTest.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wkx/Projects/qtCreatorCPPTest/build-qtCreatorCPPTest-Desktop-Debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/qtCreatorCPPTest.dir/main.cpp.o"
	/usr/bin/clang++-14 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/qtCreatorCPPTest.dir/main.cpp.o -MF CMakeFiles/qtCreatorCPPTest.dir/main.cpp.o.d -o CMakeFiles/qtCreatorCPPTest.dir/main.cpp.o -c /home/wkx/Projects/qtCreatorCPPTest/qtCreatorCPPTest/main.cpp

CMakeFiles/qtCreatorCPPTest.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/qtCreatorCPPTest.dir/main.cpp.i"
	/usr/bin/clang++-14 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wkx/Projects/qtCreatorCPPTest/qtCreatorCPPTest/main.cpp > CMakeFiles/qtCreatorCPPTest.dir/main.cpp.i

CMakeFiles/qtCreatorCPPTest.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/qtCreatorCPPTest.dir/main.cpp.s"
	/usr/bin/clang++-14 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wkx/Projects/qtCreatorCPPTest/qtCreatorCPPTest/main.cpp -o CMakeFiles/qtCreatorCPPTest.dir/main.cpp.s

CMakeFiles/qtCreatorCPPTest.dir/src/dog.cpp.o: CMakeFiles/qtCreatorCPPTest.dir/flags.make
CMakeFiles/qtCreatorCPPTest.dir/src/dog.cpp.o: /home/wkx/Projects/qtCreatorCPPTest/qtCreatorCPPTest/src/dog.cpp
CMakeFiles/qtCreatorCPPTest.dir/src/dog.cpp.o: CMakeFiles/qtCreatorCPPTest.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wkx/Projects/qtCreatorCPPTest/build-qtCreatorCPPTest-Desktop-Debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/qtCreatorCPPTest.dir/src/dog.cpp.o"
	/usr/bin/clang++-14 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/qtCreatorCPPTest.dir/src/dog.cpp.o -MF CMakeFiles/qtCreatorCPPTest.dir/src/dog.cpp.o.d -o CMakeFiles/qtCreatorCPPTest.dir/src/dog.cpp.o -c /home/wkx/Projects/qtCreatorCPPTest/qtCreatorCPPTest/src/dog.cpp

CMakeFiles/qtCreatorCPPTest.dir/src/dog.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/qtCreatorCPPTest.dir/src/dog.cpp.i"
	/usr/bin/clang++-14 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wkx/Projects/qtCreatorCPPTest/qtCreatorCPPTest/src/dog.cpp > CMakeFiles/qtCreatorCPPTest.dir/src/dog.cpp.i

CMakeFiles/qtCreatorCPPTest.dir/src/dog.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/qtCreatorCPPTest.dir/src/dog.cpp.s"
	/usr/bin/clang++-14 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wkx/Projects/qtCreatorCPPTest/qtCreatorCPPTest/src/dog.cpp -o CMakeFiles/qtCreatorCPPTest.dir/src/dog.cpp.s

# Object files for target qtCreatorCPPTest
qtCreatorCPPTest_OBJECTS = \
"CMakeFiles/qtCreatorCPPTest.dir/main.cpp.o" \
"CMakeFiles/qtCreatorCPPTest.dir/src/dog.cpp.o"

# External object files for target qtCreatorCPPTest
qtCreatorCPPTest_EXTERNAL_OBJECTS =

qtCreatorCPPTest: CMakeFiles/qtCreatorCPPTest.dir/main.cpp.o
qtCreatorCPPTest: CMakeFiles/qtCreatorCPPTest.dir/src/dog.cpp.o
qtCreatorCPPTest: CMakeFiles/qtCreatorCPPTest.dir/build.make
qtCreatorCPPTest: CMakeFiles/qtCreatorCPPTest.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/wkx/Projects/qtCreatorCPPTest/build-qtCreatorCPPTest-Desktop-Debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable qtCreatorCPPTest"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/qtCreatorCPPTest.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/qtCreatorCPPTest.dir/build: qtCreatorCPPTest
.PHONY : CMakeFiles/qtCreatorCPPTest.dir/build

CMakeFiles/qtCreatorCPPTest.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/qtCreatorCPPTest.dir/cmake_clean.cmake
.PHONY : CMakeFiles/qtCreatorCPPTest.dir/clean

CMakeFiles/qtCreatorCPPTest.dir/depend:
	cd /home/wkx/Projects/qtCreatorCPPTest/build-qtCreatorCPPTest-Desktop-Debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wkx/Projects/qtCreatorCPPTest/qtCreatorCPPTest /home/wkx/Projects/qtCreatorCPPTest/qtCreatorCPPTest /home/wkx/Projects/qtCreatorCPPTest/build-qtCreatorCPPTest-Desktop-Debug /home/wkx/Projects/qtCreatorCPPTest/build-qtCreatorCPPTest-Desktop-Debug /home/wkx/Projects/qtCreatorCPPTest/build-qtCreatorCPPTest-Desktop-Debug/CMakeFiles/qtCreatorCPPTest.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/qtCreatorCPPTest.dir/depend

