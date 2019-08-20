using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using FlatBuffers;
using gtmEngine;

namespace gtmInterface
{
    public enum IMsgType
    {
        Invalid,
        FlatBuffer,
        Protobuf,
    }

    class IFlatBufferProcFun
    {
        public virtual void Invoke(byte[] buf)
        {

        }
    }

    public delegate void MsgProcDelegate<T>(T msg);

    public abstract class IMsgDispatcher : IManager
    {
        public IMsgDispatcher()
        {
            m_sInstance = this;
        }

        protected static IMsgDispatcher m_sInstance = null;

        public static IMsgDispatcher instance
        {
            get { return m_sInstance; }
        }

        protected IMsgType m_MsgType = IMsgType.Invalid;

        public virtual FlatBuffers.FlatBufferBuilder flatBufferBuilder
        {
            get { return null; }
        }

        public void RegisterMsgType(IMsgType msgtype)
        {
            m_MsgType = msgtype;
        }

        public abstract void Dispatcher(ulong msgid, byte[] bytearray);

        public virtual void RegisterFBMsg<T>(MsgProcDelegate<T> fbfunc) where T : struct, FlatBuffers.IFlatbufferObject { }
        
        public virtual void UnRegisterFBMsg<T>(MsgProcDelegate<T> fbfunc) where T : struct, FlatBuffers.IFlatbufferObject { }

        public virtual void SendFBMsg(ulong msgid, FlatBufferBuilder builder) { }
    }
}
