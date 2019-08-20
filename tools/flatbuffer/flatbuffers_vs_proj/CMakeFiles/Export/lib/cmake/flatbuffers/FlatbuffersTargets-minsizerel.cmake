#----------------------------------------------------------------
# Generated CMake target import file for configuration "MinSizeRel".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "flatbuffers::flatbuffers" for configuration "MinSizeRel"
set_property(TARGET flatbuffers::flatbuffers APPEND PROPERTY IMPORTED_CONFIGURATIONS MINSIZEREL)
set_target_properties(flatbuffers::flatbuffers PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_MINSIZEREL "CXX"
  IMPORTED_LOCATION_MINSIZEREL "${_IMPORT_PREFIX}/lib/flatbuffers.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS flatbuffers::flatbuffers )
list(APPEND _IMPORT_CHECK_FILES_FOR_flatbuffers::flatbuffers "${_IMPORT_PREFIX}/lib/flatbuffers.lib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
