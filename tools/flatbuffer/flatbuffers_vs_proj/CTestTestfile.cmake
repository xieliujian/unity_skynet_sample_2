# CMake generated Testfile for 
# Source directory: D:/Xieliujian/UnityFramework/trunk/Tools/flatbuffer/flatbuffers-1.11.0
# Build directory: D:/Xieliujian/UnityFramework/trunk/Tools/flatbuffer/flatbuffers_vs_proj
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
if("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  add_test(flattests "D:/Xieliujian/UnityFramework/trunk/Tools/flatbuffer/flatbuffers_vs_proj/Debug/flattests.exe")
  set_tests_properties(flattests PROPERTIES  _BACKTRACE_TRIPLES "D:/Xieliujian/UnityFramework/trunk/Tools/flatbuffer/flatbuffers-1.11.0/CMakeLists.txt;444;add_test;D:/Xieliujian/UnityFramework/trunk/Tools/flatbuffer/flatbuffers-1.11.0/CMakeLists.txt;0;")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(flattests "D:/Xieliujian/UnityFramework/trunk/Tools/flatbuffer/flatbuffers_vs_proj/Release/flattests.exe")
  set_tests_properties(flattests PROPERTIES  _BACKTRACE_TRIPLES "D:/Xieliujian/UnityFramework/trunk/Tools/flatbuffer/flatbuffers-1.11.0/CMakeLists.txt;444;add_test;D:/Xieliujian/UnityFramework/trunk/Tools/flatbuffer/flatbuffers-1.11.0/CMakeLists.txt;0;")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  add_test(flattests "D:/Xieliujian/UnityFramework/trunk/Tools/flatbuffer/flatbuffers_vs_proj/MinSizeRel/flattests.exe")
  set_tests_properties(flattests PROPERTIES  _BACKTRACE_TRIPLES "D:/Xieliujian/UnityFramework/trunk/Tools/flatbuffer/flatbuffers-1.11.0/CMakeLists.txt;444;add_test;D:/Xieliujian/UnityFramework/trunk/Tools/flatbuffer/flatbuffers-1.11.0/CMakeLists.txt;0;")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  add_test(flattests "D:/Xieliujian/UnityFramework/trunk/Tools/flatbuffer/flatbuffers_vs_proj/RelWithDebInfo/flattests.exe")
  set_tests_properties(flattests PROPERTIES  _BACKTRACE_TRIPLES "D:/Xieliujian/UnityFramework/trunk/Tools/flatbuffer/flatbuffers-1.11.0/CMakeLists.txt;444;add_test;D:/Xieliujian/UnityFramework/trunk/Tools/flatbuffer/flatbuffers-1.11.0/CMakeLists.txt;0;")
else()
  add_test(flattests NOT_AVAILABLE)
endif()
