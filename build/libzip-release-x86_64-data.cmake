########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

list(APPEND libzip_COMPONENT_NAMES libzip::zip)
list(REMOVE_DUPLICATES libzip_COMPONENT_NAMES)
if(DEFINED libzip_FIND_DEPENDENCY_NAMES)
  list(APPEND libzip_FIND_DEPENDENCY_NAMES BZip2 LibLZMA OpenSSL ZLIB zstd)
  list(REMOVE_DUPLICATES libzip_FIND_DEPENDENCY_NAMES)
else()
  set(libzip_FIND_DEPENDENCY_NAMES BZip2 LibLZMA OpenSSL ZLIB zstd)
endif()
set(BZip2_FIND_MODE "NO_MODULE")
set(LibLZMA_FIND_MODE "NO_MODULE")
set(OpenSSL_FIND_MODE "NO_MODULE")
set(ZLIB_FIND_MODE "NO_MODULE")
set(zstd_FIND_MODE "NO_MODULE")

########### VARIABLES #######################################################################
#############################################################################################
set(libzip_PACKAGE_FOLDER_RELEASE "/home/xichuz/.conan2/p/libzi72506b8c38edf/p")
set(libzip_BUILD_MODULES_PATHS_RELEASE )


set(libzip_INCLUDE_DIRS_RELEASE "${libzip_PACKAGE_FOLDER_RELEASE}/include")
set(libzip_RES_DIRS_RELEASE )
set(libzip_DEFINITIONS_RELEASE )
set(libzip_SHARED_LINK_FLAGS_RELEASE )
set(libzip_EXE_LINK_FLAGS_RELEASE )
set(libzip_OBJECTS_RELEASE )
set(libzip_COMPILE_DEFINITIONS_RELEASE )
set(libzip_COMPILE_OPTIONS_C_RELEASE )
set(libzip_COMPILE_OPTIONS_CXX_RELEASE )
set(libzip_LIB_DIRS_RELEASE "${libzip_PACKAGE_FOLDER_RELEASE}/lib")
set(libzip_BIN_DIRS_RELEASE )
set(libzip_LIBRARY_TYPE_RELEASE STATIC)
set(libzip_IS_HOST_WINDOWS_RELEASE 0)
set(libzip_LIBS_RELEASE zip)
set(libzip_SYSTEM_LIBS_RELEASE )
set(libzip_FRAMEWORK_DIRS_RELEASE )
set(libzip_FRAMEWORKS_RELEASE )
set(libzip_BUILD_DIRS_RELEASE )
set(libzip_NO_SONAME_MODE_RELEASE FALSE)


# COMPOUND VARIABLES
set(libzip_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${libzip_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${libzip_COMPILE_OPTIONS_C_RELEASE}>")
set(libzip_LINKER_FLAGS_RELEASE
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${libzip_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${libzip_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${libzip_EXE_LINK_FLAGS_RELEASE}>")


set(libzip_COMPONENTS_RELEASE libzip::zip)
########### COMPONENT libzip::zip VARIABLES ############################################

set(libzip_libzip_zip_INCLUDE_DIRS_RELEASE "${libzip_PACKAGE_FOLDER_RELEASE}/include")
set(libzip_libzip_zip_LIB_DIRS_RELEASE "${libzip_PACKAGE_FOLDER_RELEASE}/lib")
set(libzip_libzip_zip_BIN_DIRS_RELEASE )
set(libzip_libzip_zip_LIBRARY_TYPE_RELEASE STATIC)
set(libzip_libzip_zip_IS_HOST_WINDOWS_RELEASE 0)
set(libzip_libzip_zip_RES_DIRS_RELEASE )
set(libzip_libzip_zip_DEFINITIONS_RELEASE )
set(libzip_libzip_zip_OBJECTS_RELEASE )
set(libzip_libzip_zip_COMPILE_DEFINITIONS_RELEASE )
set(libzip_libzip_zip_COMPILE_OPTIONS_C_RELEASE "")
set(libzip_libzip_zip_COMPILE_OPTIONS_CXX_RELEASE "")
set(libzip_libzip_zip_LIBS_RELEASE zip)
set(libzip_libzip_zip_SYSTEM_LIBS_RELEASE )
set(libzip_libzip_zip_FRAMEWORK_DIRS_RELEASE )
set(libzip_libzip_zip_FRAMEWORKS_RELEASE )
set(libzip_libzip_zip_DEPENDENCIES_RELEASE ZLIB::ZLIB BZip2::BZip2 LibLZMA::LibLZMA zstd::libzstd_static OpenSSL::Crypto)
set(libzip_libzip_zip_SHARED_LINK_FLAGS_RELEASE )
set(libzip_libzip_zip_EXE_LINK_FLAGS_RELEASE )
set(libzip_libzip_zip_NO_SONAME_MODE_RELEASE FALSE)

# COMPOUND VARIABLES
set(libzip_libzip_zip_LINKER_FLAGS_RELEASE
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${libzip_libzip_zip_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${libzip_libzip_zip_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${libzip_libzip_zip_EXE_LINK_FLAGS_RELEASE}>
)
set(libzip_libzip_zip_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${libzip_libzip_zip_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${libzip_libzip_zip_COMPILE_OPTIONS_C_RELEASE}>")