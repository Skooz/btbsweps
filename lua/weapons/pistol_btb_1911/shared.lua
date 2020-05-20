// Variables that are used on both client and server
SWEP.Base 						= "madfox2"

SWEP.Category					= "BTB - Pistols"
SWEP.ViewModel					= "models/weapons/btb/v_1911.mdl"
SWEP.WorldModel					= "models/weapons/btb/w_1911.mdl"
SWEP.HoldType					= "pistol"
SWEP.Spawnable					= true
SWEP.AdminSpawnable				= true

SWEP.Primary.Sound				= Sound("BTB_1911.Fire")
SWEP.Primary.Round				= ("zooks_11x22_350")
SWEP.Primary.RPM				= 400						// This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 7						// Size of a clip
SWEP.Primary.DefaultClip		= 14
SWEP.Primary.Automatic			= false						// Automatic/Semi Auto
SWEP.Primary.Ammo				= "pistol"

SWEP.Primary.KickUp				= 3					// Maximum up recoil (rise)
SWEP.Primary.KickDown			= 1					// Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 1					// Maximum up recoil (stock)

SWEP.EjectsShells 		= true
SWEP.ShellDelay 		= 0
SWEP.ShellEffect 		= "sim_shelleject_fas_45acp"

SWEP.RunSightsPos = Vector (0, 0, 0)
SWEP.RunSightsAng = Vector (-24, 0, 0)

--Animations
SWEP.DrawAnim 			= ACT_VM_DRAW
SWEP.FirstDrawAnim 		= ACT_VM_DRAW
SWEP.EmptyDrawAnim 		= ACT_VM_DRAW_EMPTY

SWEP.PrimAttackAnim 	= ACT_VM_PRIMARYATTACK
SWEP.IronFireAnim 		= ACT_VM_SECONDARYATTACK
SWEP.LastIronBullet		= ACT_VM_DRYFIRE
SWEP.LastBulletAnim		= ACT_VM_PRIMARYATTACK_EMPTY
SWEP.DryFireAnim 		= ACT_VM_PRIMARYATTACK_EMPTY
SWEP.IronDryFireAnim	= ACT_VM_DRYFIRE

SWEP.IronInAnim 		= ACT_VM_DEPLOY
SWEP.IronInEmpty		= ACT_VM_DEPLOY_2
SWEP.IronOutEmpty		= ACT_VM_UNDEPLOY_3
SWEP.IronOutAnim 		= ACT_VM_UNDEPLOY

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
	Up = 2,  		-- Z Axis	(Up/Down)
	Right = 0, 		-- X Axis	(Left/Right)
	Forward = 1, 	-- Y Axis	(Back/Forward)
	},
	Ang = 
	{
	Up = -90,		-- Rotate	(Left/Right)
	Right = 8,		-- Rolling``	(Back/Forth)
	Forward = 0,	-- Rolling	(Left/Right)
	}
}