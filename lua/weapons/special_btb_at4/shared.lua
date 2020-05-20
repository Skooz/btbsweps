// Variables that are used on both client and server
SWEP.Base 						= "madfox2"

SWEP.Category					= "BTB - Special"
SWEP.ViewModel					= "models/weapons/btb/v_at4.mdl"
SWEP.WorldModel					= "models/weapons/btb/w_at4.mdl"
SWEP.HoldType					= "rpg"
SWEP.Spawnable					= true
SWEP.AdminSpawnable				= true

SWEP.Primary.Sound				= Sound("BTB_RPG7.Fire")
SWEP.Primary.Round				= ("zooks_rpg_heat")
SWEP.Primary.RPM				= 50						// This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 1						// Size of a clip
SWEP.Primary.DefaultClip		= 4
SWEP.Primary.Automatic			= false						// Automatic/Semi Auto
SWEP.Primary.Ammo				= "RPG_Round"

SWEP.Primary.KickUp				= 6					// Maximum up recoil (rise)
SWEP.Primary.KickDown			= 6					// Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 6					// Maximum up recoil (stock)

SWEP.EjectsShells 			= false

SWEP.RunSightsPos 			= Vector (0, 0, 0)
SWEP.RunSightsAng 			= Vector (-24, 0, 0)

--Animations
SWEP.DrawAnim 				= ACT_VM_DRAW
SWEP.FirstDrawAnim 			= ACT_VM_DRAW
SWEP.EmptyDrawAnim 			= ACT_VM_DRAW

SWEP.PrimAttackAnim 		= ACT_VM_PRIMARYATTACK
SWEP.IronFireAnim 			= ACT_VM_SECONDARYATTACK
SWEP.LastIronBullet			= ACT_VM_SECONDARYATTACK
SWEP.LastBulletAnim			= ACT_VM_PRIMARYATTACK
SWEP.DryFireAnim 			= ACT_VM_PRIMARYATTACK
SWEP.IronDryFireAnim		= ACT_VM_DRYFIRE

SWEP.IronInAnim 			= ACT_VM_DEPLOY
SWEP.IronInEmpty			= ACT_VM_DEPLOY
SWEP.IronOutEmpty			= ACT_VM_UNDEPLOY
SWEP.IronOutAnim 			= ACT_VM_UNDEPLOY

SWEP.ReloadAnim 			= ACT_VM_RELOAD
SWEP.EmptyReloadAnim 		= ACT_VM_RELOAD

SWEP.IdleAnim 				= ACT_VM_IDLE
SWEP.EmptyIdleAnim 			= ACT_VM_IDLE

SWEP.HolsterAnim 			= ACT_VM_HOLSTER
SWEP.QuickHolsterAnim		= ACT_VM_UNDEPLOY_2
SWEP.EmptyHolsterAnim 		= ACT_VM_HOLSTER

SWEP.Offset = {
	Pos = 
	{
	Up			= 2,  		-- Z Axis	(Up/Down)
	Right 		= 0, 		-- X Axis	(Left/Right)
	Forward		= 1, 		-- Y Axis	(Back/Forward)
	},
	
	Ang = 
	{
	Up 			= -90,		-- Rotate	(Left/Right)
	Right 		= 8,		-- Rolling``	(Back/Forth)
	Forward 	= 0,		-- Rolling	(Left/Right)
	}
}