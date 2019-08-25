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

        public string ipaddress = "192.168.0.108";

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
            var account = builder.CreateString("黄河远上白云间，一片孤城万仞山。" +
                "羌笛何须怨杨柳，春风不度玉门关。秦时明月汉时关，万里长征人未还。" +
                "但使龙城飞将在，不教胡马度阴山。");
            var password = builder.CreateString("洛阳女儿对门居，才可颜容十五余。" +
                "良人玉勒乘骢马，侍女金盘脍鲤鱼。" +
                "画阁朱楼尽相望，红桃绿柳垂檐向。" +
                "罗帷送上七香车，宝扇迎归九华帐。" +
                "狂夫富贵在青春，意气骄奢剧季伦。" +
                "自怜碧玉亲教舞，不惜珊瑚持与人。" +
                "春窗曙灭九微火，九微片片飞花琐。" +
                "戏罢曾无理曲时，妆成祗是熏香坐。" +
                "城中相识尽繁华，日夜经过赵李家。" +
                "谁怜越女颜如玉，贫贱江头自浣纱。");
            fbs.ReqLogin.StartReqLogin(builder);
            fbs.ReqLogin.AddAccount(builder, account);
            fbs.ReqLogin.AddPassword(builder, password);
            var orc = fbs.ReqLogin.EndReqLogin(builder);
            builder.Finish(orc.Value);

            IMsgDispatcher.instance.SendFBMsg((ulong)fbs.MsgId.ReqLogin, builder);
        }
    }
}
