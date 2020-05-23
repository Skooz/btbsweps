// Variables that are used on both client and server
SWEP.Base 						= "madfox2"

SWEP.Category					= "BTB - Pistols"
SWEP.ViewModel					= Model("models/weapons/btb/v_ragingbull.mdl")
SWEP.WorldModel					= Model("models/weapons/btb/w_ragingbull.mdl")
SWEP.HoldType					= "revolver"
SWEP.Spawnable					= true
SWEP.AdminSpawnable				= true

SWEP.Primary.Sound				= Sound("BTB_RagingBull.Fire")    
SWEP.Primary.Round				= ("zooks_357_490")
SWEP.Primary.RPM				= 325						// This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 6						// Size of a clip
SWEP.Primary.DefaultClip		= 12
SWEP.Primary.Automatic			= false						// Automatic/Semi Auto
SWEP.Primary.Ammo				= "357"

SWEP.Primary.KickUp				= 5					// Maximum up recoil (rise)
SWEP.Primary.KickDown			= -5					// Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 3 				// Maximum up recoil (stock)

SWEP.EjectsShells = false
SWEP.Revolver = true -- So we don't get an extra bullet when reloading

SWEP.RunSightsPos = Vector (0, 0, 0)
SWEP.RunSightsAng = Vector (-24, 0, 0)

--Animations
SWEP.PrimAttackAnim 	= ACT_VM_PRIMARYATTACK
SWEP.DryFireAnim 		= ACT_VM_PRIMARYATTACK
SWEP.LastIronBullet		= ACT_VM_SECONDARYATTACK
SWEP.LastBulletAnim		= ACT_VM_PRIMARYATTACK

SWEP.IronInAnim 		= ACT_VM_DEPLOY
SWEP.IronInEmpty		= ACT_VM_DEPLOY
SWEP.IronOutEmpty		= ACT_VM_UNDEPLOY
SWEP.IronOutAnim 		= ACT_VM_UNDEPLOY
SWEP.IronFireAnim 		= ACT_VM_SECONDARYATTACK
SWEP.IronDryFireAnim	= ACT_VM_SECONDARYATTACK

SWEP.DrawAnim 			= ACT_VM_DRAW
SWEP.FirstDrawAnim 		= ACT_VM_DRAW
SWEP.EmptyDrawAnim 		= ACT_VM_DRAW

SWEP.ReloadAnim 		= ACT_VM_RELOAD
SWEP.EmptyReloadAnim 	= ACT_VM_RELOAD

SWEP.IdleAnim 			= ACT_VM_IDLE
SWEP.EmptyIdleAnim 		= ACT_VM_IDLE

SWEP.HolsterAnim 		= ACT_VM_HOLSTER
SWEP.QuickHolsterAnim	= ACT_VM_UNDEPLOY_2
SWEP.EmptyHolsterAnim 	= ACT_VM_HOLSTER


SWEP.Offset = {
	Pos = 
	{
	Up = 2,  		-- Z Axis	(Up/Down)
	Right = 0.75, 		-- X Axis	(Left/Right)
	Forward = 1, 	-- Y Axis	(Back/Forward)
	},
	Ang = 
	{
	Up = -90,		-- Rotate	(Left/Right)
	Right = 8,		-- Rolling``	(Back/Forth)
	Forward = 0,	-- Rolling	(Left/Right)
	}
}