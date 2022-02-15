local Players = game:GetService("Players");
local Collection;

-- String lib
local SFind = string.find;
local SMatch = string.match;
local SGsub = string.gsub;

-- Table lib
local TInsert = table.insert;
local TFind = table.find;
local TRemove = table.remove;

-- Functions

function MatchStringWithPlayer(Data)
    
    local Found = {};

    for _, Player in pairs(Players) do
        
        if Data:lower() == "all" then
            TInsert(Found, Player);
            continue;
        end

        if Data:lower() == "others" then

            if Player.Name == Players.LocalPlayer.Name then
                continue;
            end

            TInsert(Found, Player)
            continue;
        end

        if SMatch(Player.Name:lower(), Data:lower()) then
            
            return Player;

        end

    end

    return Found;

end

local CommandHandler = {};

function CommandHandler.New()
    local self = {};
    self.Commands = {}
end