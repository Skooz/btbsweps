include('shared.lua')

SWEP.PrintName			= "Knife"					// 'Nice' Weapon name (Shown on HUD)	
SWEP.Slot				= 0							// Slot in the weapon selection menu
SWEP.SlotPos			= 1							// Position in the slot
SWEP.Instructions		= ""

SWEP.Weight = 5

// Override this in your SWEP to set the icon in the weapon selection
if (file.Exists("materials/vgui/entities/btb_knife.vmt","GAME")) then
	SWEP.WepSelectIcon	= surface.GetTextureID("vgui/entities/btb_knife.vmt")
end