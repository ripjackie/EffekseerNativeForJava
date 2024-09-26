cmake_minimum_required(VERSION 3.15)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

project(EffekseerJavaSwig)

if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release)
endif()

if(NOT BUILD_SHARED_LIBS)
    set(BUILD_SHARED_LIBS ON)
endif()

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_subdirectory(src)

unset(CMAKE_BUILD_TYPE CACHE)
