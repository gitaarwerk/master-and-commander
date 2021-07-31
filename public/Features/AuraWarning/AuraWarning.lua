

MasterAndCommander_AuraWarning_SoundTable = {
    ["Raid Warning"] = 8959,
    ["Pulled Aggro"] = 15263,
    ["Aucion Window Open"] = 5274,
    ["Magic Click"] = 170271,
    ["Purchase Delivered"] = 39517,
    ["Harp"] = 170877,
    ["GM Chat Warning"] = 15273,
    ["PVP Warning"] = 9378,
}


function MasterAndCommander_AuraWarning_On()
    print("on")
    MasterAndCommanderVars.AuraWarning.isOn = true
end

function MasterAndCommander_AuraWarning_Off()
    print("off")
        MasterAndCommanderVars.AuraWarning.isOn = false
end

print("Feature: aura warnings loaded")

