--[[
Auth:Chiuan
like Unity Brocast netmsg System in lua.
]]

local EventLib = require "eventlib"

local netmsg = {}

netmsg.events = {}

function netmsg.getEvents(msgid)
    
    return netmsg.events[msgid];
end

function netmsg.AddListener(msgid, msg, handler)

    if not netmsg.events[msgid] then
        --create the netmsg with name
        netmsg.events[msgid] = EventLib:new(msgid, msg)
    end

    --conn this handler
    netmsg.events[msgid]:connect(handler)
end

function netmsg.Brocast(event, data)
    if not netmsg.events[event] then
        error("brocast " .. event .. " has no event.")
    else
        netmsg.events[event]:fire(data)
    end
end

function netmsg.RemoveListener(msgid, msg, handler)

    if not netmsg.events[msgid] then
        error("remove " .. msgid .. " has no event.")
    else
        netmsg.events[msgid]:disconnect(handler)
    end
end

return netmsg