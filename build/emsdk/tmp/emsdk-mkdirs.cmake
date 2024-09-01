# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "C:/Users/chaitand/source/git repo/sunya/build/emsdk/src/emsdk"
  "C:/Users/chaitand/source/git repo/sunya/build/emsdk/src/emsdk-build"
  "C:/Users/chaitand/source/git repo/sunya/build/emsdk"
  "C:/Users/chaitand/source/git repo/sunya/build/emsdk/tmp"
  "C:/Users/chaitand/source/git repo/sunya/build/emsdk/src/emsdk-stamp"
  "C:/Users/chaitand/source/git repo/sunya/build/emsdk/src"
  "C:/Users/chaitand/source/git repo/sunya/build/emsdk/src/emsdk-stamp"
)

set(configSubDirs Debug;Release;MinSizeRel;RelWithDebInfo)
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "C:/Users/chaitand/source/git repo/sunya/build/emsdk/src/emsdk-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "C:/Users/chaitand/source/git repo/sunya/build/emsdk/src/emsdk-stamp${cfgdir}") # cfgdir has leading slash
endif()
