// Variables that are used on both client and server
SWEP.Base 						= "madfox2"

local RecoilMult 				= CreateClientConVar("RecoilMult", 1.00, true, false, "Recoil multiplier. Do you want more, or less?")

SWEP.Category					= "BTB - Special"
SWEP.ViewModel					= "models/weapons/btb/v_fraggrenade.mdl"
SWEP.WorldModel					= "models/weapons/btb/w_fraggrenade_thrown.mdl"
SWEP.HoldType					= "melee"
SWEP.Spawnable					= true
SWEP.AdminSpawnable				= true

SWEP.Primary.Sound				= Sound("")
SWEP.Primary.Round				= ("zooks_fragnade2")
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

SWEP.HolsterAnim 		= ACT_VM_HOLSTER
SWEP.DrawAnim 			=  ACT_VM_DRAW

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

- Deploy and reload the grenade
- Strip it if we're out of grenades
---------------------------------------------------------*/
function SWEP:Deploy()

	// You can't have a grenade in your hand if you have no grenades. Big thonk.
	if self.Owner:GetAmmoCount(self:GetPrimaryAmmoType()) <= 0 and self.Weapon:Clip1() <= 0 then
		self.Owner:StripWeapon(self:GetClass())
		return false
	end

	// Draw animations
	if self.Weapon:Clip1() <= 0 then 
		self.Weapon:DefaultReload(ACT_VM_DRAW) // Reload here! Makes it easy.
	else 
		self.Weapon:SendWeaponAnim(ACT_VM_DRAW) // Just draw.
	end
	
	// Set variables
	self:SetNWBool("CanPrep", true)
	self:SetNWBool("FirstHolster", true)
	self:SetIronsights(false, self.Owner)
	self:SetNWBool("Holster", false)
	self:SetNWBool("InIron", false)

	// Set timers
	self:SetNWFloat("InAnim", CurTime() + self.Owner:GetViewModel():SequenceDuration())
	self.Weapon:SetNextSecondaryFire(CurTime() + self.Owner:GetViewModel():SequenceDuration())
	self.Weapon:SetNextPrimaryFire(CurTime() + self.Owner:GetViewModel():SequenceDuration())

	// Deploy succesful
	return true
	
end


/*---------------------------------------------------------
PrepNade

- Pull the pin
---------------------------------------------------------*/
function SWEP:PrepNade()

	if self.Owner:KeyPressed(IN_ATTACK) and self:GetNWBool("CanPrep") then
		if not IsFirstTimePredicted() then return end
		self:SendWeaponAnim(ACT_VM_HAULBACK)
		self:SetNWFloat("PrepAnim", CurTime() + self.Owner:GetViewModel():SequenceDuration())
		self:SetNWBool("CanPrep", false)
		self:SetNWBool("CanThrow", true)
	end
end


/*---------------------------------------------------------
ThrowNade

- Throw the grenade!
---------------------------------------------------------*/
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


/*---------------------------------------------------------
FireRocket

- Spawn our grenade
---------------------------------------------------------*/
function SWEP:FireRocket() 

	// How fast we throwin'?
	local throwVelocity = 1000 

	// Make the entity
	if SERVER then
		local grenade = ents.Create(self.Primary.Round)
		if !grenade:IsValid() then return false end
		grenade:SetVelocity(self.Owner:GetAimVector() * 50)
		grenade:SetAngles(self.Owner:GetAimVector():Angle()+Angle(90,0,0))
		grenade:SetPos(self.Owner:GetShootPos())
		grenade:SetOwner(self.Owner)
		grenade:Spawn()
		grenade:Activate()
		local phys = grenade:GetPhysicsObject()
		phys:SetVelocity(self.Owner:GetAimVector() * throwVelocity) 
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


function SWEP:Think()

	self:PrepNade()
	self:ThrowNade()
	self:Sway()
	
	// TODO: Logic for these
	-- self:Melee()
	-- self:HolsterWep()

	// Unused
	-- self:IronSights()
	-- self:SelectFire()
	-- self:Sprint()

end


// Unused functions - Cancel out stuff we don't want from the base

function SWEP:PrimaryAttack()
end

function SWEP:SecondaryAttack()
end

function SWEP:Reload()
end