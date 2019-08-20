--[[
Auth:Chiuan
like Unity Brocast netmsg System in lua.
]]

local EventLib = require "eventlib"

local netmsg = {}
local events = {}

function netmsg.getEvents(msgid)

    return events[msgid];
end

function netmsg.AddListener(msg, handler)

    local msgid = msg.HashID;

    if not events[msgid] then
        --create the netmsg with name
        events[msgid] = EventLib:new(msgid, msg)
    end

    --conn this handler
    events[msgid]:connect(handler)
end

function netmsg.Brocast(event, data)
    if not events[event] then
        error("brocast " .. event .. " has no event.")
    else
        events[event]:fire(data)
    end
end

function netmsg.RemoveListener(msg, handler)

    local msgid = msg.HashID;

    if not events[msgid] then
        error("remove " .. msgid .. " has no event.")
    else
        events[msgid]:disconnect(handler)
    end
end

return netmsg