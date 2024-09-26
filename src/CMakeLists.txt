cmake_minimum_required(VERSION 3.15)

project(src)

set(BUILD_EXAMPLES OFF)
add_subdirectory(Effekseer)
set_property(TARGET Effekseer PROPERTY C_STANDARD 17)

add_subdirectory(Core)
