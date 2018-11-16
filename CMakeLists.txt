cmake_minimum_required(VERSION 3.12 FATAL_ERROR)

project(ProjectX)

set(CMAKE_CXX_STANDARD 17)

list(APPEND  CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/CMake/Modules)

enable_testing()

include(googletest)

if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU" OR
    "${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
	set(warnings "-Wall -Wextra -Werror")
elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
	set(warnings "/W4 /WX /EHsc")
endif()
if (NOT CONFIGURED_ONCE)
	set(CMAKE_CXX_FLAGS "${warnings}"
		CACHE STRING "Flags used by the compiler during all build types." FORCE)
	set(CMAKE_C_FLAGS "${warnings}"
		CACHE STRING "Flags used by the compiler during all build types." FORCE)
endif()

include_directories(${CMAKE_CURRENT_SOURCE_DIR})

add_subdirectory(Core)

add_executable(ProjectX main.cpp)

target_link_libraries(ProjectX libCore)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ./build)

set(CONFIGURED_ONCE TRUE CACHE INTERNAL
        "Show whether CMake has configured at least once.")

