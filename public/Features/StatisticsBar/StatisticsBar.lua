
MasterAndCommander = {}
MasterAndCommander.StatisticsBar = {}

local function format_thousand(v)
	local s = string.format("%d", math.floor(v))
	local pos = string.len(s) % 3
	if pos == 0 then pos = 3 end
	return string.sub(s, 1, pos)
		.. string.gsub(string.sub(s, pos+1), "(...)", ",%1")
end

function MasterAndCommander_StatisticsBar_Show()
    print("show")
    MasterAndCommander_StatisticsBarFrame:Show()
    MasterAndCommanderVars.StatisticsBar.isOn = true
end

function MasterAndCommander_StatisticsBar_Hide()
    print("hide")
        MasterAndCommander_StatisticsBarFrame:Hide()
        MasterAndCommanderVars.StatisticsBar.isOn = false
end

function getStats()
    -- if (avengingWrath) then 20% more damage, 20% more crit
    local overall, equipped = GetAverageItemLevel()
    local blockChance = GetBlockChance()
    local blockAmount = GetShieldBlock()
    local critChance = GetCritChance()
    local dodgeChance =  GetDodgeChance()
    local parryChance = GetParryChance()
    local leech = GetLifesteal()
    local mastery = GetMastery()
    local spellDmg = GetSpellBonusDamage(2);
    local health = UnitHealth("player");
    local haste = GetHaste()

    local baseArmor , effectiveArmor, armor, posBuff, negBuff = UnitArmor("player");
    local base, posBuff, negBuff = UnitAttackPower("player");
    local attackPower = base + posBuff + negBuff;
    local meleeLowDamage, melleeHighDamage = UnitDamage("player");

    local strength, effectiveStrength, positiveStrengthBuff, negativeStrengthBuff = UnitStat("player", 1) -- strnegth
    local stamina, effectiveStamina, positiveStaminaBuff, negativeStaminaBuff = UnitStat("player", 3) -- strnegth

    local avoidance = GetCombatRatingBonus(21)  -- avoidance
    local versatalityDamageDone = GetCombatRatingBonus(29)  -- versatality damage done
    local versatalityDamageTaken = GetCombatRatingBonus(31)  -- versatality damage taken

    return 
        format_thousand(health), 
        format_thousand(effectiveStamina),
        format_thousand(effectiveStrength),
        format_thousand(effectiveArmor), 
        string.format("%.2f%%", blockChance), 
        string.format("%.2f%%", dodgeChance), 
        string.format("%.2f%%", parryChance), 
        string.format("%.2f%%",leech), 
        string.format("%.2f%%",mastery), 
        string.format("%.2f%%",haste), 
        string.format("%.2f%%", critChance), 
        attackPower, 
        spellDmg, 
        meleeLowDamage, 
        melleeHighDamage,
        string.format("%.2f", equipped),
        string.format("%.2f%%", avoidance), 
        string.format("%.2f%%", versatalityDamageDone), 
        string.format("%.2f%%", versatalityDamageTaken)
end

function MasterAndCommander.StatisticsBar.Init()
    MasterAndCommander.StatisticsBar.Frame = CreateFrame("Frame")
    MasterAndCommander.StatisticsBar.Frame:RegisterEvent("ADDON_LOADED")
    MasterAndCommander.StatisticsBar.Frame:SetScript("OnEvent", function (self, event, addonName)
        if (event == "ADDON_LOADED" and addonName == "MasterAndCommander") then
            if (MasterAndCommanderVars.StatisticsBar.isOn) then
                MasterAndCommander_StatisticsBarFrame:Show()
            end
        end
    end)
end     

MasterAndCommander.StatisticsBar.Init()

print("Feature: statistics bar fully")