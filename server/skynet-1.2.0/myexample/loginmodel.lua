
---@type msgdispatcher
local msgdispatcher = require "msgdispatcher";

--- @type ReqLogin
local reqlogin = require "ReqLogin";

---@type RspLogin
local rsplogin = require "RspLogin";

local msgid = require "MsgId";

---@class loginmodel
loginmodel = {}

loginmodel.register = function()
    print("loginmodel.register")

    msgdispatcher.registerFbMsg(msgid.ReqLogin, reqlogin, loginmodel.reqlogin_cs);
end

loginmodel.unRegister = function()
    msgdispatcher.unRegisterFbMsg(msgid.ReqLogin, reqlogin, loginmodel.reqlogin_cs);
end

-- 消息
loginmodel.reqlogin_cs = function(data)

    print("loginmodel.reqlogin_cs")

    local id = data.id;
    local reqlogindata = data.msg;

    print(reqlogindata:Account())
    --print(reqlogindata:Password())

    local builder = msgdispatcher.builder;
    local account = builder:CreateString(reqlogindata:Account().." wow魔兽");
    local password = builder:CreateString(reqlogindata:Password().." skynet云风");

    rsplogin.Start(builder)
    rsplogin.AddAccount(builder, account)
    rsplogin.AddPassword(builder, password)
    local orc = rsplogin.End(builder);
    builder:Finish(orc);

    msgdispatcher.sendFbMsg(id, msgid.RspLogin, rsplogin);
end

return loginmodel;