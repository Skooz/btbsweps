include('shared.lua')

SWEP.PrintName			= "Quick Knife"					// 'Nice' Weapon name (Shown on HUD)	
SWEP.Slot				= 0							// Slot in the weapon selection menu
SWEP.SlotPos			= 1							// Position in the slot
SWEP.Instructions		= ""
SWEP.Weight = -10

// Override this in your SWEP to set the icon in the weapon selection
if (file.Exists("","GAME")) then
	SWEP.WepSelectIcon	= surface.GetTextureID("")
end