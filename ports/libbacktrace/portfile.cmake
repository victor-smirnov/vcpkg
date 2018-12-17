include(vcpkg_common_functions)

if(NOT (VCPKG_CMAKE_SYSTEM_NAME STREQUAL "Linux"))
    message(FATAL_ERROR "${PORT} currently support Linux only")
endif()



vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO ianlancetaylor/libbacktrace
  REF 5a99ff7fed66b8ea8f09c9805c138524a7035ece
  SHA512 e168600b674a1a9bc44bd75d0187a152331bb72cd933b0d52af5a61a22cf2457cab6ae774c547a3a24d342c76146ede34bf41378e6168c544db298bdcdfce22a
  HEAD_REF master
)

file(COPY ${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt DESTINATION ${SOURCE_PATH})


vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
)

vcpkg_install_cmake()
vcpkg_copy_pdbs()

#file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)


#if(VCPKG_LIBRARY_LINKAGE STREQUAL static)
#  file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/bin ${CURRENT_PACKAGES_DIR}/debug/bin)
#endif()

# Handle copyright
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/libbacktrace RENAME copyright)

# Handle includes separately
file(COPY ${SOURCE_PATH}/backtrace.h DESTINATION ${CURRENT_PACKAGES_DIR}/include)
file(COPY ${SOURCE_PATH}/backtrace-supported.h DESTINATION ${CURRENT_PACKAGES_DIR}/include)