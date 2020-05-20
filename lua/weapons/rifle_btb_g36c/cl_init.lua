include('shared.lua')

SWEP.PrintName				= "G36C"			// 'Nice' Weapon name (Shown on HUD)	
SWEP.Slot				= 3			// Slot in the weapon selection menu
SWEP.SlotPos				= 6				// Position in the slot
SWEP.DrawAmmo				= true				// Should draw the default HL2 ammo counter				// Should draw the default crosshair
SWEP.DrawWeaponInfoBox			= true				// Should draw the weapon info box
SWEP.BounceWeaponIcon   		= false				// Should the weapon icon bounce?

if (file.Exists("materials/vgui/entities/rifle_btb_g36c.vmt","GAME")) then
	SWEP.WepSelectIcon	= surface.GetTextureID("vgui/entities/rifle_btb_g36c.vmt")
end