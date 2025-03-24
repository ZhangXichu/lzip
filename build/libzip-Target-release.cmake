# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(libzip_FRAMEWORKS_FOUND_RELEASE "") # Will be filled later
conan_find_apple_frameworks(libzip_FRAMEWORKS_FOUND_RELEASE "${libzip_FRAMEWORKS_RELEASE}" "${libzip_FRAMEWORK_DIRS_RELEASE}")

set(libzip_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET libzip_DEPS_TARGET)
    add_library(libzip_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET libzip_DEPS_TARGET
             APPEND PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Release>:${libzip_FRAMEWORKS_FOUND_RELEASE}>
             $<$<CONFIG:Release>:${libzip_SYSTEM_LIBS_RELEASE}>
             $<$<CONFIG:Release>:ZLIB::ZLIB;BZip2::BZip2;LibLZMA::LibLZMA;zstd::libzstd_static;OpenSSL::Crypto>)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### libzip_DEPS_TARGET to all of them
conan_package_library_targets("${libzip_LIBS_RELEASE}"    # libraries
                              "${libzip_LIB_DIRS_RELEASE}" # package_libdir
                              "${libzip_BIN_DIRS_RELEASE}" # package_bindir
                              "${libzip_LIBRARY_TYPE_RELEASE}"
                              "${libzip_IS_HOST_WINDOWS_RELEASE}"
                              libzip_DEPS_TARGET
                              libzip_LIBRARIES_TARGETS  # out_libraries_targets
                              "_RELEASE"
                              "libzip"    # package_name
                              "${libzip_NO_SONAME_MODE_RELEASE}")  # soname

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${libzip_BUILD_DIRS_RELEASE} ${CMAKE_MODULE_PATH})

########## COMPONENTS TARGET PROPERTIES Release ########################################

    ########## COMPONENT libzip::zip #############

        set(libzip_libzip_zip_FRAMEWORKS_FOUND_RELEASE "")
        conan_find_apple_frameworks(libzip_libzip_zip_FRAMEWORKS_FOUND_RELEASE "${libzip_libzip_zip_FRAMEWORKS_RELEASE}" "${libzip_libzip_zip_FRAMEWORK_DIRS_RELEASE}")

        set(libzip_libzip_zip_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET libzip_libzip_zip_DEPS_TARGET)
            add_library(libzip_libzip_zip_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET libzip_libzip_zip_DEPS_TARGET
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${libzip_libzip_zip_FRAMEWORKS_FOUND_RELEASE}>
                     $<$<CONFIG:Release>:${libzip_libzip_zip_SYSTEM_LIBS_RELEASE}>
                     $<$<CONFIG:Release>:${libzip_libzip_zip_DEPENDENCIES_RELEASE}>
                     )

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'libzip_libzip_zip_DEPS_TARGET' to all of them
        conan_package_library_targets("${libzip_libzip_zip_LIBS_RELEASE}"
                              "${libzip_libzip_zip_LIB_DIRS_RELEASE}"
                              "${libzip_libzip_zip_BIN_DIRS_RELEASE}" # package_bindir
                              "${libzip_libzip_zip_LIBRARY_TYPE_RELEASE}"
                              "${libzip_libzip_zip_IS_HOST_WINDOWS_RELEASE}"
                              libzip_libzip_zip_DEPS_TARGET
                              libzip_libzip_zip_LIBRARIES_TARGETS
                              "_RELEASE"
                              "libzip_libzip_zip"
                              "${libzip_libzip_zip_NO_SONAME_MODE_RELEASE}")


        ########## TARGET PROPERTIES #####################################
        set_property(TARGET libzip::zip
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${libzip_libzip_zip_OBJECTS_RELEASE}>
                     $<$<CONFIG:Release>:${libzip_libzip_zip_LIBRARIES_TARGETS}>
                     )

        if("${libzip_libzip_zip_LIBS_RELEASE}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET libzip::zip
                         APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                         libzip_libzip_zip_DEPS_TARGET)
        endif()

        set_property(TARGET libzip::zip APPEND PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Release>:${libzip_libzip_zip_LINKER_FLAGS_RELEASE}>)
        set_property(TARGET libzip::zip APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Release>:${libzip_libzip_zip_INCLUDE_DIRS_RELEASE}>)
        set_property(TARGET libzip::zip APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                     $<$<CONFIG:Release>:${libzip_libzip_zip_LIB_DIRS_RELEASE}>)
        set_property(TARGET libzip::zip APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Release>:${libzip_libzip_zip_COMPILE_DEFINITIONS_RELEASE}>)
        set_property(TARGET libzip::zip APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Release>:${libzip_libzip_zip_COMPILE_OPTIONS_RELEASE}>)


    ########## AGGREGATED GLOBAL TARGET WITH THE COMPONENTS #####################
    set_property(TARGET libzip::zip APPEND PROPERTY INTERFACE_LINK_LIBRARIES libzip::zip)

########## For the modules (FindXXX)
set(libzip_LIBRARIES_RELEASE libzip::zip)
