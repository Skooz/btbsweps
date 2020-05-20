local function BTBOptions(panel)

	local BTBOptions = {Options = {}, CVars = {"ToggleSights", "UseGDCBulets"}, Label = "#Presets", MenuButton = "1", Folder = ""}
	
	panel:AddControl("Slider",
	{
		Label = "Hands Skin",
		Command = "SetBTBHands",
		Min = 0,
		Max = 7,
	})
	
	panel:AddControl("Slider",
	{
		Label = "Recoil Multiplier",
		type = "float",
		Command = "RecoilMult",
		Min = 0,
		Max = 5,
	})
	
	panel:AddControl("CheckBox", 
	{
		Label = "Toggleable Ironsights",
		Command = "ToggleSights",
	})
	
	panel:AddControl("CheckBox", 
	{
		Label = "Use GDC Bullets",
		Command = "UseGDCBullets",
	})
	
end	

function BTBToolMenu()
	spawnmenu.AddToolMenuOption("Options", "BTB Weapons", "Settings", "Settings", "", "", BTBOptions, {SwitchConVar = 'ToggleSights'}, {SwitchConVar = 'UseGDCBullets'})
end

hook.Add("PopulateToolMenu", "BTBToolMenu", BTBToolMenu)