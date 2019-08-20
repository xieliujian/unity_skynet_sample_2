using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using System.IO;

namespace gtmEditor
{
    public class Menu : Editor
    {
        private static void RunBat(string batFile, string workingDir)
        {
            var path = Util.FormatPath(workingDir);

            if (!Directory.Exists(path))
            {
                Debug.LogError(string.Format("bat文件[%s]不存在：", path));
            }
            else
            {
                Util.RunBat(batFile, "", path);
            }
        }

        [MenuItem("unityframework/flatbuffer_gen.bat")]
        private static void Run()
        {
            // 执行bat脚本
            RunBat("flatbuffer_gen.bat", Application.dataPath + "/../../../Tools/flatbuffer/");
        }
    }
}

