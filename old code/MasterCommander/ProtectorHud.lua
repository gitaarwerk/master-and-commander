

-- ###################### ON UPDATE EVENTS ###################### --

UnitHealth_UpdateInterval = 0.01;
function UnitHealth_OnUpdate(elapsed)
  TimeSinceLastUpdate = TimeSinceLastUpdate + elapsed; 	
   while (TimeSinceLastUpdate > UnitHealth_UpdateInterval) do
    --
    -- SecondBar
	
	-- * 0 for Mana
    -- * 1 for Rage
    -- * 2 for Focus (hunter pets)
    -- * 3 for Energy
    -- * 4 for Happiness 
	
		if(UnitName("target")) then
				local max_health = UnitHealthMax("target");
				local current_health = UnitHealth("target");
				local health_now = math.ceil((100 / max_health) * current_health, 0);
				
				local max_mana = UnitManaMax("target");
				local current_mana = UnitMana("target");
				
				local mana_now = math.ceil((100 / max_mana) * current_mana, 0);	
				local manaview = '|cFFFFFFFF'..current_mana..'|c22FFFFFF / '..max_mana;
				
				if(mana_now > 100) then
					mana_now = 100;
				end

				HealthPercentage:SetTextHeight(15);

				-- Mana & percentage
				
					
					local barper = health_now * 1.8;
					local harper = mana_now * 1.8;
					
					
				-- show healthbar / manabar / picture / name
					if(UnitName("target")) then
						TrgtName:SetText(UnitName("target"));
						SetPortraitTexture(NmyPortrait,"target"); 
						SetPortraitTexture(TTPortrait,"targettarget");	
						
						if(harper >= 0) then
							ManaPercentage:SetText('|cFFFFFFFF'..mana_now..'%');
							GotMana:SetText(manaview);
						end
						
						HealthPercentage:SetText('|cFFFFFFFF'..health_now..'%');
										
						if(barper == 0 ) then
							MCHealthbar:SetWidth(0);
							MCHealthbar:SetAlpha(0);						
						else
							MCHealthbar:SetWidth(barper);
							MCHealthbar:SetAlpha(1);
						end
					else

					end

					-- show manabar & color
					if(UnitPowerType("target") == 1) then
						-- rage
						
						MCRagebar:SetWidth(harper);
						MCRagebar:SetAlpha(1);
						MCRagebarbg:SetAlpha(0.2);
						
						MCManabar:SetAlpha(0);
						MCManabarbg:SetAlpha(0);
						MCFocusbar:SetAlpha(0);
						MCFocusbarbg:SetAlpha(0);
						MCEnergybar:SetAlpha(0);
						MCEnergybarbg:SetAlpha(0);

					end
					
					if(UnitPowerType("target") == 2) then
						-- focus
						MCFocusbar:SetWidth(harper);
						MCFocusbar:SetAlpha(1);
						MCFocusbarbg:SetAlpha(0.2);
						
						MCRagebar:SetAlpha(0);
						MCRagebarbg:SetAlpha(0);
						MCManabar:SetAlpha(0);
						MCManabarbg:SetAlpha(0);
						MCEnergybar:SetAlpha(0);
						MCEnergybarbg:SetAlpha(0);
					end

					if(UnitPowerType("target") == 3) then
						-- energy
						MCEnergybar:SetWidth(harper);
						MCEnergybar:SetAlpha(1);
						MCEnergybarbg:SetAlpha(0.2);
						
						MCFocusbar:SetAlpha(0);
						MCFocusbarbg:SetAlpha(0);
						MCRagebar:SetAlpha(0);
						MCRagebarbg:SetAlpha(0);
						MCManabar:SetAlpha(0);
						MCManabarbg:SetAlpha(0);

					end

					if(UnitPowerType("target") == 4) then
						-- happyness
						MCFocusbar:SetWidth(harper);
						MCFocusbar:SetAlpha(1);
						MCFocusbarbg:SetAlpha(0.2);
						
						MCEnergybar:SetAlpha(0);
						MCEnergybarbg:SetAlpha(0);
						MCRagebar:SetAlpha(0);
						MCRagebarbg:SetAlpha(0);
						MCManabar:SetAlpha(0);
						MCManabarbg:SetAlpha(0);
					end	
					
					if(UnitPowerType("target") == 0) then
						-- mana
						MCManabar:SetWidth(harper);
						MCManabar:SetAlpha(1);
						MCManabarbg:SetAlpha(0.2);

						
						MCFocusbar:SetAlpha(0);
						MCFocusbarbg:SetAlpha(0);
						MCRagebar:SetAlpha(0);
						MCRagebarbg:SetAlpha(0);
						MCEnergybar:SetAlpha(0);
						MCEnergybarbg:SetAlpha(0);
					end					

							
					if(harper == 0 ) then
						MCRagebar:SetWidth(0);
						MCRagebar:SetAlpha(0);
						MCRagebarbg:SetAlpha(0.2);
						MCEnergybar:SetAlpha(0);
						MCFocusbar:SetAlpha(0);
						MCManabar:SetAlpha(0);
						MCEnergybarbg:SetAlpha(0);
						MCFocusbarbg:SetAlpha(0);
						MCManabarbg:SetAlpha(0);						
					else
						if(harper >= 0) then
		
						else						
							MCManabar:SetWidth(0);
							MCFocusbar:SetWidth(0);
							MCRagebar:SetWidth(0);
							MCEnergybar:SetWidth(0);
							MCRagebarbg:SetWidth(180);
							
							MCManabar:SetAlpha(0);
							MCRagebar:SetAlpha(0);
							MCFocusbar:SetAlpha(0);
							MCEnergybar:SetAlpha(0);

							MCManabarbg:SetAlpha(0);
							MCRagebarbg:SetAlpha(0.2);
							MCFocusbarbg:SetAlpha(0);
							MCEnergybarbg:SetAlpha(0);		
						end
					end					
					
					if(health_now == 0) then
						HealthPercentage:SetText('dead');
					end
		else
			MCHealthbar:SetAlpha(0);
			MCHealthbarBG:SetAlpha(0.2);
			
			MCManabar:SetWidth(0);
			MCFocusbar:SetWidth(0);
			MCRagebar:SetWidth(0);
			MCEnergybar:SetWidth(0);
			
			MCManabar:SetAlpha(0);
			MCRagebar:SetAlpha(0);
			MCFocusbar:SetAlpha(0);
			MCEnergybar:SetAlpha(0);

			MCManabarbg:SetAlpha(0);
			MCRagebarbg:SetAlpha(0.2);
			MCFocusbarbg:SetAlpha(0);
			MCEnergybarbg:SetAlpha(0);
			
			ManaPercentage:SetText('');
			GotMana:SetText('');
			HealthPercentage:SetText('');
			TrgtName:SetText('');
			SetPortraitTexture(NmyPortrait,""); 
			SetPortraitTexture(TTPortrait,"");
		end
		
	
    --

    TimeSinceLastUpdate = TimeSinceLastUpdate - UnitHealth_UpdateInterval;
  end
end




PlayerMana_UpdateInterval = 5;

function PlayerMana_OnUpdate(elapsed)
  TimeSinceLastUpdate3 = TimeSinceLastUpdate3 + elapsed; 	

  while (TimeSinceLastUpdate3 > PlayerMana_UpdateInterval) do
    --
    -- Insert your OnUpdate code here

	if(lastmana) then
		if(lastmana > UnitMana("player")) then
			ManaNow = lastmana - UnitMana("player");
			Percentage = (100 * (lastmana - UnitMana("player"))) / UnitManaMax("player");
			if(Percentage > 8.33) then
				clr = '|cFFFF0000';
			else
				clr = '|cFFFFFFFF';
				if(Percentage > 5) then
					clr = '|cFFF77F1D';
				end
			end

			-- ManaNow..
			manaout = clr.."-".. math.ceil( Percentage )..'%/5s';
		else
			if(lastmana < UnitMana("player")) then
				ManaNow = UnitMana("player") - lastmana;
				Percentage = (100 * (UnitMana("player") - lastmana)) / UnitManaMax("player");
				-- ManaNow..
				manaout = '|cFF6DCFF6'..math.ceil(Percentage)..'%/5s';
			else

			end
		end
		
		if(lastmana == UnitMana("player")) then
			manaout = '|cFFFFFFFF0';
		end
		
		lastmana = UnitMana("player");
		
		ManausageText:SetText(manaout);

	else
		lastmana = UnitMana("player");
	end

    --

    TimeSinceLastUpdate3 = TimeSinceLastUpdate3 - PlayerMana_UpdateInterval;
  end
end



J_UpdateInterval = 0.10;
function Needed_Debuffs_OnUpdate(elapsed)
  TimeSinceLastUpdateJ_CHECK = TimeSinceLastUpdateJ_CHECK + elapsed; 	

  while (TimeSinceLastUpdateJ_CHECK > J_UpdateInterval) do
    --
    -- Insert your OnUpdate code here

		local x, i, DB_JoTC, DB_JoW, DB_JoL = '', 1, 0, 0, 0;
		while (UnitDebuff("target",i) ~= nil) do
		 x = x .. UnitDebuff("target",i) .. ", ";
		 i = i + 1;
		end
		
		if (i == 1) then
		 x = x .. "no buffs.";
		else
		 x = strsub(x,0,-3) .. ".";	 
		end

		local text = '';
		
		if( string.find(x, "Judgement of the Crusader", 1))  then
			DB_JoTC = 1;
			MCJotc_on:SetAlpha(1);
			MCJotc_off:SetAlpha(0);
		else
			MCJotc_on:SetAlpha(0);
			MCJotc_off:SetAlpha(1);
		end
		 if( string.find(x, "Judgement of Wisdom", 1))  then
			DB_JoW = 1;
			MCJow_on:SetAlpha(1);
			MCJow_off:SetAlpha(0);
		else
			MCJow_on:SetAlpha(0);
			MCJow_off:SetAlpha(1);			
		end		
		 if( string.find(x, "Judgement of Light", 1))  then
			DB_JoL = 1;
			MCJol_on:SetAlpha(1);
			MCJol_off:SetAlpha(0);
		else
			MCJol_on:SetAlpha(0);
			MCJol_off:SetAlpha(1);		
		end	


		LiveTankStats();

    --

    TimeSinceLastUpdateJ_CHECK = TimeSinceLastUpdateJ_CHECK - J_UpdateInterval;
  end
end




-- check if RF is on
function Needed_Buffs_OnUpdate()
	local RF_status = UnitHasBuff("Righteous Fury", "Player")

	if(RF_status==true) then
		Righteous_Fury_Was_On = 1;
		MCRf_off:SetAlpha(0);
		MCRf_on:SetAlpha(1);
	else
		MCRf_off:SetAlpha(1);
		MCRf_on:SetAlpha(0);
		if(Righteous_Fury_Was_On == 1) then
			warning('Refresh Righteous Fury!');	
		end
		Righteous_Fury_Was_On = 0;
	end
end

-- Check Ardent Defender activity 
function CheckAD_OnHealth()


		local max_health = UnitHealthMax("player");
		local current_health = UnitHealth("player");
		local health_now = (100 / max_health) * current_health;
			

			
		if (health_now > 35) then
			TextureAdOFF:SetAlpha(1);
			TextureAdON:SetAlpha(0);
		else
			TextureAdOFF:SetAlpha(0);
			TextureAdON:SetAlpha(1);
		end
		
end


-- Check all statusses to calculate avoidance & shieldblocks
function LiveTankStats()
		local miss = round(GetDodgeBlockParryChanceFromDefense() + 5, 2);
		local dodge = round(GetDodgeChance(), 2);
		local parry = round(GetParryChance(), 2);
		local block = round(GetBlockChance(), 2);
		local blockValue = round(GetShieldBlock(), 2);
		local baseArmor , effectiveArmor, armor, posBuff, negBuff = UnitArmor("player");
		
		local total = round((miss + dodge + parry), 2);
		local avoidance = round((total + block), 2);
	
		local baseDefense, armorDefense = UnitDefense("player");
		local defense = armorDefense + baseDefense;

		local tankadin_info = "";

		tankadin_info = tankadin_info..miss.."%\n";
		tankadin_info = tankadin_info..dodge.."%\n";
		tankadin_info = tankadin_info..parry.."%\n";
		tankadin_info = tankadin_info..total.."%\n";
		tankadin_info = tankadin_info..block.."%\n";
		
		local color = "|cFFFFFFFF";
		

		local HS_status = UnitHasBuff("Holy Shield", "Player")
		if(HS_status==true) then
			if(avoidance >= 102.4)then
				avoidance = "|cFF3cf430"..avoidance;
			else
				avoidance = "|cFFfd6918"..avoidance.."("..(avoidance-102.4)..")";
			end			
		else
			if(avoidance >= 72.4)then
				avoidance = "|cFF0c7d0b"..avoidance;
			else
				avoidance = "|cFFc88400"..avoidance.."("..((avoidance+30)-102.4)..")";
			end		
		
		end
		
		local damageReduction = effectiveArmor / ((effectiveArmor - 22167.5) + (467.5 * UnitLevel("Player")));
		
		avoidance = "avoidance: "..avoidance.."\n";
		avoidance = avoidance.."effective armor: "..effectiveArmor.."("..round((damageReduction*100),2)..")\n".."Blockamount: "..blockValue;
			
		AvoidanceTooltip:SetText(tankadin_info);
		Avoidance:SetText("%"..avoidance);
		AvoidanceTooltip:Show();

end