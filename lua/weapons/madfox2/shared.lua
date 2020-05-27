/*---------------------------------------------------------
~ BTB Sweps
~
~ These are mainly meant to be used in SP. MP polish is WIP.
~
~ Generic Default 	- The only guy who really did anything cool tbh
~ Zookie 			- lmao fuck this guy
~ Marlwolf 			- bro
~ Magenta 			- Dude she's so angry at me like why
~ Siminov 			- I'd suck his dick but he'd probably get to mine first
---------------------------------------------------------*/

local ToggleSights	= CreateClientConVar("ToggleSights", 0, true, false, "Makes it so ironsights are toggled, and not held")		// Enable/Disable
local UseGDCBullets = CreateClientConVar("UseGDCBullets", 1, true, false, "Use GDC bullet entities")
local RecoilMult 	= CreateClientConVar("RecoilMult", 1.00, true, false, "Recoil multiplier. Do you want more, or less?")

// Weapon Descriptions
SWEP.Category				= "BTB - Base"
SWEP.Author					= "\nZookie, Marlwolf, Generic Default, Magenta, Siminov"
SWEP.Contact				= "\nDiscord: Zookie#0210"
SWEP.Purpose				= "BTB SWeps"
SWEP.Instructions			= "E + R = Holster\nE + Left Mouse = Select Fire\nE + Right Mouse = Melee"

// Settings
SWEP.ViewModel				= Model("")
SWEP.WorldModel				= Model("")
SWEP.ViewModelFOV			= 55		
SWEP.ViewModelFlip			= false		
SWEP.DrawCrosshair			= false	
SWEP.Spawnable				= false
SWEP.AdminSpawnable			= false

// Primary
SWEP.Primary.Sound 			= Sound("")				
SWEP.Primary.Round 			= ("")					
SWEP.Primary.Cone			= 0.0					
SWEP.Primary.RPM			= 0					// This is in Rounds Per Minute
SWEP.Primary.ClipSize		= 0					// Size of a clip
SWEP.Primary.DefaultClip	= 0					// Default number of bullets in a clip
SWEP.Primary.KickUp			= 0					// Maximum up recoil (rise)
SWEP.Primary.KickDown		= 0					// Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal	= 0					// Maximum side recoil (koolaid)
SWEP.Primary.Automatic		= true				// Automatic/Semi Auto
SWEP.Primary.Ammo			= "none"			// What kind of ammo

// Secondary
SWEP.Secondary.ClipSize		= 0					// Size of a clip
SWEP.Secondary.DefaultClip	= 0					// Default number of bullets in a clip
SWEP.Secondary.Automatic	= false					// Automatic/Semi Auto
SWEP.Secondary.Ammo			= "none"
SWEP.Secondary.IronFOV		= 65					// UNUSED

// Deprecated - Just a helper (for now) for this addon
SWEP.IronSightsPos 			= Vector (0, 0, 0)
SWEP.IronSightsAng 			= Vector (0, 0, 0)

// Run Position
SWEP.RunSightsPos 			= Vector (0, 0, 0)
SWEP.RunSightsAng 			= Vector (0, 0, 0)

// Shells
SWEP.EjectsShells 			= false
SWEP.ShellDelay 			= 0
SWEP.ShellEffect 			= ""


/*---------------------------------------------------------
Initialize

- Called before deploy
- Setup variables and other junk here.
---------------------------------------------------------*/
function SWEP:Initialize()
		
	// Fetch the hand-skin and apply it
	// Currently has issues saving with the slider menu
	if self.Owner:IsPlayer() and file.Exists("Plyr_BTB_Hands/"..self.Owner:UniqueID()..".txt","DATA") then
		self.Owner:GetViewModel():SetBodygroup(1,tonumber(file.Read("Plyr_BTB_Hands/"..self.Owner:UniqueID()..".txt")))
	end
	
	// Set the hold-type
	self:SetWeaponHoldType(self.HoldType)

end


/*---------------------------------------------------------
Equip(ply)

- (ply) is the player getting equipped, but this is just self anyways
- Mainly using this so whenever the weapon is equipped,
or picked up, the first draw animation is played.
---------------------------------------------------------*/
function SWEP:Equip(ply)
	self:SetNWBool("FirstDraw", true)
end


/*---------------------------------------------------------
Deploy

- Deploy\draw the weapon. 
- Do deploy animation and some variable setup here.
---------------------------------------------------------*/
function SWEP:Deploy()

	//if not IsFirstTimePredicted() then return end -- Probably don't want this because it'll just make it skip a bunch
	
	// Draw animations
	if self:GetNWBool("FirstDraw") and self.Weapon:Clip1() != 0 then
		self:SetNWBool("FirstDraw", false)
		self.Weapon:SendWeaponAnim( self.FirstDrawAnim )
		self:SetNWFloat("InMelee", CurTime() + self.Owner:GetViewModel():SequenceDuration()) // Don't allow melee on first draw
	else
		if self.Weapon:Clip1() == 0 then	
			self.Weapon:SendWeaponAnim( self.EmptyDrawAnim )
		else
			self.Weapon:SendWeaponAnim( self.DrawAnim )
		end
	end

	// Establish default FOV for player
	self.Owner:SetFOV( 0 , 0.3 )
	self:SetNWFloat("OwnerFOV", self.Owner:GetFOV())

	// Set variables
	self:SetIronsights(false, self.Owner)
	self:SetNWBool("FirstHolster", true)
	self:SetNWBool("Holster", false)
	self:SetNWBool("InIron", false)

	// Reset the hold-type
	self:SetWeaponHoldType(self.HoldType)
	
	// Set timers
	self:SetNWFloat("InAnim", CurTime() + self.Owner:GetViewModel():SequenceDuration())
	self.Weapon:SetNextSecondaryFire(CurTime() + self.Owner:GetViewModel():SequenceDuration()-0.2)
	self.Weapon:SetNextPrimaryFire(CurTime() + self.Owner:GetViewModel():SequenceDuration()-0.2)

	if self.UseIdle then timer.Simple(self.Owner:GetViewModel():SequenceDuration(), function() if IsValid(self.Weapon) then self.Weapon:SendWeaponAnim(ACT_VM_IDLE) end end) end
	
	// Deploy succesful
	return true
	
end

/*---------------------------------------------------------
Holster

- (wep) is the weapon entity we're switching to
- This function is adjusted to: first play the holster
anim when swapping weapons, then call SelectWeapon when
the animation is complete, which will call holster again,
thereby properly swapping weapons.
---------------------------------------------------------*/
function SWEP:Holster( wep )

	if not IsFirstTimePredicted() or !IsValid(wep) or self:GetNWFloat("InReload") > CurTime() or self:GetNWFloat("SwapAnim") > CurTime() then return end
	
	// First holster attempt - Do animation and make sure it's not interrupted
	if self.Weapon:GetNWBool("FirstHolster") then
		self.Weapon:SendWeaponAnim( self.HolsterAnim )
		self.Weapon:EmitSound(Sound("Holster.Wep"))
		self:SetNWFloat("SwapAnim", CurTime() + self.Owner:GetViewModel():SequenceDuration())
		self.Weapon:SetNextSecondaryFire(CurTime() + self.Owner:GetViewModel():SequenceDuration())
		self.Weapon:SetNextPrimaryFire(CurTime() + self.Owner:GetViewModel():SequenceDuration())
		timer.Simple(self.Owner:GetViewModel():SequenceDuration(), 
			function()
				if !IsValid(self.Owner) or !IsValid(self.Weapon) then return end
				self.Weapon:SetNWBool("FirstHolster",false)
				if (SERVER) and self.Owner:HasWeapon(wep:GetClass()) then self.Owner:SelectWeapon(wep:GetClass()) end
			end)
		return false // Return false on the first call so we can do the animation
	else // Second holster attempt
		return true // Return true on the second call so we can swap weapons
	end

end


/*---------------------------------------------------------
HolsterWep

- Called in Think
- Allows for a manual holster. Adjusts holdtypes too.
- Mostly a roleplaying feature. Has no practical use.
---------------------------------------------------------*/
function SWEP:HolsterWep()

	if self:GetNWBool("InIron") == true or self:GetNWFloat("InReload") > CurTime() or self:GetNWFloat("InAnim") > CurTime() then return end

	if self.Owner:KeyDown(IN_USE) and self.Owner:KeyPressed(IN_RELOAD) and IsFirstTimePredicted() then
		if !self:GetNWBool("Holster") then
			self:SetNWBool("Holster", true)
			self.Weapon:SendWeaponAnim(self.HolsterAnim)
			self.Weapon:EmitSound(Sound("Holster.Wep"))
			if self.HoldType == "pistol" then
				self:SetWeaponHoldType("normal")
			elseif self.HoldType == "ar2" or self.HoldType == "smg" then
				self:SetWeaponHoldType("passive")
			end
		elseif self:GetNWBool("Holster") then
			self:SetNWBool("Holster", false)
			if self.Weapon:Clip1() == 0 then
				self.Weapon:SendWeaponAnim( self.EmptyDrawAnim )
			else
				self.Weapon:SendWeaponAnim( self.DrawAnim )
			end
			self.Weapon:EmitSound(Sound("Holster.Wep"))
			self:SetWeaponHoldType(self.HoldType)
		end
		self:SetNWFloat("InAnim", CurTime() + self.Owner:GetViewModel():SequenceDuration())
	end
	
end


/*---------------------------------------------------------
SelectFire

- Called in Think
- Allows us to swap between auto and semi-auto fire rates
- TODO: Add burst-fire option
---------------------------------------------------------*/
function SWEP:SelectFire()
	
	// Go by category, cuz why not?
	if self.Category == "BTB - Pistols" or self.Category == "BTB - Special" or self.Category == "BTB - Long-rifles" then return end

	if self.Owner:KeyDown(IN_USE) and self.Owner:KeyPressed(IN_ATTACK) and IsFirstTimePredicted() then
		if self.Primary.Automatic then
			self.Weapon:EmitSound(Sound("Fireselect.Switch"))
			self.Primary.Automatic = false
			if (SERVER) then self.Owner:PrintMessage(HUD_PRINTTALK, "Semi") end
		elseif not self.Primary.Automatic then
			self.Weapon:EmitSound(Sound("Fireselect.Switch"))
			self.Primary.Automatic = true
			if (SERVER) then self.Owner:PrintMessage(HUD_PRINTTALK, "Auto") end
		end
	end
	
end


/*---------------------------------------------------------
CanPrimaryAttack

- Helper function to set some conditions for whether
or not we can shoot. 
- Just neater to do it this way.
---------------------------------------------------------*/
function SWEP:CanPrimaryAttack()

	if self:GetNWBool("Holster") or self.Owner:KeyDown(IN_USE) or self.Owner:KeyDown(IN_SPEED) then 
		return false
	elseif ( self.Weapon:Clip1() <= 0 ) or self.Owner:WaterLevel() >= 3 then
		self:EmitSound("Dry.Pistol")
		self:SetNextPrimaryFire( CurTime() + 0.5 )
		return false
	else
		return true
	end

end


/*---------------------------------------------------------
PrimaryAttack

- Shooting things handled here; anim, sound, ammo, etc.
---------------------------------------------------------*/
function SWEP:PrimaryAttack()
	
	if !self:CanPrimaryAttack() then return end
	
	// Use GDC bullets or regular - Determined in settings menu\tab
	if UseGDCBullets:GetBool() then
		self:FireRocket() 			-- Fire the bullet-entity
	else
		self:ShootBullet(math.Rand(20,30), 1, 0) 	-- damage, numbullets, cone
	end
	
	self.Weapon:EmitSound(self.Primary.Sound)
	self.Weapon:TakePrimaryAmmo(1)
	
	// Animation handling
	if self.BoltAction then // Bolt-Actions
		self:SendWeaponAnim(ACT_VM_SECONDARYATTACK)
		self:SetNWFloat("InAnim", CurTime() + self.Owner:GetViewModel():SequenceDuration())
		timer.Simple(self.Owner:GetViewModel():SequenceDuration(), 
		function() 
			self:SendWeaponAnim( ACT_SHOTGUN_PUMP ) 
			self:SetNWFloat("InAnim", CurTime() + self.Owner:GetViewModel():SequenceDuration())	
		end)
	else // Regular weapons
		if self:GetNWBool("InIron") then
			if self.Weapon:Clip1() == 0 then
				self.Weapon:SendWeaponAnim( self.LastIronBullet )
			else
				self.Weapon:SendWeaponAnim( self.IronFireAnim )
			end
		else
			if self.Weapon:Clip1() == 0 then
				self.Weapon:SendWeaponAnim( self.LastBulletAnim )
			else
				self.Weapon:SendWeaponAnim( self.PrimAttackAnim	)
			end
		end
	end
	
	self:ShootFX()
	
	// Rate of fire - Converts RPM to delay to next show
	self.Weapon:SetNextPrimaryFire(CurTime() + (1/(self.Primary.RPM/60)))

end


/*---------------------------------------------------------
ShootFX

- Called in PrimaryAttack
- Handles various effects; muzzle flash and bullet shells
---------------------------------------------------------*/
function SWEP:ShootFX()
	
	if not IsFirstTimePredicted() then return end

	// Recoil
	-- Calculate angles
	local anglo
	if self.Owner:KeyDown(IN_DUCK) then
		anglo = Angle(math.Rand(-(self.Primary.KickDown/2)*RecoilMult:GetFloat(),(self.Primary.KickUp/2)*RecoilMult:GetFloat()), math.Rand(-(self.Primary.KickHorizontal/4)*RecoilMult:GetFloat(),(self.Primary.KickHorizontal/4)*RecoilMult:GetFloat()), 0)
	elseif self:GetNWBool("InIron") then
		anglo = Angle(math.Rand(-(self.Primary.KickDown/1.5)*RecoilMult:GetFloat(),(self.Primary.KickUp/1.5)*RecoilMult:GetFloat()), math.Rand(-(self.Primary.KickHorizontal/1.5)*RecoilMult:GetFloat(),(self.Primary.KickHorizontal/1.5)*RecoilMult:GetFloat()), 0)
	else
		anglo = Angle(math.Rand(-(self.Primary.KickDown)*RecoilMult:GetFloat(),(self.Primary.KickUp)*RecoilMult:GetFloat()), math.Rand(-(self.Primary.KickHorizontal)*RecoilMult:GetFloat(),(self.Primary.KickHorizontal)*RecoilMult:GetFloat()), 0)
	end
	-- Do recoil with angles
	self.Owner:ViewPunch(anglo)
	if (game.SinglePlayer() and SERVER) or (not game.SinglePlayer() and CLIENT) then
		self.Owner:SetEyeAngles(self.Owner:EyeAngles() - anglo)
	end
	
	// Shell ejection
	local fx = EffectData()
	if self.EjectsShells then
		timer.Simple(self.ShellDelay, function()
			if not IsValid(self.Owner) or not IsFirstTimePredicted() or not self.Owner:Alive() then return end
			fx:SetEntity(self.Weapon)
			fx:SetNormal(self.Owner:GetAimVector())
			fx:SetAttachment("2")
			util.Effect(self.ShellEffect,fx)
		end)
	end
	
	// Muzzle flash
	fx:SetEntity(self.Weapon)
	fx:SetOrigin(self.Owner:GetShootPos())
	fx:SetNormal(self.Owner:GetAimVector())
	fx:SetAttachment("1")
	util.Effect("effect_fok_flashsmoke",fx)
	
	// Third Person effects
	self.Owner:SetAnimation( PLAYER_ATTACK1 )	-- This is the third person animation
	self.Owner:MuzzleFlash()					-- Muzzle light from shooting
end


/*---------------------------------------------------------
FireRocket

- Called in PrimaryAttack
- Rockets are entities, as are Generic Default's bullets
- Think of GD's bullets as mini rockets
---------------------------------------------------------*/
function SWEP:FireRocket() 

	if SERVER then
		local bullet = ents.Create(self.Primary.Round)
		if !bullet:IsValid() then return false end
		bullet:SetAngles(self.Owner:GetAimVector():Angle()+Angle(90,0,0))
		bullet:SetPos(self.Owner:GetShootPos())
		bullet:SetOwner(self.Owner)
		bullet:Spawn()
		bullet:Activate()
	end

end


/*---------------------------------------------------------
ShootBullet

- Called in PrimaryAttack
- Shoot regular bullets.
- TODO: Actual damage value (handled in primaryattack)
---------------------------------------------------------*/
function SWEP:ShootBullet( damage, num_bullets, aimcone )

	local bullet = {}

	bullet.Num 		= num_bullets
	bullet.Src 		= self.Owner:GetShootPos() -- Source
	bullet.Dir 		= self.Owner:GetAimVector() -- Dir of bullet
	bullet.Spread 	= Vector( aimcone, aimcone, 0 )	-- Aim Cone
	bullet.Tracer	= 1 -- Show a tracer on every x bullets
	bullet.Force	= (0.1*damage) -- Amount of force to give to phys objects
	bullet.Damage	= damage
	bullet.AmmoType = "Pistol"

	self.Owner:FireBullets( bullet )

end


/*---------------------------------------------------------
SecondaryAttack

- Ironsights stuff is handled here because it's neatly
predicted and other junk. 
---------------------------------------------------------*/
function SWEP:SecondaryAttack()

	//if not IsFirstTimePredicted() then return end

	// This looks nicer, and nothing needs to happen on the client anyways(?)
	if (CLIENT) then return end

	if self:GetNWBool("Holster") or self.Owner:KeyDown(IN_SPEED) then return end

	local zoom = self:GetNWFloat("OwnerFOV") - 10

	if not self:GetNWBool("InIron") and !self.Owner:KeyDown(IN_USE) then
		self:SetNWBool("InIron" , true)
		self.Owner:SetFOV(zoom, 0.3 )
		if self.Weapon:Clip1() == 0 then
			self.Weapon:SendWeaponAnim( self.IronInEmpty )
		else
			self.Weapon:SendWeaponAnim( self.IronInAnim	)
		end
	elseif self:GetNWBool("InIron") then
		self:SetNWBool("InIron" , false)
		self.Owner:SetFOV( 0 , 0.3 )
		if self.Weapon:Clip1() == 0 then
			self.Weapon:SendWeaponAnim( self.IronOutEmpty )
		else
			self.Weapon:SendWeaponAnim( self.IronOutAnim )
		end
	end
	
	self:SetNWFloat("InAnim", CurTime() + self.Owner:GetViewModel():SequenceDuration())
	self.Weapon:SetNextPrimaryFire(CurTime() + self.Owner:GetViewModel():SequenceDuration() - 0.15)
	
end


/*---------------------------------------------------------
IronSights

- Called in Think
- This is a simple QOL function. It serves as a toggle
for the hold/toggle ironsights setting.
---------------------------------------------------------*/

function SWEP:IronSights()

	// By default, SecondaryAttack is only called when secondary attack (mouse 2) is PRESSED
	// This allows the ironsights to be a "hold", instead of a toggle, by calling SecondaryAttack again whenever mouse 2 is released.
	if not ToggleSights:GetBool() and self.Owner:KeyReleased(IN_ATTACK2) and self:GetNWBool("InIron") and IsFirstTimePredicted() then
		self:SecondaryAttack()
	end

end


/*---------------------------------------------------------
Reload

- Called when the reload button is pressed
- Might want a custom reload function; this is janky,
but hey, it works.
---------------------------------------------------------*/
function SWEP:Reload()
	
	if self.Owner:KeyDown(IN_USE) or self:GetNWFloat("SwapAnim") > CurTime() or self:GetNWBool("Holster") or self.Weapon:Clip1() >= self.Primary.ClipSize then 
		return
	elseif self:GetNWBool("InIron") and self.Weapon:Clip1() < self.Primary.ClipSize then
		self:SecondaryAttack()
	end
	
	// Do the reload
	if self.Weapon:Clip1() == 0 then
		self.Weapon:DefaultReload(self.EmptyReloadAnim)
	elseif self.Weapon:Clip1() < self.Primary.ClipSize and self:Ammo1() > 0 then 	
		self.Weapon:DefaultReload(self.ReloadAnim)
		timer.Simple(self.Owner:GetViewModel():SequenceDuration() + 0.02, 
		function()
			if (not IsValid(self.Owner) or not IsValid(self.Weapon) or not self.Owner:Alive()) or self.Revolver then return end
			self:SetClip1(self.Weapon:Clip1() + 1)
			self.Owner:RemoveAmmo( 1, self:GetPrimaryAmmoType() )
		end)
	end
	
	self:SetNWFloat("InReload", CurTime() + self.Owner:GetViewModel():SequenceDuration())
	
end


/*---------------------------------------------------------
Sprint

- Called in Think
- Uses GetViewModelPos to move the view-model to specified
vectors. Could be pasta'd as ironsights code, but we use
animations in this pack
---------------------------------------------------------*/
function SWEP:Sprint()
	if self.Owner:KeyDown(IN_SPEED) then
		// Disable ironsights; this is done here because SecondaryAttack cannot be called while sprinting, so we do it manually.
		// Yeah, it's fucking stupid, eat my ass
		if self:GetNWBool("InIron") then 
			self.Owner:SetFOV( 0, 0.3 )
			self:SetNWBool("InIron" , false)
			if self.Weapon:Clip1() == 0 then
				self.Weapon:SendWeaponAnim( self.IronOutEmpty )
			else
				self.Weapon:SendWeaponAnim( self.IronOutAnim )
			end
		end
		// Set a new hold-type while sprinting
		if self.HoldType == "pistol" or self.HoldType == "revolver" then
			self:SetWeaponHoldType("normal")
		else
			self:SetWeaponHoldType("passive")
		end
		// Set the sprinting position and move the gun
		self.IronSightsPos = self.RunSightsPos
		self.IronSightsAng = self.RunSightsAng
		self:SetIronsights(true, self.Owner)
	end				
	// Reset things after sprinting
	if self.Owner:KeyReleased (IN_SPEED) then
		self:SetWeaponHoldType(self.HoldType) 
		self:SetIronsights(false, self.Owner)
		if self.Owner:KeyDown(IN_ATTACK2) then -- Let player go back into ironsights
			self:SecondaryAttack()
		end
	end		
	
	// Potential for basic sprint anims
	/*
	if self.Owner:KeyPressed(IN_SPEED) then
		if not IsFirstTimePredicted() then return end
		self.Weapon:SendWeaponAnim( self.QuickHolsterAnim )
	end
	
	if self.Owner:KeyReleased(IN_SPEED) then
		if not IsFirstTimePredicted() then return end
		self.Weapon:SendWeaponAnim(self.DrawAnim)
	end
	*/
end


/*---------------------------------------------------------
Sway

- Called in Think.
- Sets Bob and Sway scales. Can be handy to adjust these for 
different situations, such as more bob\sway when running, 
etc.
---------------------------------------------------------*/
function SWEP:Sway()
	// Called in Think
	if self:GetNWBool("InIron") then
		self.SwayScale 	= 0.2
		self.BobScale 	= 0.2
	elseif self.Owner:KeyDown(IN_SPEED) then
		self.SwayScale 	= 1
		self.BobScale 	= 2
	else
		self.SwayScale 	= 1
		self.BobScale 	= 1
	end
end


/*---------------------------------------------------------
Melee

- Called in Think.
- Performs a close-range melee attack
---------------------------------------------------------*/
function SWEP:Melee()

	if self.Owner:KeyDown(IN_USE) and self.Owner:KeyPressed(IN_ATTACK2) and IsFirstTimePredicted() then
	
		if CurTime() < self:GetNWFloat("InMelee") or self:GetNWBool("InIron") or self:GetNWBool("Holster") then return end
		
		// Only rifles and long-rifles have a melee animation built-in
		if self.Category == "BTB - Rifles" or self.Category == "BTB - Long-rifles" and self.Weapon:GetClass() != "sniper_btb_m21" then
			self:SendWeaponAnim(ACT_VM_HITCENTER)
			self.Weapon:EmitSound("BTB_Folley.Cloth_Fast")
			local animTime = self.Owner:GetViewModel():SequenceDuration()/8
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
					bullet.Force  = 7
					bullet.Damage = 75
					timer.Simple(animTime, 
					function() 
						self.Owner:FireBullets(bullet) 
						self.Weapon:EmitSound("BTB_KNIFE.Stab")
					end)
				else // If we hit something else
					bullet.Force  = 7
					bullet.Damage = 50
					timer.Simple(animTime, 
					function() 
						self.Owner:FireBullets(bullet) 
						self.Weapon:EmitSound("BTB_KNIFE.Stab")
						util.Decal("ManhackCut", trace.HitPos + trace.HitNormal, trace.HitPos - trace.HitNormal)
					end)
				end
			else // If we hit nothing
				//self.Weapon:EmitSound("BTB_KNIFE.Swing")
			end 
		else // If we don't have a melee animation, use the quick-knife
			if !self:GetNWBool("FirstHolster") then return end
			self:SetNWBool("FirstHolster", false) 						// Disable the holster animation
			if (SERVER) then 
				self.Owner:Give("special_btb_quickknife") 				// Add a quick-knife to the player's inventory
				self.Owner:SelectWeapon("special_btb_quickknife")		// Swap to the quick-knife (it attacks on Deploy())
			end				
			timer.Simple(self.Owner:GetViewModel():SequenceDuration(), 	// Wait for the quick-knife animation to end
			function() 
				if self:Ammo1() == 0 and self:Clip1() == 0 then self.Owner:GiveAmmo(1,self.Primary.Ammo,true) self:SetNWBool("haha", true) end // game doesn't switch back to your weapon if you've got zero ammo lmao
				if (SERVER) then
					self.Owner:SelectWeapon(self.Weapon:GetClass())		// Swap to the previous weapon
					self.Owner:StripWeapon("special_btb_quickknife") 	// Remove the quick-knife
				end
				if self:GetNWBool("haha") then self.Owner:RemoveAmmo(1,self.Primary.Ammo) self:SetNWBool("haha", false) end // fucking dumb
				self:SetNWBool("FirstHolster", true)				// Reset FirstHolster
			end)
		end

		// Delays
		local animDur = CurTime() + self.Owner:GetViewModel():SequenceDuration() - 0.2
		self:SetNWFloat("InMelee", animDur)
		self.Weapon:SetNextSecondaryFire(animDur)
		self.Weapon:SetNextPrimaryFire(animDur)
	end

end

/*---------------------------------------------------------
Think

- Think is called every frame / tick
---------------------------------------------------------*/
function SWEP:Think()
	
	self:Melee()
	self:IronSights()
	self:SelectFire()
	self:Sprint()
	self:Sway()
	self:HolsterWep()

end


/*---------------------------------------------------------
GetViewModelPosition

- Manipulate viewmodel position
---------------------------------------------------------*/
local IRONSIGHT_TIME = 0.3

function SWEP:GetViewModelPosition(pos, ang)

	if (self.IronSightsPos) then
		local bIron = self.Weapon:GetNWBool("Ironsights")

		if (bIron != self.bLastIron) then
			self.bLastIron = bIron
			self.fIronTime = CurTime()
		end

		local fIronTime = self.fIronTime or 0

		if (not bIron and fIronTime < CurTime() - IRONSIGHT_TIME) then
			return pos, ang
		end

		local Mul = 1.0

		if (fIronTime > CurTime() - IRONSIGHT_TIME) then
			Mul = math.Clamp((CurTime() - fIronTime) / IRONSIGHT_TIME, 0, 1)
			if not bIron then Mul = 1 - Mul end
		end

		local Offset	= self.IronSightsPos

		if (self.IronSightsAng) then
			ang = ang * 1
			ang:RotateAroundAxis(ang:Right(), self.IronSightsAng.x * Mul)
			ang:RotateAroundAxis(ang:Up(), self.IronSightsAng.y * Mul)
			ang:RotateAroundAxis(ang:Forward(), self.IronSightsAng.z * Mul)
		end

		local Right 	= ang:Right()
		local Up 		= ang:Up()
		local Forward 	= ang:Forward()

		pos = pos + Offset.x * Right * Mul
		pos = pos + Offset.y * Forward * Mul
		pos = pos + Offset.z * Up * Mul
	end

	return pos, ang
	
end


/*---------------------------------------------------------
DrawWorldModel

- Allows manipulation of the world model
- Very helpful for positioning world models via lua
---------------------------------------------------------*/
function SWEP:DrawWorldModel( )

	local hand, offset, rotate

	if not IsValid( self.Owner ) then
		self:DrawModel( )
		return
	end

	if not self.Hand then
		self.Hand = self.Owner:LookupAttachment( "anim_attachment_rh" )
	end

	hand = self.Owner:GetAttachment( self.Hand )

	if not hand then
		self:DrawModel( )
		return
	end

	offset = hand.Ang:Right( ) * self.Offset.Pos.Right + hand.Ang:Forward( ) * self.Offset.Pos.Forward + hand.Ang:Up( ) * self.Offset.Pos.Up
	hand.Ang:RotateAroundAxis( hand.Ang:Right( ), self.Offset.Ang.Right )
	hand.Ang:RotateAroundAxis( hand.Ang:Forward( ), self.Offset.Ang.Forward )
	hand.Ang:RotateAroundAxis( hand.Ang:Up( ), self.Offset.Ang.Up )
	self:SetRenderOrigin( hand.Pos + offset )
	self:SetRenderAngles( hand.Ang )
	self:DrawModel( )
	
end


/*---------------------------------------------------------
SetIronsights

- Mainly used for ironsights\sprint junk
- Kinda old and not mine. Should probably rework this.
---------------------------------------------------------*/
function SWEP:SetIronsights(b)
	self.Weapon:SetNWBool("Ironsights", b)
end

function SWEP:GetIronsights()
	return self.Weapon:GetNWBool("Ironsights")
end
