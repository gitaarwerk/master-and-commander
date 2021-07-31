MasterAndCommander = {}
MasterAndCommander.Utils = {}

function MasterAndCommander.Utils.round(number)
  return number >= 0 and math.floor(number + 0.5) or math.ceil(number - 0.5)
end
  
print("Utils: round loaded")