cmake_minimum_required(VERSION 3.15)
project(libzip_playgrund)

set(CMAKE_BUILD_TYPE Debug CACHE STRING "Build type" FORCE)

message(STATUS "CMAKE_BINARY_DIR: ${CMAKE_BINARY_DIR}")
list(APPEND CMAKE_PREFIX_PATH "${CMAKE_BINARY_DIR}")

add_executable(main main.cpp)

find_package(libzip REQUIRED)
target_link_libraries(main PRIVATE libzip::zip)