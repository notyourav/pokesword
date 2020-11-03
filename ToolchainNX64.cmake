if (NOT DEFINED ENV{POKESWORD_CLANG})
    message(FATAL_ERROR "Please define the POKESWORD_CLANG env variable. It should point to a path such that $POKESWORD_CLANG/bin/clang exists")
endif()

if (NOT DEFINED ENV{DEVKITA64})
    message(FATAL_ERROR "Please define the DEVKITA64 env variable.")
endif()

set(POKESWORD_CLANG "$ENV{POKESWORD_CLANG}")
set(DEVKITA64 "$ENV{DEVKITA64}")
set(NX64_OPT_FLAGS "-O3 -g")
set(triple aarch64-none-elf)

set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_VERSION 1)
set(CMAKE_SYSTEM_PROCESSOR aarch64)

set(CMAKE_SYSROOT ${POKESWORD_CLANG})
set(CMAKE_C_COMPILER "${POKESWORD_CLANG}/bin/clang")
set(CMAKE_C_COMPILER_TARGET ${triple})
set(CMAKE_CXX_COMPILER "${POKESWORD_CLANG}/bin/clang++")
set(CMAKE_CXX_COMPILER_TARGET ${triple})

set(CMAKE_C_FLAGS_RELEASE ${NX64_OPT_FLAGS})
set(CMAKE_CXX_FLAGS_RELEASE ${NX64_OPT_FLAGS})
set(CMAKE_C_FLAGS_RELWITHDEBINFO ${NX64_OPT_FLAGS})
set(CMAKE_CXX_FLAGS_RELWITHDEBINFO ${NX64_OPT_FLAGS})

set(ARCH "-mcpu=cortex-a57+fp+simd+crypto+crc")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${ARCH} -isystem ${DEVKITA64}/aarch64-none-elf/include")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -isystem ${POKESWORD_CLANG}/include/c++/v1 -D _LIBCPP_HAS_THREAD_API_PTHREAD ${CMAKE_C_FLAGS}")
set(CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS} -x assembler-with-cpp ${ARCH}")

add_compile_options(-B ${DEVKITA64}/bin -fPIC -stdlib=libc++ -mno-implicit-float)
add_link_options(-fPIC -Wl,-Bsymbolic-functions -shared -nodefaultlibs)
add_definitions(-D SWITCH -D __DEVKITA64__ -D __ELF__)
add_definitions(-D NNSDK)
add_definitions(-D MATCHING_HACK_NX_CLANG)

# Helps with matching as this causes Clang to emit debug type info even for dynamic classes
# with undefined vtables.
add_compile_options(-fstandalone-debug)
