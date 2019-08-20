using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using gtmInterface;
using gtmEngine;
using gtmEngine.Net;
using FlatBuffers;

namespace gtmGame
{
    public class main : MonoBehaviour
    {
        private GameMgr m_gameMgr = new GameMgr();

        private LoginModel m_loginModel = new LoginModel();

        private ChatModel m_chatModel = new ChatModel();

        public string ipaddress = "192.168.0.104";

        // Start is called before the first frame update
        void Start()
        {
            m_gameMgr.DoInit();
            m_loginModel.DoInit();
            m_chatModel.DoInit();

            NetManager.instance.SendConnect(ipaddress, 8888);
        }

        // Update is called once per frame
        void Update()
        {
            m_gameMgr.DoUpdate();
        }

        private void OnDestroy()
        {
            m_loginModel.DoClose();
            m_gameMgr.DoClose();
            m_chatModel.DoClose();
        }

        private void OnGUI()
        {
            if (GUI.Button(new Rect(0, 0, 300, 200), "SendLoginMsg"))
            {
                SendLoginMsg();
            }

            if (GUI.Button(new Rect(0, 200, 300, 200), "SendChatMsg"))
            {
                SendChatMsg();
            }
        }

        private void SendChatMsg()
        {
            var builder = IMsgDispatcher.instance.flatBufferBuilder;
            var say = builder.CreateString("11111111111");
            fbs.ReqChat.StartReqChat(builder);
            fbs.ReqChat.AddSay(builder, say);
            var orc = fbs.ReqChat.EndReqChat(builder);
            builder.Finish(orc.Value);

            IMsgDispatcher.instance.SendFBMsg(fbs.ReqChat.HashID, builder);
        }

        private void SendLoginMsg()
        {
            var builder = IMsgDispatcher.instance.flatBufferBuilder;
            var account = builder.CreateString("xiexie");
            var password = builder.CreateString("123456");
            fbs.ReqLogin.StartReqLogin(builder);
            fbs.ReqLogin.AddAccount(builder, account);
            fbs.ReqLogin.AddPassword(builder, password);
            var orc = fbs.ReqLogin.EndReqLogin(builder);
            builder.Finish(orc.Value);

            IMsgDispatcher.instance.SendFBMsg(fbs.ReqLogin.HashID, builder);
        }
    }
}
