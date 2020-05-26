// Variables that are used on both client and server
SWEP.Base 						= "madfox2"

local RecoilMult 				= CreateClientConVar("RecoilMult", 1.00, true, false, "Recoil multiplier. Do you want more, or less?")

SWEP.Category					= "BTB - Special"
SWEP.ViewModel					= "models/weapons/btb/v_fraggrenade_smoke.mdl"
SWEP.WorldModel					= "models/weapons/btb/w_fraggrenade_smoke.mdl"
SWEP.HoldType					= "melee"
SWEP.Spawnable					= true
SWEP.AdminSpawnable				= true
SWEP.ViewModelFOV = 55

SWEP.Primary.Sound				= Sound("")
SWEP.Primary.Round				= ("zooks_smokenade2")
SWEP.Primary.Delay				= 1						// This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 1						// Size of a clip
SWEP.Primary.DefaultClip		= 1
SWEP.Primary.Automatic			= false						// Automatic/Semi Auto
SWEP.Primary.Ammo				= "Grenade"

SWEP.Primary.KickUp				= 5							// Maximum up recoil (rise)
SWEP.Primary.KickDown			= 5							// Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 5							// Maximum up recoil (stock)

--Animations

/*
Idle: ACT_VM_IDLE
Draw: ACT_VM_DRAW
Holster: ACT_VM_HOLSTER
Holster Quick: ACT_VM_UNDEPLOY_2

Ready: ACT_VM_HAULBACK
Throw: ACT_VM_THROW

Prone Move: ACT_VM_IDLE_3
*/

/*
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


SWEP.QuickHolsterAnim	= ACT_VM_UNDEPLOY_2
SWEP.EmptyHolsterAnim 	= ACT_VM_HOLSTER
*/

SWEP.HolsterAnim 		= ACT_VM_HOLSTER

SWEP.Offset = {
	Pos = 
	{
	Up = 1,  		-- Z Axis	(Up/Down)
	Right = 1, 		-- X Axis	(Left/Right)
	Forward = 1.5, 	-- Y Axis	(Back/Forward)
	},
	Ang = 
	{
	Up = -90,		-- Rotate	(Left/Right)
	Right = 8,		-- Rolling``	(Back/Forth)
	Forward = 0,	-- Rolling	(Left/Right)
	}
}


/*---------------------------------------------------------
Deploy

- Deploy\draw the weapon. 
- Do deploy animation and some variable setup here.
---------------------------------------------------------*/
function SWEP:Deploy()

	if not IsFirstTimePredicted() then return end

	// Strip the grenade if we've got no more grenades
	if self.Owner:GetAmmoCount(self:GetPrimaryAmmoType()) <= 0 and self.Weapon:Clip1() <= 0 then
		self.Owner:StripWeapon(self:GetClass())
		return false
	end

	// Set variables
	self:SetNWBool("CanPrep", true)
	self:SetNWBool("FirstHolster", true)
	self:SetIronsights(false, self.Owner)
	self:SetNWBool("Holster", false)
	self:SetNWBool("InIron", false)
	
	// Draw animations
	if self.Weapon:Clip1() <= 0 then
		self.Weapon:DefaultReload(ACT_VM_DRAW)
	else
		self.Weapon:SendWeaponAnim( ACT_VM_DRAW )
	end
	
	// Set timers
	self:SetNWFloat("InAnim", CurTime() + self.Owner:GetViewModel():SequenceDuration())
	self.Weapon:SetNextSecondaryFire(CurTime() + self.Owner:GetViewModel():SequenceDuration())
	self.Weapon:SetNextPrimaryFire(CurTime() + self.Owner:GetViewModel():SequenceDuration())
	
	// Deploy succesful
	return true
	
end

/*---------------------------------------------------------
   Name: SWEP:PrimaryAttack()
   Desc: +attack1 has been pressed.
---------------------------------------------------------*/
function SWEP:PrimaryAttack()
end

/*---------------------------------------------------------
   Name: SWEP:SecondaryAttack()
   Desc: +attack2 has been pressed.
---------------------------------------------------------*/
function SWEP:SecondaryAttack()
end

/*---------------------------------------------------------
FireRocket

- Throw our grenade
- This is lazy, I know.
---------------------------------------------------------*/
function SWEP:FireRocket() 

	if SERVER then
		local bullet = ents.Create(self.Primary.Round)
		if !bullet:IsValid() then return false end
		bullet:SetVelocity(self.Owner:GetAimVector() * 50)
		bullet:SetAngles(self.Owner:GetAimVector():Angle()+Angle(90,0,0))
		bullet:SetPos(self.Owner:GetShootPos())
		bullet:SetOwner(self.Owner)
		bullet:Spawn()
		bullet:Activate()
		local phys = bullet:GetPhysicsObject()
		phys:SetVelocity(self.Owner:GetAimVector() * 1000)
		phys:AddAngleVelocity(Vector(0, 0, 0))
	end

	// Recoil
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

end

function SWEP:PrepNade()

	if self.Owner:KeyPressed(IN_ATTACK) and self:GetNWBool("CanPrep") then
		if not IsFirstTimePredicted() then return end
		self:SendWeaponAnim(ACT_VM_HAULBACK)
		self:SetNWFloat("PrepAnim", CurTime() + self.Owner:GetViewModel():SequenceDuration())
		self:SetNWBool("CanPrep", false)
		self:SetNWBool("CanThrow", true)
	end
end

function SWEP:ThrowNade()

	if self.Owner:KeyReleased(IN_ATTACK) and self:GetNWBool("CanThrow") then
		if not IsFirstTimePredicted() or not IsValid(self.Owner) then return end
		self.Owner:SetAnimation(PLAYER_ATTACK1)
		self:TakePrimaryAmmo(1)
		if self:GetNWFloat("PrepAnim") > CurTime() then
			self:SetNWBool("CanThrow", false)
			timer.Simple(self:GetNWFloat("PrepAnim")-CurTime() + 0.2, 
			function()
				self:SendWeaponAnim(ACT_VM_THROW)
				self:FireRocket()
				self:SetNWFloat("ThrowAnim", CurTime() + self.Owner:GetViewModel():SequenceDuration())
				timer.Simple(self.Owner:GetViewModel():SequenceDuration(), 
				function() 
					self:Deploy()
				end)
			end)
		else
			self:SetNWBool("CanThrow", false)
			self:SendWeaponAnim(ACT_VM_THROW)
			self:FireRocket()
			self:SetNWFloat("ThrowAnim", CurTime() + self.Owner:GetViewModel():SequenceDuration())
			timer.Simple(self.Owner:GetViewModel():SequenceDuration(), 
			function() 
				self:Deploy()
			end)
		end
	end

end

function SWEP:Think()

	self:PrepNade()
	self:ThrowNade()

end

function SWEP:Reload()
end