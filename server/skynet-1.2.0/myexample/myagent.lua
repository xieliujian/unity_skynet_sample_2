local skynet = require "skynet"
local netpack = require "skynet.netpack"
local socket = require "skynet.socket"

local client_fd = ...
client_fd = tonumber(client_fd)

skynet.register_protocol {
    name = "client",
    id = skynet.PTYPE_CLIENT,

    --需要将网路数据转换成lua字符串，不需要打包，所以不用注册pack函数
    unpack = skynet.tostring,
}

local function task(msg)
    --print("recv from fd", client_fd, msg)
end

skynet.start(function()
    --注册client消息专门用来接收网络数据
    skynet.dispatch("client", function(_, _, msg)
        task(msg)
    end)

    skynet.dispatch("lua", function(_, _, cmd)
        --注册lua消息，来退出服务
        if cmd == "quit" then
            skynet.error(fd, "agent quit")
            skynet.exit()
        end
    end)
end)
