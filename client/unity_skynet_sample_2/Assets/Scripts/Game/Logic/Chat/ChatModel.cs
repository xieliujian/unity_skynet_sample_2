using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using gtmInterface;

namespace gtmGame
{
    public class ChatModel : ClientSingleton<ChatModel>, LogicMgrInterface
    {
        #region 继承

        public void DoClose()
        {
            IMsgDispatcher.instance.UnRegisterFBMsg<fbs.RspChat>((ulong)fbs.MsgId.RspChat, RspChat_SC);
        }

        public void DoInit()
        {
            IMsgDispatcher.instance.RegisterFBMsg<fbs.RspChat>((ulong)fbs.MsgId.RspChat, RspChat_SC);
        }

        public void DoUpdate()
        {
            
        }

        private void RspChat_SC(fbs.RspChat msg)
        {
            ILogSystem.instance.Log(LogCategory.GameLogic, msg.Say);
        }

        #endregion
    }

}

