cmake_minimum_required(VERSION 3.13)
project(pokesword CXX)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
  add_compile_options(-fdiagnostics-color=always)
elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
  add_compile_options(-fcolor-diagnostics)
endif()

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

add_executable(pokesword)
target_include_directories(pokesword PRIVATE src)
target_compile_options(pokesword PRIVATE -fno-rtti -fno-exceptions)
target_compile_options(pokesword PRIVATE -Wall -Wextra)
target_compile_options(pokesword PRIVATE -fno-strict-aliasing)
target_compile_options(pokesword PRIVATE -Wno-invalid-offsetof)

add_subdirectory(lib/NintendoSDK)
target_link_libraries(pokesword PUBLIC NintendoSDK)

add_subdirectory(lib/gflib3)
target_link_libraries(pokesword PUBLIC gflib3)

add_subdirectory(prog)