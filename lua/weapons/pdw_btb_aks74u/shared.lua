// (Shared) Variables that are used on both client and server

// Base
SWEP.Base 						= "madfox2"

// Unique Info
SWEP.Category				= "BTB - PDWs"				// Category in weapons tab
SWEP.ViewModel				= "models/weapons/btb/v_aks74u.mdl"
SWEP.WorldModel				= "models/weapons/btb/w_aks74u.mdl"
SWEP.HoldType				= "ar2"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("BTB_AKS74U.Fire")	// Firing sound
SWEP.Primary.Round			= ("zooks_5.56x45_ap")		// Projectile to fire
SWEP.Primary.RPM			= 625						// RPM of the weapon
SWEP.Primary.ClipSize		= 30						// Size of a magazine
SWEP.Primary.DefaultClip	= 60						// Amount of ammo received when picked up
SWEP.Primary.Automatic		= true						// Fire mode
SWEP.Primary.Ammo			= "smg1"					// Ammo type

SWEP.Primary.KickUp			= 1.3						// Maximum upwards recoil (rise)
SWEP.Primary.KickDown		= 0.7						// Maximum downwards recoil (fall)
SWEP.Primary.KickHorizontal	= 1							// Maximum side-ways recoil (drift)

SWEP.EjectsShells 			= true						// Does the weapon eject shells?
SWEP.ShellDelay 			= 0							// Should we delay the effect? (Nice on pistols or bolt action snipers)
SWEP.ShellEffect 			= "sim_shelleject_fas_556" 	// Shell to use

// Position of the weapon while sprinting
SWEP.RunSightsPos = Vector (0, 0, 0)
SWEP.RunSightsAng = Vector (-10, 22.5, -10)

// Animation enumerations used by the weapon
// Draw
SWEP.DrawAnim 			= ACT_VM_DRAW
SWEP.FirstDrawAnim 		= ACT_VM_DRAW_EMPTY
SWEP.EmptyDrawAnim 		= ACT_VM_DRAW
// Shoot
SWEP.PrimAttackAnim 	= ACT_VM_PRIMARYATTACK 		-- SWEP.FireAnim
SWEP.LastIronBullet		= ACT_VM_SECONDARYATTACK	-- SWEP.LastIronFireAnim
SWEP.LastBulletAnim		= ACT_VM_PRIMARYATTACK		-- SWEP.LastFireAnim
SWEP.IronFireAnim 		= ACT_VM_SECONDARYATTACK	-- SWEP.IronFireAnim
--SWEP.IronDryFireAnim	= ACT_VM_SECONDARYATTACK
--SWEP.DryFireAnim 		= ACT_VM_PRIMARYATTACK
// Ironsights
SWEP.IronInAnim 		= ACT_VM_DEPLOY
SWEP.IronOutAnim 		= ACT_VM_UNDEPLOY
SWEP.IronInEmpty		= ACT_VM_DEPLOY
SWEP.IronOutEmpty		= ACT_VM_UNDEPLOY
// Reload
SWEP.ReloadAnim 		= ACT_VM_RELOAD
SWEP.EmptyReloadAnim 	= ACT_VM_RELOAD_EMPTY
// Idle
SWEP.IdleAnim 			= ACT_VM_IDLE
SWEP.EmptyIdleAnim 		= ACT_VM_IDLE
// Holster
SWEP.HolsterAnim 		= ACT_VM_HOLSTER
SWEP.QuickHolsterAnim	= ACT_VM_UNDEPLOY_2
SWEP.EmptyHolsterAnim 	= ACT_VM_HOLSTER

// World model position
SWEP.Offset = {
	Pos = 
	{
	Up = 4.5,  		-- Z Axis	(Up/Down)
	Right = 1, 		-- X Axis	(Left/Right)
	Forward = 5, 	-- Y Axis	(Back/Forward)
	},
	Ang = 
	{
	Up = -90,		-- Rotate	(Left/Right)
	Right = 8,		-- Rolling	(Back/Forward)
	Forward = 0,	-- Rolling	(Left/Right)
	}
}