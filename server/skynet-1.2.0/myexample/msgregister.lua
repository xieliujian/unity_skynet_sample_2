

local skynet = require "skynet"

local service = require "service"

local netpack = require "skynet.netpack"

local msgdispatcher = require "msgdispatcher"

local chatmodel = require "chatmodel"

local loginmodel = require "loginmodel"

local msgregister = {}

local data = {}

function msgregister.register()
    print("msgregister.register")

    loginmodel.register();
    chatmodel.register();
end

function msgregister.dipatcher(client_fd, msg, sz)
    local realstr = netpack.tostring(msg, sz);
    msgdispatcher.dispatcherFbMsg(client_fd, realstr);
end

service.init {
    command = msgregister,
    info = data
}
