include('shared.lua')

SWEP.PrintName				= "Glock 17"			// 'Nice' Weapon name (Shown on HUD)	
SWEP.Slot					= 1				// Slot in the weapon selection menu
SWEP.SlotPos				= 6				// Position in the slot
SWEP.DrawAmmo				= true				// Should draw the default HL2 ammo counter				// Should draw the default crosshair
SWEP.DrawWeaponInfoBox		= true				// Should draw the weapon info box
SWEP.BounceWeaponIcon   	= false				// Should the weapon icon bounce?

if (file.Exists("materials/vgui/entities/pistol_btb_glock17.vmt","GAME")) then
	SWEP.WepSelectIcon	= surface.GetTextureID("vgui/entities/pistol_btb_glock17.vmt")
end