cmake_minimum_required(VERSION 3.12 FATAL_ERROR)

add_googletest(libCoreTest libCoreTest.cpp)

target_link_libraries(libCoreTest libCore)
