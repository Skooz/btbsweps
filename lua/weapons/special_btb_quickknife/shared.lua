// Variables that are used on both client and server

SWEP.Base 				= "madfox2"

local RecoilMult 	= CreateClientConVar("RecoilMult", 1.00, true, false, "Recoil multiplier. Do you want more, or less?")

// Weapon Descriptions
SWEP.Category				= "BTB - Special"
SWEP.Author					= "\nZookie, Marlwolf, Generic Default, Magenta, Siminov"
SWEP.Contact				= "\nDiscord: Zookie#0210"
SWEP.Purpose				= "BTB SWeps"
SWEP.Instructions			= "E + R = Holster\nE + Left Mouse = Select Fire"

// Settings		
SWEP.Spawnable				= false
SWEP.AdminSpawnable			= false
SWEP.ViewModel				= Model("models/weapons/btb/v_quickknife.mdl")
SWEP.WorldModel				= Model("models/weapons/btb/w_knife.mdl")
SWEP.ViewModelFOV = 55

SWEP.HoldType				= "knife"

SWEP.Primary.KickUp				= 3				// Maximum up recoil (rise)
SWEP.Primary.KickDown			= 3				// Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 3				// Maximum up recoil (stock)
SWEP.Primary.Delay 			= 0.8
SWEP.Primary.ClipSize		= -1					// Size of a clip
SWEP.Primary.DefaultClip	= 1					// Default number of bullets in a clip
SWEP.Primary.Automatic		= true				// Automatic/Semi Auto
SWEP.Primary.Ammo			= ""

SWEP.Secondary.ClipSize		= -1					// Size of a clip
SWEP.Secondary.DefaultClip	= -1					// Default number of bullets in a clip
SWEP.Secondary.Automatic	= false				// Automatic/Semi Auto
SWEP.Secondary.Ammo			= "none"

SWEP.ShellEffect			= "none"				// "effect_mad_shell_pistol" or "effect_mad_shell_rifle" or "effect_mad_shell_shotgun"
SWEP.ShellDelay				= 0

SWEP.RunArmOffset 			= Vector (0, 0, 0)
SWEP.RunArmAngle	 		= Vector (0, 0, 0)

SWEP.Offset = {
	Pos = 
	{
	Up = -1,  		-- Z Axis	(Up/Down)
	Right = 5.5, 		-- X Axis	(Left/Right)
	Forward = 1, 	-- Y Axis	(Back/Forward)
	},
	Ang = 
	{
	Up = -90,			-- Rotate	(Left/Right)
	Right = -105,		-- Rolling	(Back/Forth)
	Forward = 0,		-- Rolling	(Left/Right)
	}
}

SWEP.HolsterAnim 		= ACT_VM_HOLSTER
SWEP.DrawAnim 			= ACT_VM_DRAW
SWEP.FirstDrawAnim 		= ACT_VM_DRAW
SWEP.EmptyDrawAnim 		= ACT_VM_DRAW

SWEP.PrimAttackAnim 	= ACT_VM_PRIMARYATTACK
SWEP.DryFireAnim 		= ACT_VM_PRIMARYATTACK
SWEP.LastIronBullet		= ACT_VM_PRIMARYATTACK
SWEP.LastBulletAnim		= ACT_VM_PRIMARYATTACK
SWEP.IronFireAnim 		= ACT_VM_PRIMARYATTACK
SWEP.IronDryFireAnim	= ACT_VM_PRIMARYATTACK

SWEP.IronInAnim 		= NULL
SWEP.IronOutAnim 		= NULL
SWEP.IronInEmpty		= NULL
SWEP.IronOutEmpty		= NULL

SWEP.ReloadAnim 		= NULL
SWEP.EmptyReloadAnim 	= NULL

SWEP.UseIdle = true
SWEP.IdleAnim 			= ACT_VM_IDLE
SWEP.EmptyIdleAnim 		= ACT_VM_IDLE

SWEP.HolsterAnim 		= ACT_VM_HOLSTER
SWEP.QuickHolsterAnim	= ACT_VM_UNDEPLOY_2
SWEP.EmptyHolsterAnim 	= ACT_VM_HOLSTER

/*
ANIMS

Idle: ACT_VM_IDLE
Draw: ACT_VM_DRAW
Holster: ACT_VM_HOLSTER
Swing 1: ACT_VM_PRIMARYATTACK
Swing 2?: ACT_VM_IDLE_3

*/

function SWEP:Deploy()
	if not IsValid(self.Owner) then return end

	self.Owner:SetAnimation(PLAYER_ATTACK1)
	self.Weapon:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
	self.Owner:GetViewModel():SetPlaybackRate(1.5)

	self:SetNWFloat("InAnim", CurTime() + self.Owner:GetViewModel():SequenceDuration())
	local animTime = self.Owner:GetViewModel():SequenceDuration()/12
	local tr = {}
	tr.start = self.Owner:GetShootPos()
	tr.endpos = self.Owner:GetShootPos() + (self.Owner:GetAimVector() * 65)
	tr.filter = self.Owner
	tr.mask = MASK_SHOT
	local trace = util.TraceLine(tr)
	if (trace.Hit) then
		bullet = {}
		bullet.Num    = 1
		bullet.Src    = self.Owner:GetShootPos()
		bullet.Dir    = self.Owner:GetAimVector()
		bullet.Spread = Vector(0, 0, 0)
		bullet.Tracer = 0
		// If we hit an NPC
		if trace.Entity:IsPlayer() or string.find(trace.Entity:GetClass(),"npc") or string.find(trace.Entity:GetClass(),"prop_ragdoll") then
			bullet.Force  = 1
			bullet.Damage = 75
			timer.Simple(animTime, 
			function() 
				self.Owner:FireBullets(bullet)
				self.Weapon:EmitSound("BTB_KNIFE.Stab")
			end)
		else // If we hit something else
			bullet.Force  = 1
			bullet.Damage = 50
			timer.Simple(animTime, 
			function() 
				self.Owner:FireBullets(bullet) 
				self.Weapon:EmitSound("BTB_KNIFE.Stab")
				util.Decal("ManhackCut", trace.HitPos + trace.HitNormal, trace.HitPos - trace.HitNormal)
			end)
		end
	else // If we hit nothing
		self.Weapon:EmitSound("BTB_KNIFE.Swing")
	end 

	// Do Recoil
	timer.Simple(animTime, 
	function() 
		-- Calculate angles
		local anglo
		if self.Owner:KeyDown(IN_DUCK) then
			anglo = Angle(math.Rand(-(self.Primary.KickDown/2)*RecoilMult:GetFloat(),(self.Primary.KickUp/2)*RecoilMult:GetFloat()), math.Rand(-(self.Primary.KickHorizontal/4)*RecoilMult:GetFloat(),(self.Primary.KickHorizontal/4)*RecoilMult:GetFloat()), 0)
		else
			anglo = Angle(math.Rand(-(self.Primary.KickDown/2)*RecoilMult:GetFloat(),(self.Primary.KickUp/2)*RecoilMult:GetFloat()), math.Rand(-(self.Primary.KickHorizontal/2)*RecoilMult:GetFloat(),(self.Primary.KickHorizontal/2)*RecoilMult:GetFloat()), 0)
		end
		-- Do recoil with angles
		self.Owner:ViewPunch(anglo)
		if (game.SinglePlayer() and SERVER) or (not game.SinglePlayer() and CLIENT) then
			self.Owner:SetEyeAngles(self.Owner:EyeAngles() - anglo)
		end
	end)
end

// This is quickknife, so we attack on deploy
function SWEP:PrimaryAttack()
end

// None of this
function SWEP:SecondaryAttack()
end

// Don't reload knives
function SWEP:Reload()
end

// Don't need to think
function SWEP:Think()
end