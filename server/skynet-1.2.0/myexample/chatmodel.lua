
---@type msgdispatcher
local msgdispatcher = require("msgdispatcher");

---@type ReqChat
local reqchat = require("ReqChat");

---@type RspLogin
local rspchat = require "RspChat";


---@class chatmodel
chatmodel = {}

chatmodel.register = function()
    msgdispatcher.registerFbMsg(reqchat, chatmodel.reqchat_cs);
end

chatmodel.unRegister = function()
    msgdispatcher.unRegisterFbMsg(reqchat, chatmodel.reqchat_cs);
end

-- 消息
chatmodel.reqchat_cs = function(data)

    local id = data.id;
    local reqchat = data.msg;

    local builder = msgdispatcher.builder;
    local say = builder:CreateString(reqchat:Say().." wow");

    rspchat.Start(builder);
    rspchat.AddSay(builder, say);
    local orc = rspchat.End(builder);
    builder:Finish(orc);

    msgdispatcher.sendFbMsg(id, rspchat);
end

return chatmodel;