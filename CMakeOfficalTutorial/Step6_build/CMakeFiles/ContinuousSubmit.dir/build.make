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
CMAKE_SOURCE_DIR = /home/kk/ImageProcessingOpenCV/CMakeOfficalTutorial/Step6

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/kk/ImageProcessingOpenCV/CMakeOfficalTutorial/Step6_build

# Utility rule file for ContinuousSubmit.

# Include any custom commands dependencies for this target.
include CMakeFiles/ContinuousSubmit.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/ContinuousSubmit.dir/progress.make

CMakeFiles/ContinuousSubmit:
	/usr/bin/ctest -D ContinuousSubmit

ContinuousSubmit: CMakeFiles/ContinuousSubmit
ContinuousSubmit: CMakeFiles/ContinuousSubmit.dir/build.make
.PHONY : ContinuousSubmit

# Rule to build all files generated by this target.
CMakeFiles/ContinuousSubmit.dir/build: ContinuousSubmit
.PHONY : CMakeFiles/ContinuousSubmit.dir/build

CMakeFiles/ContinuousSubmit.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/ContinuousSubmit.dir/cmake_clean.cmake
.PHONY : CMakeFiles/ContinuousSubmit.dir/clean

CMakeFiles/ContinuousSubmit.dir/depend:
	cd /home/kk/ImageProcessingOpenCV/CMakeOfficalTutorial/Step6_build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/kk/ImageProcessingOpenCV/CMakeOfficalTutorial/Step6 /home/kk/ImageProcessingOpenCV/CMakeOfficalTutorial/Step6 /home/kk/ImageProcessingOpenCV/CMakeOfficalTutorial/Step6_build /home/kk/ImageProcessingOpenCV/CMakeOfficalTutorial/Step6_build /home/kk/ImageProcessingOpenCV/CMakeOfficalTutorial/Step6_build/CMakeFiles/ContinuousSubmit.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/ContinuousSubmit.dir/depend

