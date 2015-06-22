# Install script for directory: /Users/bpolania/hackathons/NBC-Universal-Orlando-032015/opencv/opencv/data

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/Users/bpolania/hackathons/NBC-Universal-Orlando-032015/opencv/ios/build/iPhoneOS-armv7s/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "libs")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/OpenCV/haarcascades" TYPE FILE FILES
    "/Users/bpolania/hackathons/NBC-Universal-Orlando-032015/opencv/opencv/data/haarcascades/haarcascade_eye.xml"
    "/Users/bpolania/hackathons/NBC-Universal-Orlando-032015/opencv/opencv/data/haarcascades/haarcascade_eye_tree_eyeglasses.xml"
    "/Users/bpolania/hackathons/NBC-Universal-Orlando-032015/opencv/opencv/data/haarcascades/haarcascade_frontalcatface.xml"
    "/Users/bpolania/hackathons/NBC-Universal-Orlando-032015/opencv/opencv/data/haarcascades/haarcascade_frontalcatface_extended.xml"
    "/Users/bpolania/hackathons/NBC-Universal-Orlando-032015/opencv/opencv/data/haarcascades/haarcascade_frontalface_alt.xml"
    "/Users/bpolania/hackathons/NBC-Universal-Orlando-032015/opencv/opencv/data/haarcascades/haarcascade_frontalface_alt2.xml"
    "/Users/bpolania/hackathons/NBC-Universal-Orlando-032015/opencv/opencv/data/haarcascades/haarcascade_frontalface_alt_tree.xml"
    "/Users/bpolania/hackathons/NBC-Universal-Orlando-032015/opencv/opencv/data/haarcascades/haarcascade_frontalface_default.xml"
    "/Users/bpolania/hackathons/NBC-Universal-Orlando-032015/opencv/opencv/data/haarcascades/haarcascade_fullbody.xml"
    "/Users/bpolania/hackathons/NBC-Universal-Orlando-032015/opencv/opencv/data/haarcascades/haarcascade_lefteye_2splits.xml"
    "/Users/bpolania/hackathons/NBC-Universal-Orlando-032015/opencv/opencv/data/haarcascades/haarcascade_licence_plate_rus_16stages.xml"
    "/Users/bpolania/hackathons/NBC-Universal-Orlando-032015/opencv/opencv/data/haarcascades/haarcascade_lowerbody.xml"
    "/Users/bpolania/hackathons/NBC-Universal-Orlando-032015/opencv/opencv/data/haarcascades/haarcascade_profileface.xml"
    "/Users/bpolania/hackathons/NBC-Universal-Orlando-032015/opencv/opencv/data/haarcascades/haarcascade_righteye_2splits.xml"
    "/Users/bpolania/hackathons/NBC-Universal-Orlando-032015/opencv/opencv/data/haarcascades/haarcascade_russian_plate_number.xml"
    "/Users/bpolania/hackathons/NBC-Universal-Orlando-032015/opencv/opencv/data/haarcascades/haarcascade_smile.xml"
    "/Users/bpolania/hackathons/NBC-Universal-Orlando-032015/opencv/opencv/data/haarcascades/haarcascade_upperbody.xml"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "libs")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/OpenCV/lbpcascades" TYPE FILE FILES
    "/Users/bpolania/hackathons/NBC-Universal-Orlando-032015/opencv/opencv/data/lbpcascades/lbpcascade_frontalcatface.xml"
    "/Users/bpolania/hackathons/NBC-Universal-Orlando-032015/opencv/opencv/data/lbpcascades/lbpcascade_frontalface.xml"
    "/Users/bpolania/hackathons/NBC-Universal-Orlando-032015/opencv/opencv/data/lbpcascades/lbpcascade_profileface.xml"
    "/Users/bpolania/hackathons/NBC-Universal-Orlando-032015/opencv/opencv/data/lbpcascades/lbpcascade_silverware.xml"
    )
endif()

