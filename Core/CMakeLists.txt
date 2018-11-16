cmake_minimum_required(VERSION 3.12 FATAL_ERROR)

add_library(libCore core.cpp core.hpp)

add_subdirectory(UnitTests)