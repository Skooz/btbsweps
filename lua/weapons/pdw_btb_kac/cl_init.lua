include('shared.lua')

SWEP.PrintName				= "KAC PDW"			// 'Nice' Weapon name (Shown on HUD)	
SWEP.Slot				= 2			// Slot in the weapon selection menu
SWEP.SlotPos				= 6				// Position in the slot
SWEP.DrawAmmo				= true				// Should draw the default HL2 ammo counter				// Should draw the default crosshair
SWEP.DrawWeaponInfoBox			= true				// Should draw the weapon info box
SWEP.BounceWeaponIcon   		= false				// Should the weapon icon bounce?

SWEP.Weight = 2

if (file.Exists("materials/vgui/entities/pdw_btb_kac.vmt","GAME")) then
	SWEP.WepSelectIcon	= surface.GetTextureID("vgui/entities/pdw_btb_kac.vmt")
end