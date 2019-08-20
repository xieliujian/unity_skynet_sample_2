
---@type msgdispatcher
local msgdispatcher = require("msgdispatcher");

--- @type ReqLogin
local reqlogin = require("ReqLogin");

---@type RspLogin
local rsplogin = require "RspLogin";

local msgid = require "MsgId";

---@class loginmodel
loginmodel = {}

loginmodel.register = function()

    msgdispatcher.registerFbMsg(msgid.ReqLogin, reqlogin, loginmodel.reqlogin_cs);
end

loginmodel.unRegister = function()
    msgdispatcher.unRegisterFbMsg(msgid.ReqLogin, reqlogin, loginmodel.reqlogin_cs);
end

-- 消息
loginmodel.reqlogin_cs = function(data)

    local id = data.id;
    local reqlogindata = data.msg;

    local builder = msgdispatcher.builder;
    local account = builder:CreateString(reqlogindata:Account().." wow");
    local password = builder:CreateString(reqlogindata:Password().." skynet");

    rsplogin.Start(builder)
    rsplogin.AddAccount(builder, account)
    rsplogin.AddPassword(builder, password)
    local orc = rsplogin.End(builder);
    builder:Finish(orc);

    msgdispatcher.sendFbMsg(id, msgid.RspLogin, rsplogin);
end

return loginmodel;