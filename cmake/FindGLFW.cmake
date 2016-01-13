
# GLFW_FOUND
# GLFW_INCLUDE_DIR
# GLFW_LIBRARY

# GLFW_BINARY (win32 only)


find_path(GLFW_INCLUDE_DIR GLFW/glfw3.h

    PATHS
    $ENV{GLFW_DIR}
    /usr
    /usr/local
    /usr/include/GL
    /sw
    /opt/local
    /opt/graphics/OpenGL
    /opt/graphics/OpenGL/contrib/libglfw

    PATH_SUFFIXES
    /include

    DOC "The directory where GLFW/glfw.h resides")

find_library(GLFW_LIBRARY NAMES glfw3 glfw glfw3dll glfwdll

    PATHS
    $ENV{GLFW_DIR}
    /lib/x64
    /lib/cocoa
    /usr
    /usr/local
    /sw
    /opt/local

    PATH_SUFFIXES
    /lib
    /lib64

    DOC "The GLFW library")
    
if(WIN32)

    find_file(GLFW_BINARY glfw3.dll

        HINTS
        ${GLFW_INCLUDE_DIR}/..

        PATHS
        $ENV{GLFW_DIR}
        /lib/x64
        /lib/cocoa

        PATH_SUFFIXES
        /lib
        /bin

        DOC "The GLFW binary")

endif()

if(APPLE)
    set(GLFW_cocoa_LIBRARY "-framework Cocoa" CACHE STRING "Cocoa framework for OSX")
    set(GLFW_iokit_LIBRARY "-framework IOKit" CACHE STRING "IOKit framework for OSX")
endif()

# GLFW is required to link statically for now (no deploy specified)

find_package_handle_standard_args(GLFW DEFAULT_MSG GLFW_LIBRARY GLFW_INCLUDE_DIR)
mark_as_advanced(GLFW_FOUND GLFW_INCLUDE_DIR GLFW_LIBRARY)
