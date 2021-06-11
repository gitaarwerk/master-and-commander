-- ######################  Master & Commander: Initialisation ###############
function MasterCommander_initialize()
	-- add our very first chat command!
	
	DEFAULT_CHAT_FRAME:AddMessage('** Master and Commander. '.. Version_ ..' **');
	DEFAULT_CHAT_FRAME:AddMessage('** type /macconfig to open control panel **');
	DEFAULT_CHAT_FRAME:AddMessage('** To drag the hud, hold down the CONTROL button **');

	
	-- slashcommands to start MasterCommander frames	
	SlashCmdList["CONFIGURATION"] 	= MasterCommander_ShowConfigration;
	SLASH_CONFIGURATION1			= "/macconfig";
end


 -- Function to show Configuration Panel
 function MasterCommander_ShowConfigration()
	 if(  ConfigFrame:IsVisible() ) then
	   ConfigFrame:Hide();
	else
		ConfigFrame:Show();
	end

end



-- ######################  Master & Commander: Configuration ####################################

function MasterCommanderConfig_LoadVars()
	-- initialize our SavedVariable
	if ( not MasterCommanderConfig ) then 
	 	MasterCommanderConfig = {}; 
	end

	-- LOAD CHARACTER
	if ( not MasterCommanderConfig[MasterCommanderRealm] ) then 
	 	MasterCommanderConfig[MasterCommanderRealm] = {}; 
	end
	if ( not MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar] ) then 
	 	MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar] = {}; 
	end

	-- CHECK OPTIONS
	
	-- load each option, set default if not there
	
		-- Channel
		if ( not MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].Channel ) then 
			MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].Channel = MasterCommander_Conf_Channel;
		end
		
		if ( not MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].Channel2 ) then 
			MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].Channel2 = MasterCommander_Conf_Channel2;
		end
		
		
		-- Warning messages
		if ( not MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].TauntResistAnnounceToRaid ) then
			MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].TauntResistAnnounceToRaid = MasterCommander_Conf_TauntResistAnnounceToRaid;
		end

		if ( not MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].TauntResistSayInSay ) then
			MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].TauntResistSayInSay = MasterCommander_Conf_TauntResistSayInSay;
		end

		if ( not MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].TauntResistPaladinChannel ) then
			MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].TauntResistPaladinChannel = MasterCommander_Conf_TauntResistPaladinChannel;
		end

		if ( not MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].TauntResistPaladinChannel2 ) then
			MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].TauntResistPaladinChannel2 = MasterCommander_Conf_TauntResistPaladinChannel2;
		end	
		
		

		if ( not MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].TauntedSayInRaid ) then
			MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].TauntedSayInRaid = MasterCommander_Conf_TauntedSayInRaid;
		end

		if ( not MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].TauntedSayInSay ) then
			MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].TauntedSayInSay = MasterCommander_Conf_TauntedSayInSay;
		end
		
		

		if ( not MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].AvengerResistAnnounceToRaid ) then
			MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].AvengerResistAnnounceToRaid = MasterCommander_Conf_AvengerResistAnnounceToRaid;
		end


		if ( not MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].AvengerResistSayInSay ) then
			MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].AvengerResistSayInSay = MasterCommander_Conf_AvengerResistSayInSay;
		end


		if ( not MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].AvengerPullMessageAnnounceToRaid ) then
			MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].AvengerPullMessageAnnounceToRaid = MasterCommander_Conf_AvengerPullMessageAnnounceToRaid;
		end					
		
		
		if ( not MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].CrusaderStrikeSayInSay ) then
			MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].CrusaderStrikeSayInSay = MasterCommander_Conf_CrusaderStrikeSayInSay;
		end
		
		if ( not MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].CrusaderStrikePaladinChannel ) then
			MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].CrusaderStrikePaladinChannel = MasterCommander_Conf_CrusaderStrikePaladinChannel;
		end

		if ( not MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].CrusaderStrikePaladinChannel2 ) then
			MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].CrusaderStrikePaladinChannel2 = MasterCommander_Conf_CrusaderStrikePaladinChannel2;
		end	

		if ( not MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].DivineInterventionAnnounceToRaid ) then
			MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].DivineInterventionAnnounceToRaid = MasterCommander_Conf_DivineInterventionAnnounceToRaid;
		end		

		if ( not MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].DivineInterventionPaladinChannel ) then
			MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].CrusaderStrikePaladinChannel = MasterCommander_Conf_DivineInterventionPaladinChannel;
		end	

		if ( not MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].DivineInterventionPaladinChannel2 ) then
			MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].CrusaderStrikePaladinChannel2 = MasterCommander_Conf_DivineInterventionPaladinChannel2;
		end			
		
		-- Aura warning
		if ( not MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].AuraWarning ) then
			MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].AuraWarning = MasterCommander_Conf_AuraWarning;
		end			
		
		-- HUD Visibility		
		if ( not MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].HudOutCombat ) then
			MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].HudOutCombat = MasterCommander_Conf_HudOutCombat;
		end	

		if ( not MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].HudInCombat ) then
			MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].HudInCombat = MasterCommander_Conf_HudInCombat;
		end

		if ( not MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].HudScale ) then
			MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].HudScale = MasterCommander_Conf_HudScale;
		end		
		
		-- REMOVE Harmful Buffs
		if ( not MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].RemovalDelay ) then
			MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].RemovalDelay = MasterCommander_Conf_RemovalDelay;
		end		
		
		if ( not MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].HarmingSpells ) then
			MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].HarmingSpells = MasterCommander_Conf_HarmingSpells;
		end		
		
		

	-- read settings from profile, and change our checkbuttons and slider to represent them
	
		
	-- PALADIN CHANNEL
		PaladinChannel:SetText(MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].Channel);
		PaladinChannel2:SetText(MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].Channel2);
	
	-- WARNING MESSAGES
	
		TauntResistAnnounceToRaid:SetChecked( MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].TauntResistAnnounceToRaid );
		TauntResistSayInSay:SetChecked( MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].TauntResistSayInSay );
		TauntResistPaladinChannel:SetChecked( MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].TauntResistPaladinChannel );
		TauntResistPaladinChannel2:SetChecked( MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].TauntResistPaladinChannel2 );	
			
		TauntedSayInRaid:SetChecked( MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].TauntedSayInRaid );
		TauntedSayInSay:SetChecked( MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].TauntedSayInSay );
		
		CrusaderStrikeSayInSay:SetChecked( MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].CrusaderStrikeSayInSay );
		CrusaderStrikePaladinChannel:SetChecked( MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].CrusaderStrikePaladinChannel );
		CrusaderStrikePaladinChannel2:SetChecked( MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].CrusaderStrikePaladinChannel2 );	
			
		DivineInterventionAnnounceToRaid:SetChecked( MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].DivineInterventionAnnounceToRaid );
		DivineInterventionPaladinChannel:SetChecked( MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].DivineInterventionPaladinChannel);
		DivineInterventionPaladinChannel2:SetChecked( MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].DivineInterventionPaladinChannel2);	
		
		AvengerResistAnnounceToRaid:SetChecked( MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].TauntResistAnnounceToRaid );

		AvengerResistSayInSay:SetChecked( MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].TauntResistSayInSay );

		
		AvengerPullMessageAnnounceToRaid:SetChecked( MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].AvengerPullMessageAnnounceToRaid );
		
		AuraWarning:SetChecked( MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].AuraWarning );					
		
	-- HUD VISIBILITY
		HudInCombat:SetValue(MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].HudInCombat);
		HudOutCombat:SetValue(MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].HudOutCombat);			
		HudScale:SetValue(MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].HudScale);	
		
	-- Harmful Buff removal
		HarmingSpells:SetChecked(MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].HarmingSpells);
		RemovalDelay:SetValue(MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].RemovalDelay);														
		

	-- record that we have been loaded
	MasterCommander_variablesLoaded = true;
	MasterCommanderConfig_Change();

end

 function MasterCommanderConfig_Change()

	-- check vars loaded
	if ( not MasterCommander_variablesLoaded ) then -- config not loaded
		ConfigFrame:Hide(); -- turn our mod off
		return;
	end
	
	-- make sure to use the frame's name here, cannot rely on 'this' to mean the main frame
	if ( MasterCommanderConfig[MasterCommanderRealm][MasterCommanderChar].on ) then
		ConfigFrame:Show(); -- show our mod frame
	else
		ConfigFrame:Hide(); -- hide our mod frame
	end
 end

-- ######################  Master & Commander: Announcements ####################################

-- **** Avenger\'s shield pull ****
function ASPull(arg4)
	if (arg4 == UnitName("player")) then
		-- checks if avenger's shield being fired. If so, and allright, go parse a message
			if (UnitName("target")) then
				if not(UnitPlayerControlled("target")) then
					-- announce to raid
					local var_AvengerPullMessageAnnounceToRaid = AvengerPullMessageAnnounceToRaid:GetChecked();	
					if(var_AvengerPullMessageAnnounceToRaid == 1) then
						
						if(GetNumPartyMembers() > 0 ) then 
							if(UnitInRaid("player")) then
								 if (IsRaidLeader()) then
									 SendChatMessage('**** Pulling '..UnitName("target")..' ****', "RAID_WARNING", nil, index);
								else
									 if (IsRaidOfficer()) then
										 SendChatMessage('**** Pulling '..UnitName("target")..' ****', "RAID_WARNING", nil, index);
									 end
								 end
								  SendChatMessage('**** Pulling '..UnitName("target")..' ****', "RAID", nil, index);	
							else
								SendChatMessage('**** Pulling '..UnitName("target")..' ****', "RAID_WARNING", nil, index);
							end				
						end	
					end
				end
			end
		end
end




-- **** Message centre ****
function Msg_Centre(spell, arg4, arg7, arg2)
if(arg4 == UnitName("player")) then
	-- initialize paladin channel
	local var_PaladinChannel = PaladinChannel:GetText();
	local var_PaladinChannel2 = PaladinChannel2:GetText();	



	-- taunt successful
	if(spell == 'Righteous Defense') then
		-- initialize warnings	(righteous defense)
		local var_TauntedSayInRaid = TauntedSayInRaid:GetChecked();
		local var_TauntedSayInSay = TauntedSayInSay:GetChecked();


		-- announce to raid
		if(var_TauntedSayInRaid == 1) then	
			if(GetNumPartyMembers() > 0 ) then 
				if(UnitInRaid("player")) then
					  SendChatMessage(UnitName("player").." taunted " .. arg7, "RAID", nil, index); 	
				else
					  SendChatMessage(UnitName("player").." taunted " .. arg7, "PARTY", nil, index); 
				end				
			end	
		end

		if(var_TauntedSayInSay == 1) then
			 SendChatMessage(UnitName("player").." taunted " .. arg7, "SAY", nil, index); 
		end
		
	end
	
	
	--- Righteous Defense Resist!
	if(spell == 'Righteous Defense Resist') then
		-- initialize warnings	(righteous defense)
		local var_TauntResistAnnounceToRaid = TauntResistAnnounceToRaid:GetChecked();	
		local var_TauntResistPaladinChannel = TauntResistPaladinChannel:GetChecked();
		local var_TauntResistPaladinChannel2 = TauntResistPaladinChannel2:GetChecked();
		local var_TauntResistSayInSay = TauntResistSayInSay:GetChecked();	



				-- announce to raid
				if(var_TauntResistAnnounceToRaid == 1) then	
					if(GetNumPartyMembers() > 0 ) then 
						if(UnitInRaid("player")) then
							 if (IsRaidLeader()) then
								 SendChatMessage(UnitName("player").."'s taunt got resisted!" , "RAID_WARNING", nil, index);
							else
								 if (IsRaidOfficer()) then
									 SendChatMessage(UnitName("player").."'s taunt got resisted!" , "RAID_WARNING", nil, index);
								 end
							 end
							  SendChatMessage(UnitName("player").."'s taunt got resisted!" , "RAID", nil, index); 	
						else
							 SendChatMessage(UnitName("player").."'s taunt got resisted!" , "RAID_WARNING", nil, index);
						end				
					end	
				end



				if(var_TauntResistSayInSay == 1) then
					SendChatMessage(UnitName("player").."'s taunt got resisted!" , "SAY", nil, index);
				end
				
				if(var_TauntResistPaladinChannel == 1) then
					local PalaChannel = GetChannelName(var_PaladinChannel) ;
					SendChatMessage(UnitName("player").."'s taunt resisted!" , "CHANNEL", nil, PalaChannel); 
				end	


				if(var_TauntResistPaladinChannel2 == 1) then
					local PalaChannel2 = GetChannelName(var_PaladinChannel2) ;
					SendChatMessage(UnitName("player").."'s taunt resisted!" , "CHANNEL", nil, PalaChannel2); 
				end		
	end
	
	
	
	-- Divine Intervention announce
	--- Righteous Defense Resist!
	if(spell == 'Divine Intervention') then
		-- initialize warnings	(righteous defense)
		local var_DivineInterventionAnnounceToRaid = DivineInterventionAnnounceToRaid:GetChecked();	
		local var_DivineInterventionPaladinChannel = DivineInterventionPaladinChannel:GetChecked();
		local var_DivineInterventionPaladinChannel1 = DivineInterventionPaladinChannel2:GetChecked();


				-- announce to raid
				if(var_DivineInterventionAnnounceToRaid == 1) then	
					if(GetNumPartyMembers() > 0 ) then 
						if(UnitInRaid("player")) then
							 if (IsRaidLeader()) then
								 SendChatMessage(UnitName("player")..' casted Divine Intervention on '..arg7 , "RAID_WARNING", nil, index); 
							else
								 if (IsRaidOfficer()) then
									 SendChatMessage(UnitName("player")..' casted Divine Intervention on '..arg7 , "RAID_WARNING", nil, index); 
								 end
							 end
							   SendChatMessage(UnitName("player")..' casted Divine Intervention on '..arg7 , "RAID", nil, index); 
						else
							 SendChatMessage(UnitName("player")..' casted Divine Intervention on '..arg7 , "RAID_WARNING", nil, index); 
						end				
					end	
				end



				
				if(var_DivineInterventionPaladinChannel == 1) then
					local PalaChannel = GetChannelName(var_PaladinChannel) ;
					SendChatMessage(UnitName("player")..' casted Divine Intervention on '..arg7 , "CHANNEL", nil, PalaChannel); 
				end	


				if(var_DivineInterventionPaladinChannel1 == 1) then
					local PalaChannel2 = GetChannelName(var_PaladinChannel2) ;
					SendChatMessage(UnitName("player")..' casted Divine Intervention on '..arg7 , "CHANNEL", nil, PalaChannel2); 
				end		
	end	
	
	-- AV missing
	if(spell == 'Avenger\'s Shield') then
		local var_AvengerResistAnnounceToRaid = AvengerResistAnnounceToRaid:GetChecked();
		local var_AvengerResistSayInSay = AvengerResistSayInSay:GetChecked();


		-- announce to raid
		if(var_AvengerResistAnnounceToRaid == 1) then	
			if(GetNumPartyMembers() > 0 ) then 
				if(UnitInRaid("player")) then
					   SendChatMessage(UnitName("player").."'s Avenger's shield missed on "..arg7 , "RAID", nil, index);	
				else
					   SendChatMessage(UnitName("player").."'s Avenger's shield missed on "..arg7 , "PARTY", nil, index);
				end				
			end	
		end

		if(var_AvengerResistSayInSay == 1) then
			 SendChatMessage(UnitName("player").."'s Avenger's shield missed on "..arg7, "SAY", nil, index);
		end
		
	end

end
end


-- **** Crusader Aura in combat ****
function AuraWarningMessage()
	local var_AuraWarning = AuraWarning:GetChecked();
	if(var_AuraWarning == 1) then
		local j = GetNumShapeshiftForms()+1;
		for t=1, j do
			local icon, name, active, castable = GetShapeshiftFormInfo(t);
			if(name=='Crusader Aura' and active == 1) then
				warning("You still got crusader aura on!");
			end
		end
	end
end


-- ####################### HUD VISIBILITY ###################################

function SetHudVisibilityUp()
		
		local var_HudInCombat = HudInCombat:GetValue();
			if(var_HudInCombat == 0) then
				ProtectorFrame:Hide();
			else
				ProtectorFrame:Show();
				local var_HudInCombat2 = var_HudInCombat / 100;
				ProtectorFrame:SetAlpha(var_HudInCombat2);
			end		
end

function SetHudVisibilityDown()
		local var_HudOutCombat = HudOutCombat:GetValue();
			if(var_HudOutCombat == 0) then
				ProtectorFrame:Hide();
			else
				ProtectorFrame:Show();
				local var_HudOutCombat2 = var_HudOutCombat / 100;
				ProtectorFrame:SetAlpha(var_HudOutCombat2);
			end
end

function SetHudScale(framex)
	local var_HudScale = HudScale:GetValue();
	local size = var_HudScale / 100
 	ProtectorFrame:SetScale(size);	
end

Hud_UpdateInterval = 4;
function SetHudVisibilityUpdate(elapsed)
  TimeSinceLastUpdate2 = TimeSinceLastUpdate2 + elapsed; 	

  while (TimeSinceLastUpdate2 > Hud_UpdateInterval) do
    --
    -- Insert your OnUpdate code here
	
		if(InCombat == 0) then
			SetHudVisibilityDown();
		end

		if(InCombat == 1) then
			SetHudVisibilityUp();
		end		
   --

    TimeSinceLastUpdate2 = TimeSinceLastUpdate2 - Hud_UpdateInterval;
  end
end



FunctionCancelDelay = 0.01;
function CancelHarmingSpells(elapsed)
  TimeSinceLastUpdate5 = TimeSinceLastUpdate5 + elapsed; 	

  while (TimeSinceLastUpdate5 > FunctionCancelDelay) do
    --
    -- OnUpdate code

		local var_RemovalDelay = RemovalDelay:GetValue();
		local var_HarmingSpells = HarmingSpells:GetChecked();	
		
		if(var_HarmingSpells ==1) then
			if(CountCancelDelay  >= (var_RemovalDelay-FunctionCancelDelay)) then
				startCounting=2;
				CancelSpellsToTank(1);
				CountCancelDelay = 0;
			end
			
			if(startCounting==1) then
				CountCancelDelay = CountCancelDelay	+ FunctionCancelDelay;
			end
		end
		
		
		
   --

    TimeSinceLastUpdate5 = TimeSinceLastUpdate5 - FunctionCancelDelay;
  end
end

function CancelSpellsToTank(x)
	local i = 1
	local buffName
	repeat	
		for j = 1, NumberOfHarmingSpells do	
			local name= HarmingSpellList[j]
		
			buffName = UnitBuff("player", i)
			if buffName == name then
				CancelUnitBuff("player", i) 
			end
		end
		i = i + 1
	until not buffName
end



				
-- ####################### ON LOAD EVENTS ###################################

function CheckAD_OnLoad()
	checkad = 0;
	local numTabs = GetNumTalentTabs();
	for t=1, numTabs do
		local numTalents = GetNumTalents(t);
		for i=1, numTalents do
			spell, icon, tier, column, currRank, maxRank= GetTalentInfo(2,20);  -- Tree 3 (protection), tier 19
		end
	end
	  if (spell == "Ardent Defender" and currRank > 0) then
		 checkad = 1;
	 end

	return checkad;

end

function Check_SpellID(name)
	local i = 1
	while true do
	   local spellName, spellRank = GetSpellName(i, BOOKTYPE_SPELL)
	   if not spellName then
		  do break end
	   end
	   
	   if(spellName == name) then
			return i;
		end
	   
	   i = i + 1
	end
	
	
end




function UnitHasBuff(spellname, unit)
	for i=0, 31 do
		local buffName = UnitBuff(unit, i);
		if (spellname == buffName) then
			return true;
		end
	end

	return false;
end

-- ******************* Master & Commander: Output messages ********************
 
function out(text)
 UIErrorsFrame:AddMessage(text, 1.0, 1.0, 1.0, 1, 10) 
end

function makeSound()
 	PlaySound("QUESTCOMPLETED");
end

function warning(text)
 UIErrorsFrame:AddMessage(text, 1.0, 0.0, 0, 1, 10) 
 PlaySound("PVPENTERQUEUE");	
end

function out_error(text)
 UIErrorsFrame:AddMessage(text, 1.0, 0.0, 0, 1, 10) 
end




function MasterCommander_Activation()

   local frame = getglobal("MasterCommanderFrame");
   if (frame) then
 	 if(  frame:IsVisible() ) then
   	   frame:Hide();
  	else
    	frame:Show();
  	end
   end


		-- Calculate percentage of the target's total health
		local max_health = UnitHealthMax("target");
		local current_health = UnitHealth("target");
		local health_now = math.ceil((100 / max_health) * current_health, 0);
		-- SendChatMessage('%T\'s health: ' .. health_now.. "%" , "SAY", nil, index); 
	
end







-- ############ STATIC FUNCTIONS ##################### 





-- Spellcasting and return to enemy


-- ModelFrame updater
		function ModelFrame_OnEvent(hide)
		if not UnitExists("target") then
			ModelFrame:ClearModel();
		end

		ModelFrame:SetUnit("target");
		ModelFrame:SetAlpha(0.92);
		ModelFrame:SetScale(1);
		ModelFrame:SetCamera(0);
		ModelFrame:SetFacing(-45);
		ModelFrame:SetPosition(0,0,-1);
		ModelFrame:SetLight(1, 0, 0, -0.707, -0.707, 0.7, 1.0, 1.0, 1.0, 0.8, 1.0, 1.0, 0.8);

end






-- ######################## ON UPDATE EVENTS ############################### --

-- COMBAT MESSAGES








function Msg_DivineIntervention()

	local var_DivineInterventionSayInRaid = DivineInterventionSayInRaid:GetChecked();
	local var_DivineInterventionAnnounceToRaid = DivineInterventionAnnounceToRaid:GetChecked();	
	local var_DivineInterventionPaladinChannel = DivineInterventionPaladinChannel:GetChecked();
	local var_DivineInterventionPaladinChannel2 = DivineInterventionPaladinChannel2:GetChecked();
	local var_PaladinChannel = PaladinChannel:GetText();
	local var_PaladinChannel2 = PaladinChannel2:GetText();

				
	if( string.find(arg1, "You cast Divine Intervention on", 1))  then
		local str_playername = string.sub(arg1, 32);
		
		if(var_DivineInterventionSayInRaid == 1) then
			var_party = 0; 
			var_raid= 0;
			if(UnitInParty("player") == 1) then
				var_party = 1;			
					if(UnitInRaid("player") == 1) then
						var_raid = 1;
					end
			end
			
			if(var_DivineInterventionAnnounceToRaid == 1) then
				SendChatMessage(UnitName("player")..' casted Divine Intervention on'..str_playername , "RAID_WARNING", nil, index); 
			end

			
			if(var_raid == 1) then
				SendChatMessage('Divine Intervention on'..str_playername , "RAID", nil, index); 
			else
				if(var_party == 1) then
					SendChatMessage('Divine Intervention on'..str_playername , "PARTY", nil, index); 
				end
			end							
		end
		
		if(var_DivineInterventionPaladinChannel == 1) then
			local PalaChannel = GetChannelName(var_PaladinChannel);
			SendChatMessage(UnitName("player")..' casted Divine Intervention on'..str_playername , "CHANNEL", nil, PalaChannel); 	
		end

		if(var_DivineInterventionPaladinChannel2 == 1) then
			local PalaChannel2 = GetChannelName(var_PaladinChannel2);
			SendChatMessage(UnitName("player")..' casted Divine Intervention on'..str_playername , "CHANNEL", nil, PalaChannel2); 	
		end		
	end	
end





-- library thingies

-- round numbers
function round(num, idp)
	local mult = 10 ^ (idp or 0);
	return math.floor(num * mult + 0.5) / mult;
end

	--  // Sound for successfull agro
	-- PlaySoundFile("Interface\\AddOns\\MasterCommander\sleep_rest.mp3");