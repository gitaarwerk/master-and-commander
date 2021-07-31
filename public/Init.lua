-- Prepare global name space
MasterAndCommander = {};
MasterAndCommander.Init = {};

function MasterAndCommander.Init.load()
    MasterAndCommander.Init.Frame = CreateFrame("Frame");
    MasterAndCommander.Init.Frame:RegisterEvent("ADDON_LOADED");
    MasterAndCommander.Init.Frame:SetScript("OnEvent", function (self, event, ...)
        if (event == "ADDON_LOADED" and ... == "MasterAndCommander") then
            if (MasterAndCommanderVars == nil) then
                MasterAndCommanderVars = {}
                -- aura warnings
                MasterAndCommanderVars.AuraWarning = {}
                MasterAndCommanderVars.AuraWarning.isOn = true
                MasterAndCommanderVars.AuraWarning.sound = 39517

                -- statistics bar
                MasterAndCommanderVars.StatisticsBar = {}
                MasterAndCommanderVars.StatisticsBar.isOn = true
            end
        end
    end)
end


MasterAndCommander.Init.load()

