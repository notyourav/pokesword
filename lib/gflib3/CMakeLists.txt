project(gflib3 CXX ASM)

add_library(gflib3 OBJECT
  include/core/engine/memory_object.h

  include/mem/memory_resource.h
  src/mem/memory_resource.cpp

  include/core/singleton.h
  src/core/singleton.cpp
)

target_compile_options(gflib3 PRIVATE -fno-exceptions)
target_compile_options(gflib3 PRIVATE -fno-strict-aliasing)
target_compile_options(gflib3 PRIVATE -Wno-invalid-offsetof)
target_include_directories(gflib3 PUBLIC include/)

if(NOT TARGET NintendoSDK)
  add_subdirectory(../NintendoSDK)
endif()
target_link_libraries(gflib3 PUBLIC NintendoSDK)