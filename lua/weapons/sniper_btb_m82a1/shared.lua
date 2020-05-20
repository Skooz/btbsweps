// Variables that are used on both client and server
SWEP.Base 						= "madfox2_scope"

SWEP.Category					= "BTB - Long-rifles"
SWEP.ViewModel					= Model("models/weapons/btb/v_M82a1.mdl")
SWEP.WorldModel					= Model("models/weapons/btb/w_M82a1.mdl")
SWEP.HoldType					= "ar2"
SWEP.Spawnable					= true
SWEP.AdminSpawnable				= true

SWEP.Primary.Sound				= Sound("BTB_M82a1.Fire")
SWEP.Primary.Round				= ("zooks_12.7x99_ap")
SWEP.Primary.RPM				= 100					// This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 10					// Size of a clip
SWEP.Primary.DefaultClip		= 20					// Default number of bullets in a clip
SWEP.Primary.Automatic			= false					// Automatic/Semi Auto
SWEP.Primary.Ammo				= "ar2"

SWEP.Primary.KickUp				= 3						// Maximum up recoil (rise)
SWEP.Primary.KickDown			= -3						// Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0						// Maximum up recoil (stock)

SWEP.Secondary.ScopeZoom		= 8		
SWEP.Secondary.UseParabolic		= true
SWEP.Secondary.UseRangefinder	= true

SWEP.ScopeScale 				= 0.7
SWEP.Velocity					= 850

SWEP.BoltAction 				= false
SWEP.EjectsShells 				= true
SWEP.ShellDelay 				= 0
SWEP.ShellEffect 				= "sim_shelleject_fas_50cal"

SWEP.RunSightsPos 				= Vector (0, 0, 0)
SWEP.RunSightsAng 				= Vector (-10, 20, -10)

-- Animations
SWEP.PrimAttackAnim 	= ACT_VM_PRIMARYATTACK
SWEP.DryFireAnim 		= ACT_VM_IDLE

SWEP.IronInAnim 		= ACT_VM_DEPLOY
SWEP.IronOutAnim 		= ACT_VM_UNDEPLOY
SWEP.IronFireAnim 		= ACT_VM_SECONDARYATTACK
SWEP.IronDryFireAnim	= ACT_VM_SECONDARYATTACK

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
	Up = 6,  		-- Z Axis	(Up/Down)
	Right = 1, 		-- X Axis	(Left/Right)
	Forward = 6.7, 	-- Y Axis	(Back/Forward)
	},
	Ang = 
	{
	Up = -90,		-- Rotate	(Left/Right)
	Right = 8,		-- Rolling``	(Back/Forth)
	Forward = 0,	-- Rolling	(Left/Right)
	}
}