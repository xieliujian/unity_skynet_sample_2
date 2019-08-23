

local skynet = require "skynet"

local service = require "service"

local msgregister = {}

local data = {}

local chatmodel = require "chatmode"

local loginmodel = require "loginmodel"

function msgregister.register()
    print("msgregister.register")

    loginmodel.register();
    chatmodel.register();
end

service.init {
    command = msgregister,
    info = data
}
