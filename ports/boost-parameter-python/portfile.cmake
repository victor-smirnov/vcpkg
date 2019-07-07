# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/parameter_python
    REF boost-1.70.0
    SHA512 d2f43ca744bedfdeda806c0d1b24216f4926401059450d12485dc2175e8731991476c1bb530d28c631d9bc034c7ce184b62daffe0c3a6449fc619ff5e3e4e2cb
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
