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

	if timer.Exists("StartIdle") then timer.Destroy("StartIdle") end

	self.Owner:SetAnimation(PLAYER_ATTACK1)
	self.Weapon:SendWeaponAnim(ACT_VM_PRIMARYATTACK)

	self:SetNWFloat("InAnim", CurTime() + self.Owner:GetViewModel():SequenceDuration())

	local animTime = self.Owner:GetViewModel():SequenceDuration()/12

	local tr = {}
	tr.start = self.Owner:GetShootPos()
	tr.endpos = self.Owner:GetShootPos() + (self.Owner:GetAimVector() * 65)
	tr.filter = self.Owner
	tr.mask = MASK_SHOT
	local trace = util.TraceLine(tr)
	if (trace.Hit) then
		if not IsFirstTimePredicted() then return end
		// If we hit an NPC
		if trace.Entity:IsPlayer() or string.find(trace.Entity:GetClass(),"npc") or string.find(trace.Entity:GetClass(),"prop_ragdoll") then
			if self:EntsInSphereBack(tr.endpos, 12) then
				self.Owner:GetViewModel():SetPlaybackRate(1.5)
				bullet = {}
				bullet.Num    = 1
				bullet.Src    = self.Owner:GetShootPos()
				bullet.Dir    = self.Owner:GetAimVector()
				bullet.Spread = Vector(0, 0, 0)
				bullet.Tracer = 0
				bullet.Force  = 1
				bullet.Damage = 60
				timer.Simple(animTime, function() self.Owner:FireBullets(bullet) end)
				self.Weapon:EmitSound("BTB_KNIFE.Stab")
				return
			end 
			self.Owner:GetViewModel():SetPlaybackRate(1.5)
			bullet = {}
			bullet.Num    = 1
			bullet.Src    = self.Owner:GetShootPos()
			bullet.Dir    = self.Owner:GetAimVector()
			bullet.Spread = Vector(0, 0, 0)
			bullet.Tracer = 0
			bullet.Force  = 1
			bullet.Damage = 35
			timer.Simple(animTime, function() self.Owner:FireBullets(bullet) end)
			self.Weapon:EmitSound("BTB_KNIFE.Stab")
		else // If we hit something else
			self.Owner:GetViewModel():SetPlaybackRate(1.5)
			bullet = {}
			bullet.Num    = 1
			bullet.Src    = self.Owner:GetShootPos()
			bullet.Dir    = self.Owner:GetAimVector()
			bullet.Spread = Vector(0, 0, 0)
			bullet.Tracer = 0
			bullet.Force  = 1
			bullet.Damage = 25
			timer.Simple(animTime, 
			function() 
				self.Owner:FireBullets(bullet) 
				util.Decal("ManhackCut", trace.HitPos + trace.HitNormal, trace.HitPos - trace.HitNormal)
			end)
			self.Weapon:EmitSound("BTB_KNIFE.Stab")
		end
	else // If we hit nothing
		if not IsFirstTimePredicted() then return end
		self.Owner:GetViewModel():SetPlaybackRate(1.5)
		self.Weapon:EmitSound("BTB_KNIFE.Swing")
	end 

	self.Weapon:SetNextPrimaryFire(CurTime() + self.Primary.Delay)

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

/*---------------------------------------------------------
   Name: SWEP:PrimaryAttack()
   Desc: +attack1 has been pressed.
---------------------------------------------------------*/
function SWEP:PrimaryAttack()
end

/*---------------------------------------------------------
   Name: SWEP:EntityFaceBack
   Desc: Is the entity face back to the player?
---------------------------------------------------------*/
function SWEP:EntsInSphereBack(pos, range)

	local ents = ents.FindInSphere(pos, range)

	for k, v in pairs(ents) do
		if v ~= self and v ~= self.Owner and (v:IsNPC() or v:IsPlayer()) and IsValid(v) and self:EntityFaceBack(v) then
			return true
		end
	end

	return false
end

/*---------------------------------------------------------
   Name: SWEP:EntityFaceBack
   Desc: Is the entity face back to the player?
---------------------------------------------------------*/
function SWEP:EntityFaceBack(ent)

	local angle = self.Owner:GetAngles().y - ent:GetAngles().y

	if angle < -180 then angle = 360 + angle end
	if angle <= 90 and angle >= -90 then return true end

	return false
end

/*---------------------------------------------------------
   Name: SWEP:SecondaryAttack()
   Desc: +attack2 has been pressed.
---------------------------------------------------------*/
function SWEP:SecondaryAttack()
end

// Don't reload knives
function SWEP:Reload()
end

// Don't need to think
function SWEP:Think()
end