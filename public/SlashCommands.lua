MasterAndCommander = {}
MasterAndCommander.SlashCommands = {};

function MasterAndCommander.SlashCommands.Commands(msg)
    -- pattern matching that skips leading whitespace and whitespace between cmd and args
    -- any whitespace at end of args is retained
    local _, _, cmd, args = string.find(msg, "%s?(%w+)%s?(.*)")

    if cmd == "off" then
        MasterAndCommander_StatisticsBar_Hide()
    elseif cmd == "on" then
        MasterAndCommander_StatisticsBar_Show()
    else
        -- If not handled above, display some sort of help message
        print("The slash commands are /masterandcommander or /mc");
    end
end


SlashCmdList["MASTERANDCOMMANDER"] = MasterAndCommander.SlashCommands.Commands;

SLASH_MASTERANDCOMMANDER1 = "/mc";
SLASH_MASTERANDCOMMANDER2 = "/mandc";

print("Feature: slash commands loaded")