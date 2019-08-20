-- automatically generated by the FlatBuffers compiler, do not modify

-- namespace: fbs

local flatbuffers = require('flatbuffers')

---@class RspChat
local RspChat = {} -- the module

local RspChat_mt = {} -- the class metatable


function RspChat.New()
    local o = {}
    setmetatable(o, {__index = RspChat_mt})
    return o
end

function RspChat.GetRootAsRspChat(buf, offset)
    local n = flatbuffers.N.UOffsetT:Unpack(buf, offset)
    local o = RspChat.New()
    o:Init(buf, n + offset)
    return o
end

function RspChat.init(buf, offset)
    return RspChat.GetRootAsRspChat(buf, offset)
end

function RspChat_mt:
Init(buf, pos)
    self.view = flatbuffers.view.New(buf, pos)
end

function RspChat_mt:Say()
    local o = self.view:Offset(4)
    if o ~= 0 then
        return self.view:String(o + self.view.pos)
    end
end

function RspChat.Start(builder) builder:StartObject(1) end
function RspChat.AddSay(builder, say) builder:PrependUOffsetTRelativeSlot(0, say, 0) end
function RspChat.End(builder) return builder:EndObject() end

return RspChat -- return the module