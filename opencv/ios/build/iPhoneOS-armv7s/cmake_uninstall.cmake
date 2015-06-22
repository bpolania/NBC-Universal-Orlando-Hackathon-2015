# -----------------------------------------------
# File that provides "make uninstall" target
#  We use the file 'install_manifest.txt'
# -----------------------------------------------
IF(NOT EXISTS "/Users/bpolania/hackathons/NBC-Universal-Orlando-032015/opencv/ios/build/iPhoneOS-armv7s/install_manifest.txt")
  MESSAGE(FATAL_ERROR "Cannot find install manifest: \"/Users/bpolania/hackathons/NBC-Universal-Orlando-032015/opencv/ios/build/iPhoneOS-armv7s/install_manifest.txt\"")
ENDIF(NOT EXISTS "/Users/bpolania/hackathons/NBC-Universal-Orlando-032015/opencv/ios/build/iPhoneOS-armv7s/install_manifest.txt")

FILE(READ "/Users/bpolania/hackathons/NBC-Universal-Orlando-032015/opencv/ios/build/iPhoneOS-armv7s/install_manifest.txt" files)
STRING(REGEX REPLACE "\n" ";" files "${files}")
FOREACH(file ${files})
  MESSAGE(STATUS "Uninstalling \"$ENV{DESTDIR}${file}\"")
  IF(EXISTS "$ENV{DESTDIR}${file}")
    EXEC_PROGRAM(
      "/usr/local/Cellar/cmake/3.1.3/bin/cmake" ARGS "-E remove \"$ENV{DESTDIR}${file}\""
      OUTPUT_VARIABLE rm_out
      RETURN_VALUE rm_retval
      )
    IF(NOT "${rm_retval}" STREQUAL 0)
      MESSAGE(FATAL_ERROR "Problem when removing \"$ENV{DESTDIR}${file}\"")
    ENDIF(NOT "${rm_retval}" STREQUAL 0)
  ELSE(EXISTS "$ENV{DESTDIR}${file}")
    MESSAGE(STATUS "File \"$ENV{DESTDIR}${file}\" does not exist.")
  ENDIF(EXISTS "$ENV{DESTDIR}${file}")
ENDFOREACH(file)
