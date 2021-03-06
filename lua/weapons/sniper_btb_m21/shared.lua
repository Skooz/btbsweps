// Variables that are used on both client and server
SWEP.Base 					= "madfox2_scope"

SWEP.Category					= "BTB - Long-rifles"
SWEP.ViewModel				= Model("models/weapons/btb/v_m21.mdl")
SWEP.WorldModel				= Model("models/weapons/btb/w_m21.mdl")
SWEP.HoldType				= "ar2"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound				= Sound("BTB_M21.Fire")
SWEP.Primary.Round				= ("zooks_7.62x51_tracer")
SWEP.Primary.RPM				= 700					// This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 10					// Size of a clip
SWEP.Primary.DefaultClip		= 20					// Default number of bullets in a clip
SWEP.Primary.Automatic			= false					// Automatic/Semi Auto
SWEP.Primary.Ammo				= "ar2"

SWEP.Primary.KickUp				= 2						// Maximum up recoil (rise)
SWEP.Primary.KickDown			= -2						// Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0						// Maximum up recoil (stock)

SWEP.Secondary.ScopeZoom		= 12		
SWEP.Secondary.UseParabolic		= true
SWEP.Secondary.UseRangefinder	= true

SWEP.ScopeScale 				= 0.7
SWEP.Velocity					= 850

SWEP.BoltAction 		= false
SWEP.EjectsShells 		= true
SWEP.ShellDelay 		= 0
SWEP.ShellEffect 		= "sim_shelleject_fas_762x51"

SWEP.RunSightsPos = Vector (0, 0, 0)
SWEP.RunSightsAng = Vector (-10, 20, -10)

-- Animations
SWEP.PrimAttackAnim 	= ACT_VM_PRIMARYATTACK
SWEP.DryFireAnim 		= ACT_VM_IDLE
SWEP.LastBulletAnim 	= ACT_VM_PRIMARYATTACK

SWEP.IronInAnim 		= ACT_VM_DEPLOY
SWEP.IronOutAnim 		= ACT_VM_UNDEPLOY
SWEP.IronFireAnim 		= ACT_VM_SECONDARYATTACK
SWEP.LastIronBullet		= ACT_VM_SECONDARYATTACK

SWEP.DrawAnim 			= ACT_VM_DRAW
SWEP.FirstDrawAnim 		= ACT_VM_DRAW_EMPTY
SWEP.EmptyDrawAnim 		= ACT_VM_DRAW

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
	Up = 1.5,        -- Z Axis	(Up/Down)
	Right = 1, 		-- X Axis	(Left/Right)
	Forward = 1.5, 	-- Y Axis	(Back/Forward)
	},
	Ang = 
	{
	Up = -90,		-- Rotate	(Left/Right)
	Right = 10,		-- Rolling``	(Back/Forth)
	Forward = 0,	-- Rolling	(Left/Right)
	}
}