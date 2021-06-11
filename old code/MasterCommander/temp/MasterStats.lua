-- ############### MASTER AND COMMANDER: STATS #################### --
 -- Function to show Stats Panel
function MasterCommander_ShowStats()
	if(  StatsFrame:IsVisible() ) then
		out("VISIBLE")
	   StatsFrame:Hide();
	else
		StatsFrame:Show();
		out("INVISIBLE")
	end
end

function SpellStats()

	-- note: put in MH damage buff (prot)
	-- note: put in 2H damage buff (retri)

	local mainSpeed, offSpeed = UnitAttackSpeed("player");
	local base, posBuff, negBuff = UnitAttackPower("player");
	local ap = base + posBuff + negBuff;
	local lowDmg, hiDmg, offlowDmg, offhiDmg, posBuff2, negBuff2, percentmod = UnitDamage("player");
	local lowDmg = lowDmg + posBuff2 + negBuff2;
	local hiDmg = hiDmg + posBuff2 + negBuff2;
	local spellDmg = GetSpellBonusDamage(2);
	local maxmana = UnitManaMax("player");
	local nmlzd_1h_low = lowDmg + (2.4 * ap / 14);
	local nmlzd_1h_hi = hiDmg + (2.4 * ap / 14);
	local nmlzd_2h_low = lowDmg + (3.3 * ap / 14);
	local nmlzd_2h_hi = hiDmg + (3.3 * ap / 14);
	local one_hspec = 1;
	local two_hspec = 1;
	local weaponDPS = 41.2;

							-- SPELL						-- Coeficcient calculation
	spell = 	{			["SoRighteousness"]		= 		(mainSpeed * (0.028 * ap + 0.055 * spellDmg)), 
							["JoRighteousness"]		=		(1 + 0.25 * ap + 0.4 * spellDmg),
							["SoLight"]				=		(0.28 * ap + 0.28 * spellDmg), 
							["JoLightEffect"] 		= 		(0.18 * spellDmg + 0.18 * ap),
							["JudgementDamage"]		= 		(1 + 0.32 * spellDmg + 0.2 * ap), 
							["SoWisdom"]			=		(maxmana * 0.04),
							["JoWisdomEffect"] 		= 		(0.09 * spellDmg + 0.09 * ap),
							["SotMartyr"]			=		round((0.28 * lowDmg),0) .. " to " .. round((0.28 * hiDmg),0),
							["JotMartyr"]			=		round((0.25 * lowDmg + 0.2 * ap + 0.32 * spellDmg),0) .. " to " .. round((0.25 * hiDmg + 0.2 * ap + 0.32 * spellDmg),0),
							["SoCorruption"]		=		round(((0.016 * spellDmg + 0.032 * ap) * 6),0) .. " (full stack: " .. round((((0.016 * spellDmg + 0.032 * ap) * 6)*5),0) .. ")",
							["JoCorruption"]		=		round((1 + 0.28 * spellDmg + 0.175 * ap),0) .. " (full stack: " .. round(((1 + 0.28 * spellDmg + 0.175 * ap)* 1.50),0) .. ")",
							["SoCommand"]			=		round((lowDmg * 0.70),0) .. " to " .. round((hiDmg * 0.70),0),
							["JoCommand"]			=		(0.28 * ap + 0.28 * spellDmg + ((ap * 0.36) + (spellDmg * 0.32))),
							["ShieldOfRighteousness"]=		round((GetShieldBlock()*2), 0),
							["HolyWrath"]			=		round((1050 + 0.07 * spellDmg + 0.07 * ap),0) .. " to " .. round((1234 + 0.07 * spellDmg + 0.07 * ap),0),
							["Exorcism"]			=		round((1028 + 0.15 * spellDmg + 0.15 * ap),0) .. " to " .. round((1146 + 0.15 * spellDmg + 0.15 * ap),0),
							["HammerOfWrath"]		=		(1139 + 0.15 * spellDmg + 0.15 * ap) .. " to " .. (1257 + 0.15 * spellDmg + 0.15 * ap),
							["Consecration"]		=		round((113 + 0.04 * spellDmg + 0.04 * ap),0) .. "/s - " ..  round((8 * (113 + 0.04 * spellDmg + 0.04 * ap)),0) .. "/8s - " ..  round((10 * (113 + 0.04 * spellDmg + 0.04 * ap)),0) .. "/10s",
							["AvengerShield"]		=		(846 + 0.07 * spellDmg + 0.07 * ap) .. " to " .. (1034 + 0.07 * spellDmg + 0.07 * ap),
							["BoSanctuary"]			=		(maxmana * 0.02),
							["HolyShield"]			=		0,
							["DivineStorm1"]		=		round(nmlzd_1h_low,0) .. " to " .. round(nmlzd_1h_hi,0),
							["DivineStorm2"]		=		round(nmlzd_2h_low,0) .. " to " .. round(nmlzd_2h_hi,0),
							["CrusaderStrike"]		=		round((lowDmg * 1.10),0) .. " to " .. round((hiDmg * 1.10),0),
							["HotRighteous"]		=		round((weaponDPS + (ap / 14)*4 * one_hspec) ,0),
							["HolyShock"]			=		0,
						};
	
	
	-- temp language
	lng_SoRighteousness = 'Seal of Righteousness';
	lng_JoRighteousness = 'Judgement of Righteousness';
	lng_SoLight = 'Seal of Light';
	lng_JoLightEffect = 'Judgement of Light (effect)';
	lng_SoWisdom = 'Seal of Wisdom';
	lng_JoWisdomEffect = 'Judgement of Wisdom (effect)';

	lng_JudgementDamage = 'Judgement Damage (wisdom/light/justice)';
	lng_SotMartyr = 'Seal of the Martyr/Blood';
	lng_JotMartyr = 'Judgement of the Martyr/Blood)';
	lng_SoCorruption = 'Seal of Vengeance/Corruption';
	lng_JoCorruption = 'Judgement of Vengeance/Corruption';	

	lng_SoCommand = 'Seal of Command';
	lng_JoCommand = 'Judgement of Command';
	lng_ShieldOfRighteousness = 'Shield of Righteousness';
	lng_AvengerShield = 'Avenger\'s Shield';
	lng_BoSanctuary = 'Blessing of Sanctuary (effect)';
	lng_HolyShield = 'Holy Shield';	
	lng_HolyWrath = 'Holy Warth';
	lng_Exorcism = 'Exorcism';
	lng_HammerOfWrath = 'Hammer of Warth';
	lng_Consecration = 'Consecration';
	lng_HotRighteous = 'Hammer of the Righteous';
	lng_DivineStorm1 = 'Divine Storm (1h)';
	lng_DivineStorm2 = 'Divine Storm (2h)';
	lng_CrusaderStrike = 'Crusader Strike';
	lng_HolyShock = 'HolyShock';

	
	-- update the front
		-- names localized
		
			-- damage
			SoRighteousness:SetText(lng_SoRighteousness);
			JoRighteousness:SetText(lng_JoRighteousness);
			JudgementDamage:SetText(lng_JudgementDamage);
			
			SoCommand:SetText(lng_SoCommand);
			JoCommand:SetText(lng_JoCommand);
					
			SotMartyr:SetText(lng_SotMartyr);
			JotMartyr:SetText(lng_JotMartyr);
			SoCorruption:SetText(lng_SoCorruption);
			JoCorruption:SetText(lng_JoCorruption);		

			ShieldOfRighteousness:SetText(lng_ShieldOfRighteousness);
			HolyWrath:SetText(lng_HolyWrath);
			Exorcism:SetText(lng_Exorcism);
			-- HammerOfWrath:SetText(lng_HammerOfWrath);
			Consecration:SetText(lng_Consecration);
			AvengerShield:SetText(lng_AvengerShield);
			
			HolyShield:SetText(lng_HolyShield);
			HotRighteous:SetText(lng_HotRighteous);
			DivineStorm1:SetText(lng_DivineStorm1);
			DivineStorm2:SetText(lng_DivineStorm2);
			CrusaderStrike:SetText(lng_CrusaderStrike);
			HolyShock:SetText(lng_HolyShock);
			
			-- effects		
			-- SoLight:SetText(lng_SoLight);
			-- JoLightEffect:SetText(lng_JoLightEffect);
			-- SoWisdom:SetText(lng_SoWisdom);
			-- JoWisdomEffect:SetText(lng_JoWisdomEffect);
			-- BoSanctuary:SetText(lng_BoSanctuary);
	


			-- spell coefficcients
			sp_SoRighteousness:SetText(round(spell["SoRighteousness"]),1);
			sp_JoRighteousness:SetText(round(spell["JoRighteousness"]),1);
			-- sp_SoLight:SetText(round(spell["SoLight"]),1);
			-- sp_JoLightEffect:SetText(round(spell["JoLightEffect"]),1);
			sp_JudgementDamage:SetText(round(spell["JudgementDamage"]),1);
			-- sp_SoWisdom:SetText(round(spell["SoWisdom"]),1);
			-- sp_JoWisdomEffect:SetText(round(spell["JoWisdomEffect"]),1);
		
			sp_SotMartyr:SetText(spell["SotMartyr"]);
			sp_JotMartyr:SetText(spell["JotMartyr"]);
			sp_SoCorruption:SetText(spell["SoCorruption"]);
			sp_JoCorruption:SetText(spell["JoCorruption"]);	
		
			sp_SoCommand:SetText(spell["SoCommand"]);
			sp_JoCommand:SetText(round(spell["JoCommand"]),1);
			sp_ShieldOfRighteousness:SetText(spell["ShieldOfRighteousness"]);
			sp_HolyWrath:SetText(spell["HolyWrath"]);
			sp_Exorcism:SetText(spell["Exorcism"]);
			-- sp_HammerOfWrath:SetText(round(spell["HammerOfWrath"]),1);
			sp_Consecration:SetText(spell["Consecration"]);
			sp_AvengerShield:SetText(spell["AvengerShield"]);
			-- sp_BoSanctuary:SetText(round(spell["BoSanctuary"]),1);
			sp_HolyShield:SetText(round(spell["HolyShield"]),0);
			sp_HotRighteous:SetText(spell["HotRighteous"]);
			sp_DivineStorm1:SetText(spell["DivineStorm1"]);
			sp_DivineStorm2:SetText(spell["DivineStorm2"]);
			sp_CrusaderStrike:SetText(spell["CrusaderStrike"]);
			sp_HolyShock:SetText(spell["HolyShock"]);
		
		
end


