local NAME, S = ...
local KCL = KethoCombatLog

local ACD = LibStub("AceConfigDialog-3.0")
local L = S.L

	---------------------
	--- LibDataBroker ---
	---------------------

local dataobject = {
	type = "launcher",
	text = NAME,
	icon = "Interface\\Icons\\INV_Sword_01",
	OnClick = function(clickedframe, button)
		if IsModifierKeyDown() then
			KCL:SlashCommand(KCL:IsEnabled() and "0" or "1")
		else
			ACD[ACD.OpenFrames.KethoCombatLog_Parent and "Close" or "Open"](ACD, "KethoCombatLog_Parent")
		end
	end,
	OnTooltipShow = function(tt)
		tt:AddLine("|cffADFF2FKetho|r |cffFFFFFFCombatLog|r")
		tt:AddLine(L.BROKER_CLICK)
		tt:AddLine(L.BROKER_SHIFT_CLICK)
	end,
}

LibStub("LibDataBroker-1.1"):NewDataObject("Ketho_CombatLog", dataobject)
