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

        public string ipaddress = "192.168.0.102";

        // Start is called before the first frame update
        void Start()
        {
            m_gameMgr.DoInit();
            m_loginModel.DoInit();
            m_chatModel.DoInit();
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

            if (GUI.Button(new Rect(0, 0, 300, 100), "SendConnect"))
            {
                SendConnect();
            }

            if (GUI.Button(new Rect(0, 100, 300, 100), "SendLoginMsg"))
            {
                SendLoginMsg();
            }

            if (GUI.Button(new Rect(0, 200, 300, 100), "SendChatMsg"))
            {
                SendChatMsg();
            }
        }

        private void SendConnect()
        {
            INetManager.instance.SendConnect(ipaddress, 8888);
        }

        private void SendChatMsg()
        {
            var builder = IMsgDispatcher.instance.flatBufferBuilder;
            var say = builder.CreateString("白日依山尽，黄河入海流。欲穷千里目，更上一层楼。" +
                "红豆生南国，春来发几枝。愿君多采撷，此物最相思。" +
                "松下问童子，言师采药去。只在此山中，云深不知处。");
            fbs.ReqChat.StartReqChat(builder);
            fbs.ReqChat.AddSay(builder, say);
            var orc = fbs.ReqChat.EndReqChat(builder);
            builder.Finish(orc.Value);

            IMsgDispatcher.instance.SendFBMsg((ulong)fbs.MsgId.ReqChat, builder);
        }

        private void SendLoginMsg()
        {
            var builder = IMsgDispatcher.instance.flatBufferBuilder;
            var account = builder.CreateString("白日依山尽，黄河入海流。欲穷千里目，更上一层楼。" +
                "红豆生南国，春来发几枝。愿君多采撷，此物最相思。" +
                "松下问童子，言师采药去。只在此山中，云深不知处。");
            var password = builder.CreateString("白日依山尽，黄河入海流。欲穷千里目，更上一层楼。" +
                "红豆生南国，春来发几枝。愿君多采撷，此物最相思。" +
                "松下问童子，言师采药去。只在此山中，云深不知处。");
            fbs.ReqLogin.StartReqLogin(builder);
            fbs.ReqLogin.AddAccount(builder, account);
            fbs.ReqLogin.AddPassword(builder, password);
            var orc = fbs.ReqLogin.EndReqLogin(builder);
            builder.Finish(orc.Value);

            IMsgDispatcher.instance.SendFBMsg((ulong)fbs.MsgId.ReqLogin, builder);
        }
    }
}
