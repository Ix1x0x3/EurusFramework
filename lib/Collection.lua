---@diagnostic disable: undefined-global
local Collection = {}

-- String lib
local SFind = string.find;
local SMatch = string.match;
local SGsub = string.gsub;

-- Table lib
local TInsert = table.insert;
local TFind = table.find;
local TRemove = table.remove;

function Collection.New()
    local self = {};
    self._VALUES = {};
    self.ItemAddedRaw = Instance.new("BindableEvent");
    self.ItemAdded = self.ItemAddedRaw.Event;

    self.ItemRemovedRaw = Instance.new("BindableEvent");
    self.ItemRemoved = self.ItemRemovedRaw.Event;

    return setmetatable(self, Collection);
end

function Collection.set(Key, Value)
    self._VALUES[Key] = Value;
    self.ItemAddedRaw:Fire(Key, Value);

    return self;
end

function Collection.has(Key)
    return self._VALUES[Key] ~= nil
end

function Collection.find(Callback)
    local Allowed = {};

    for _,x in pairs(self._VALUES) do
        local Res = Callback(x);

        if Res == true then
            TInsert(Allowed, x)
        end
    end

    return Allowed;
end

function Collection.remove(Key)
    self._VALUES[Key] = nil;

    return self;
end

return Collection;