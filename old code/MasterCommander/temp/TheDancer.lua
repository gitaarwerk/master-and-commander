-- ############### DANCE PART #################### --

function MasterCommander_Dance()

	-- local genderTable = { "neuter or unknown", "male", "female" };
	-- DEFAULT_CHAT_FRAME:AddMessage('Target is ' .. genderTable[UnitSex("target")] .. '.');

	if(UnitName("target")) then
	
		t = { 
			"%T, Dance with me baby!",
			"Hey %T lovecrusader, I want to be your spaceinvader!",
			"Hey %T, ride with me away!"
		}
	else
		t = { 
			"1",
			"2",
			"3"
		}
	end
	
	DoEmote("DANCE", ""); 
	rand_number = math.random(1, getn(t));
	
	SendChatMessage((t[rand_number]) , "SAY", nil, index);
end