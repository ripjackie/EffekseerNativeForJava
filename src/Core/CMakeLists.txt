cmake_minimum_required(VERSION 3.15)

project(EffekseerCore C CXX)

FIND_PACKAGE(Threads REQUIRED)

add_library(
  EffekseerCore
  STATIC
  EffekseerBackendCore.h
  EffekseerBackendCore.cpp
  EffekseerEffectCore.h
  EffekseerEffectCore.cpp
  EffekseerManagerCore.h
  EffekseerManagerCore.cpp
)

target_include_directories(
  EffekseerCore
  PUBLIC
  ../Effekseer/Dev/Cpp/Effekseer/
  ../Effekseer/Dev/Cpp/EffekseerRendererGL/
)

target_link_libraries(
  EffekseerCore
  PUBLIC
  Effekseer
)

if(WIN32)
  target_include_directories(
    EffekseerCore
    PUBLIC
    ../Effekseer/Dev/Cpp/EffekseerRendererDX9/
    ../Effekseer/Dev/Cpp/EffekseerRendererDX11/
  )

  target_link_libraries(
    EffekseerCore
    PUBLIC
    EffekseerRendererDX9
    EffekseerRendererDX11
  )
endif()

target_compile_features(EffekseerCore PUBLIC cxx_std_14)

if(NOT WIN32)
  find_package(OpenGL REQUIRED)
  target_link_libraries(
    EffekseerCore
    PUBLIC
    OpenGL::GL
  )
endif()

target_link_libraries(
  EffekseerCore
  PUBLIC
  EffekseerRendererGL
)

find_package(SWIG)
find_package(JNI)

if(${SWIG_FOUND} AND ${JNI_FOUND})
    include(UseSWIG)
    set_property(SOURCE EffekseerCore.i PROPERTY CPLUSPLUS ON)

    swig_add_library(EffekseerNativeForJava
        TYPE USE_BUILD_SHARED_LIBS
        LANGUAGE Java
        SOURCES EffekseerCore.i
    )

    set_property(TARGET EffekseerNativeForJava PROPERTY C_STANDARD 17)

    target_include_directories(EffekseerNativeForJava
        PRIVATE
      ../Effekseer/Dev/Cpp/Effekseer/
      ../Effekseer/Dev/Cpp/EffekseerRendererGL/
      ${CMAKE_CURRENT_SOURCE_DIR}
      ${JNI_INCLUDE_DIRS}
    )

    target_link_libraries(EffekseerNativeForJava
        PUBLIC
        EffekseerCore
    )
elseif(NOT ${JNI_FOUND})
    message(FATAL_ERROR "Failed to find JNI. Is JAVA_HOME Set?")
elseif(NOT ${SWIG_FOUND})
    message(FATAL_ERROR "Failed to find Swig binary.")
endif()
