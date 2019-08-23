
---@type msgdispatcher
local msgdispatcher = require("msgdispatcher");

---@type ReqChat
local reqchat = require("ReqChat");

---@type RspLogin
local rspchat = require "RspChat";

local msgid = require "MsgId";

---@class chatmodel
chatmodel = {}

chatmodel.register = function()
    print("chatmodel.register")

    msgdispatcher.registerFbMsg(msgid.ReqChat, reqchat, chatmodel.reqchat_cs);
end

chatmodel.unRegister = function()
    msgdispatcher.unRegisterFbMsg(msgid.ReqChat, reqchat, chatmodel.reqchat_cs);
end

-- 消息
chatmodel.reqchat_cs = function(data)
    print("chatmodel.reqchat_cs")

    local id = data.id;
    local reqchat = data.msg;

    local builder = msgdispatcher.builder;
    local say = builder:CreateString(reqchat:Say().." balabala说话");

    rspchat.Start(builder);
    rspchat.AddSay(builder, say);
    local orc = rspchat.End(builder);
    builder:Finish(orc);

    msgdispatcher.sendFbMsg(id, msgid.RspChat, rspchat);
end

return chatmodel;