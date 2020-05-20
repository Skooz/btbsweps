// Variables that are used on both client and server
SWEP.Base 					= "madfox2"

SWEP.Category					= "BTB - PDWs"
SWEP.ViewModel				= "models/weapons/btb/v_p90.mdl"
SWEP.WorldModel				= "models/weapons/btb/w_p90.mdl"
SWEP.HoldType				= "smg"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound				= Sound("BTB_P90.Fire")
SWEP.Primary.Round				= ("zooks_5.7x28_ap")
SWEP.Primary.RPM				= 900						// This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 50						// Size of a clip
SWEP.Primary.DefaultClip		= 100
SWEP.Primary.Automatic			= true						// Automatic/Semi Auto
SWEP.Primary.Ammo				= "smg1"

SWEP.Primary.KickUp				= 1							// Maximum up recoil (rise)
SWEP.Primary.KickDown			= 1							// Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 1							// Maximum up recoil (stock)

SWEP.EjectsShells 		= true
SWEP.ShellDelay 		= 0
SWEP.ShellEffect 		= "sim_shelleject_fas_556"

SWEP.RunSightsPos = Vector (0, 0, 0)
SWEP.RunSightsAng = Vector (-10, 22.5, -10)

--Animations
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

SWEP.HolsterAnim 		= ACT_VM_HOLSTER
SWEP.QuickHolsterAnim	= ACT_VM_UNDEPLOY_2
SWEP.EmptyHolsterAnim 	= ACT_VM_HOLSTER


SWEP.Offset = {
	Pos = 
	{
	Up = 1.2,  		-- Z Axis	(Up/Down)
	Right = 1, 		-- X Axis	(Left/Right)
	Forward = 2.5, 	-- Y Axis	(Back/Forward)
	},
	Ang = 
	{
	Up = -90,		-- Rotate	(Left/Right)
	Right = 8,		-- Rolling``	(Back/Forth)
	Forward = 0,	-- Rolling	(Left/Right)
	}
}