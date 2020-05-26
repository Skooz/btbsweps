// Variables that are used on both client and server
SWEP.Base 					= "madfox2_scope"

SWEP.Category				= "BTB - Long-rifles"
SWEP.ViewModel				= Model("models/weapons/btb/v_cheytec.mdl")
SWEP.WorldModel				= Model("models/weapons/btb/w_cheytec.mdl")
SWEP.HoldType				= "ar2"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound				= Sound("BTB_cheytec.Fire")
SWEP.Primary.Round				= ("zooks_12.7x99_ap")
SWEP.Primary.RPM				= 60					// This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 10					// Size of a clip
SWEP.Primary.DefaultClip		= 20					// Default number of bullets in a clip

SWEP.Primary.Automatic			= false					// Automatic/Semi Auto
SWEP.Primary.Ammo				= "ar2"

SWEP.Primary.KickUp				= 1.5						// Maximum up recoil (rise)
SWEP.Primary.KickDown			= -1.5						// Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 1.5						// Maximum up recoil (stock)

SWEP.Secondary.ScopeZoom			= 8		
SWEP.Secondary.UseRangefinder		= true	
SWEP.Secondary.UseMilDot			= true	

SWEP.ScopeScale 			= 0.7
SWEP.Velocity				= 850

SWEP.BoltAction = true
SWEP.EjectsShells = true
SWEP.ShellDelay = 0.7
SWEP.ShellEffect = "sim_shelleject_fas_762x51"

SWEP.RunSightsPos = Vector (0, 0, 0)
SWEP.RunSightsAng = Vector (-10, 20, -10)

-- Animations
SWEP.FireLastAnim 		= ACT_VM_PRIMARYATTACK
SWEP.FireAnim			= ACT_VM_PRIMARYATTACK

SWEP.Boltpull			= ACT_SHOTGUN_PUMP
SWEP.IronBoltpull 		= ACT_VM_RECOIL1

SWEP.IronInAnim 		= ACT_VM_DEPLOY
SWEP.IronFireAnim 		= ACT_VM_SECONDARYATTACK
SWEP.IronOutAnim 		= ACT_VM_UNDEPLOY

SWEP.DryFireAnim 		= ACT_VM_IDLE

SWEP.DrawAnim 			= ACT_VM_DRAW
SWEP.FirstDrawAnim 		= ACT_VM_DRAW_EMPTY
SWEP.EmptyDrawAnim 		= ACT_VM_DRAW

SWEP.HolsterAnim		= ACT_VM_HOLSTER

SWEP.InsertAnim 		= ACT_VM_RELOAD
SWEP.ReloadEndAnim 		= ACT_SHOTGUN_RELOAD_FINISH
SWEP.ReloadStartAnim 	= ACT_SHOTGUN_RELOAD_START

SWEP.EmptyReloadAnim	= ACT_VM_RELOAD
SWEP.LastBulletAnim = ACT_VM_PRIMARYATTACK
SWEP.LastIronBullet = ACT_VM_PRIMARYATTACK


SWEP.Offset = {
	Pos = 
	{
	Up = 0.5,  		-- Z Axis	(Up/Down)
	Right = 0.3, 		-- X Axis	(Left/Right)
	Forward = 1, 	-- Y Axis	(Back/Forward)
	},
	Ang = 
	{
	Up = -95,		-- Rotate	(Left/Right)
	Right = 8,		-- Rolling``	(Back/Forth)
	Forward = 0,	-- Rolling	(Left/Right)
	}
}