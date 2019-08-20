


echo off & color 0A

::指定起始文件夹

set SRCDIR="../../msg/flatbuffer/"
set CSHARP_C_DSTDIR="../../client/unity_skynet_sample_2/Assets/Scripts/Msg/"
set LUA_S_DSTDIR="../../server/skynet-1.2.0/game/msg/"

echo "SrcDir"
echo %SRCDIR%

echo "Lua_Server_DstDir"
echo %LUA_S_DSTDIR%

:: 参数 /R 表示需要遍历子文件夹,去掉表示不遍历子文件夹

:: %%f 是一个变量,类似于迭代器,但是这个变量只能由一个字母组成,前面带上%%

:: 括号中是通配符,可以指定后缀名,*.*表示所有文件

for /R %SRCDIR% %%f in (*.fbs) do ( 
    echo %%f
    flatc --csharp -o %CSHARP_C_DSTDIR% %%f
    flatc --lua -o %LUA_S_DSTDIR% %%f
)

pause








