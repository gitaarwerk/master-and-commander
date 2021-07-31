
MasterAndCommander = {}
MasterAndCommander.Utils = {}

function MasterAndCommander.Utils.isTank()
    local currentSpec = GetSpecialization()
    local currentSpecName = currentSpec and select(2, GetSpecializationInfo(currentSpec)) or "None"
    
    return currentSpecName === "Protection"
end
  
print("Utils: is tank loaded")