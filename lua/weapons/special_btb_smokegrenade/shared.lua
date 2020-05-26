// Variables that are used on both client and server
SWEP.Base 						= "special_btb_fraggrenade"

local RecoilMult 				= CreateClientConVar("RecoilMult", 1.00, true, false, "Recoil multiplier. Do you want more, or less?")

SWEP.Category					= "BTB - Special"
SWEP.ViewModel					= "models/weapons/btb/v_fraggrenade_smoke.mdl"
SWEP.WorldModel					= "models/weapons/btb/w_fraggrenade_smoke.mdl"
SWEP.HoldType					= "melee"
SWEP.Spawnable					= true
SWEP.AdminSpawnable				= true

SWEP.Primary.Sound				= Sound("")
SWEP.Primary.Round				= ("zooks_smokenade2")
SWEP.Primary.Delay				= 1						// This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 1						// Size of a clip
SWEP.Primary.DefaultClip		= 1
SWEP.Primary.Automatic			= false						// Automatic/Semi Auto
SWEP.Primary.Ammo				= "Grenade"

SWEP.Primary.KickUp				= 5							// Maximum up recoil (rise)
SWEP.Primary.KickDown			= 5							// Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 5							// Maximum up recoil (stock)

--Animations

/*
Idle: ACT_VM_IDLE
Draw: ACT_VM_DRAW
Holster: ACT_VM_HOLSTER
Holster Quick: ACT_VM_UNDEPLOY_2

Ready: ACT_VM_HAULBACK
Throw: ACT_VM_THROW

Prone Move: ACT_VM_IDLE_3
*/

/*
SWEP.DrawAnim 			= ACT_VM_DRAW
SWEP.FirstDrawAnim 		= ACT_VM_DRAW_EMPTY
SWEP.EmptyDrawAnim 		= ACT_VM_DRAW

SWEP.PrimAttackAnim 	= ACT_VM_PRIMARYATTACK
SWEP.DryFireAnim 		= ACT_VM_PRIMARYATTACK
SWEP.LastIronBullet		= ACT_VM_SECONDARYATTACK
SWEP.LastBulletAnim		= ACT_VM_PRIMARYATTACK
SWEP.IronFireAnim 		= ACT_VM_SECONDARYATTACK
SWEP.IronDryFireAnim	= ACT_VM_SECONDARYATTACK

SWEP.IronInAnim 		= ACT_VM_DEPLOY
SWEP.IronOutAnim 		= ACT_VM_UNDEPLOY
SWEP.IronInEmpty		= ACT_VM_DEPLOY
SWEP.IronOutEmpty		= ACT_VM_UNDEPLOY

SWEP.ReloadAnim 		= ACT_VM_RELOAD
SWEP.EmptyReloadAnim 	= ACT_VM_RELOAD_EMPTY

SWEP.IdleAnim 			= ACT_VM_IDLE
SWEP.EmptyIdleAnim 		= ACT_VM_IDLE


SWEP.QuickHolsterAnim	= ACT_VM_UNDEPLOY_2
SWEP.EmptyHolsterAnim 	= ACT_VM_HOLSTER
*/

SWEP.HolsterAnim 		= ACT_VM_HOLSTER

SWEP.Offset = {
	Pos = 
	{
	Up = 1,  		-- Z Axis	(Up/Down)
	Right = 1, 		-- X Axis	(Left/Right)
	Forward = 1.5, 	-- Y Axis	(Back/Forward)
	},
	Ang = 
	{
	Up = -90,		-- Rotate	(Left/Right)
	Right = 8,		-- Rolling``	(Back/Forth)
	Forward = 0,	-- Rolling	(Left/Right)
	}
}