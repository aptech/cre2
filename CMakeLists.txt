# Copyright 2015 The RE2 Authors.  All Rights Reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

# Old enough to support Ubuntu Trusty.
cmake_minimum_required(VERSION 2.8.12)

project(CRE2 CXX)

set(PROJECT_VERSION "0.3.4")

set(CMAKE_INCLUDE_CURRENT_DIR ON)

add_subdirectory(re2)

if(CMAKE_CXX_COMPILER_ID MATCHES "MSVC")
  if(MSVC_VERSION LESS 1800)
    message(FATAL_ERROR "you need Visual Studio 2013 or later")
  endif()
  if(BUILD_SHARED_LIBS)
    # See http://www.kitware.com/blog/home/post/939 for details.
    cmake_minimum_required(VERSION 3.4)
    set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)
  endif()
  # CMake defaults to /W3, but some users like /W4 (or /Wall) and /WX,
  # so we disable various warnings that aren't particularly helpful.
  add_compile_options(/wd4100 /wd4201 /wd4456 /wd4457 /wd4702 /wd4815)
elseif(CYGWIN OR MINGW)
  # See https://stackoverflow.com/questions/38139631 for details.
  add_compile_options(-std=gnu++11)
  message(FATAL_ERROR "Cygwin/MinGW should not be used")
elseif(CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang")
  add_compile_options(-std=c++11)
endif()

if(WIN32)
  add_definitions(-DUNICODE -D_UNICODE -DSTRICT -DNOMINMAX)
  add_definitions(-D_CRT_SECURE_NO_WARNINGS -D_SCL_SECURE_NO_WARNINGS)
elseif(UNIX)
  add_compile_options(-pthread)
  list(APPEND EXTRA_TARGET_LINK_LIBRARIES -pthread)
endif()

#include_directories(src)

set(CRE2_SOURCES
    src/cre2.cpp
    )

add_library(cre2 STATIC ${CRE2_SOURCES})

target_include_directories(cre2 PUBLIC $<INSTALL_INTERFACE:include/cre2> INTERFACE $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/src>)
target_link_libraries(cre2 PUBLIC re2)

set(CRE2_HEADERS
    src/cre2.h
    )

#set(CRE2_TEST_TARGETS test-consume-match test-easy-matching test-find-and-consume-match test-full-match test-matching test-misc test-options test-partial-match test-replace test-rex-alloc test-set test-version)
#
#foreach(target ${CRE2_TEST_TARGETS})
#  add_executable(${target} tests/${target}.c)
#  target_link_libraries(${target} cre2)
#  target_include_directories(${target} PRIVATE tests)
#  add_test(NAME ${target} COMMAND ${target})
#endforeach(target)

install(FILES ${CRE2_HEADERS} DESTINATION include/cre2)
install(TARGETS cre2 EXPORT CRE2Config ARCHIVE DESTINATION lib LIBRARY DESTINATION lib RUNTIME DESTINATION bin)
install(EXPORT CRE2Config DESTINATION cmake)
