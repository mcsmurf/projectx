cmake_minimum_required(VERSION 3.12 FATAL_ERROR)

set(CMAKE_CXX_STANDARD 17)

set(GOOGLETEST_DIR "../googletest"
	CACHE PATH "The path to GoogleTest test framework root directory.")

set(GMOCK_DIR "../googletest/googlemock"
	CACHE PATH "The path to GoogleMock test framework.")
set(GTEST_DIR "../googletest/googletest"
	CACHE PATH "The path to Googletest test framework.")

if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
	option(gtest_force_shared_crt
			"Use shared (DLL) run-time lib even when Googe Test is built as static lib."
			ON)
elseif (APPLE)
	add_definitions(-DGTEST_USE_OWN_TRI_TUPLE=1)
endif()

add_subdirectory(${GOOGLETEST_DIR} ${CMAKE_BINARY_DIR}/googletest)

include_directories(SYSTEM ${GMOCK_DIR}/include
							 ${GTEST_DIR}/include)


find_library(CORE_LIBRARY libCore  HINTS ${CMAKE_SOURCE_DIR}/Core)

function(add_googletest target)
	add_executable(${target} ${ARGN})
	target_link_libraries(${target} gtest gtest_main)

	add_test(${target} ${target})

	add_custom_command(TARGET ${target}
						POST_BUILD
						COMMAND ${target}
						WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
						COMMENT "Running ${target}" VERBATIM)
endfunction()