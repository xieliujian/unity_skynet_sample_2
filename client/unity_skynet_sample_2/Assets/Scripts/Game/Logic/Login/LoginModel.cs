using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using gtmInterface;
using fbs;
using FlatBuffers;
using System;

namespace gtmGame
{
    public class LoginModel : ClientSingleton<LoginModel>, LogicMgrInterface
    {
        #region 继承

        public void DoInit()
        {
            IMsgDispatcher.instance.RegisterFBMsg<fbs.RspLogin>(RspLogin_SC);
        }

        public void DoClose()
        {
            IMsgDispatcher.instance.UnRegisterFBMsg<fbs.RspLogin>(RspLogin_SC);
        }

        public void DoUpdate()
        {
            
        }

        #endregion

        #region 消息

        private void RspLogin_SC(fbs.RspLogin msg)
        {
            ILogSystem.instance.Log(LogCategory.GameLogic, msg.Account);
            ILogSystem.instance.Log(LogCategory.GameLogic, msg.Password);
        }

        #endregion
    }
}
