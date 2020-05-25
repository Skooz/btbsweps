// Variables that are used on both client and server
local UseGDCBullets = CreateClientConVar("UseGDCBullets", 1, true, false, "Use GDC bullet entities")

// This is a sub-base for weapons that should use scope overlays
SWEP.Base 						= "madfox2"

SWEP.Secondary.ScopeZoom		= 0
SWEP.Secondary.UseACOG			= false	
SWEP.Secondary.UseMilDot		= false		
SWEP.Secondary.UseSVD			= false	
SWEP.Secondary.UseParabolic		= false	
SWEP.Secondary.UseElcan			= false
SWEP.Secondary.UseGreenDuplex	= false	
SWEP.Secondary.UseRangefinder	= false	

SWEP.data 						= {}
SWEP.data.ironsights			= 1

SWEP.Single						= nil
SWEP.ScopeScale 				= 0.5
SWEP.ReticleScale 				= 0.5
SWEP.Velocity					= 850

SWEP.IronSightsPos 				= Vector (0, -110, 0)
SWEP.IronSightsAng 				= Vector (0, 0, 0)

function SWEP:Initialize()
	
	util.PrecacheSound(self.Primary.Sound)
	if CLIENT then
		-- We need to get these so we can scale everything to the player's current resolution.
		local iScreenWidth = surface.ScreenWidth()
		local iScreenHeight = surface.ScreenHeight()
	
		-- The following code is only slightly riped off from Night Eagle
		-- These tables are used to draw things like scopes and crosshairs to the HUD
		self.ScopeTable = {}
		self.ScopeTable.l = iScreenHeight*self.ScopeScale
		self.ScopeTable.x1 = 0.5*(iScreenWidth + self.ScopeTable.l)
		self.ScopeTable.y1 = 0.5*(iScreenHeight - self.ScopeTable.l)
		self.ScopeTable.x2 = self.ScopeTable.x1
		self.ScopeTable.y2 = 0.5*(iScreenHeight + self.ScopeTable.l)
		self.ScopeTable.x3 = 0.5*(iScreenWidth - self.ScopeTable.l)
		self.ScopeTable.y3 = self.ScopeTable.y2
		self.ScopeTable.x4 = self.ScopeTable.x3
		self.ScopeTable.y4 = self.ScopeTable.y1
		self.ScopeTable.l = (iScreenHeight + 1)*self.ScopeScale -- I don't know why this works, but it does.

		self.QuadTable = {}
		self.QuadTable.x1 = 0
		self.QuadTable.y1 = 0
		self.QuadTable.w1 = iScreenWidth
		self.QuadTable.h1 = 0.5*iScreenHeight - self.ScopeTable.l
		self.QuadTable.x2 = 0
		self.QuadTable.y2 = 0.5*iScreenHeight + self.ScopeTable.l
		self.QuadTable.w2 = self.QuadTable.w1
		self.QuadTable.h2 = self.QuadTable.h1
		self.QuadTable.x3 = 0
		self.QuadTable.y3 = 0
		self.QuadTable.w3 = 0.5*iScreenWidth - self.ScopeTable.l
		self.QuadTable.h3 = iScreenHeight
		self.QuadTable.x4 = 0.5*iScreenWidth + self.ScopeTable.l
		self.QuadTable.y4 = 0
		self.QuadTable.w4 = self.QuadTable.w3
		self.QuadTable.h4 = self.QuadTable.h3

		self.LensTable = {}
		self.LensTable.x = self.QuadTable.w3
		self.LensTable.y = self.QuadTable.h1
		self.LensTable.w = 2*self.ScopeTable.l
		self.LensTable.h = 2*self.ScopeTable.l

		self.ReticleTable = {}
		self.ReticleTable.wdivider = 3.125
		self.ReticleTable.hdivider = 1.7579/self.ReticleScale		// Draws the texture at 512 when the resolution is 1600x900
		self.ReticleTable.x = (iScreenWidth/2)-((iScreenHeight/self.ReticleTable.hdivider)/2)
		self.ReticleTable.y = (iScreenHeight/2)-((iScreenHeight/self.ReticleTable.hdivider)/2)
		self.ReticleTable.w = iScreenHeight/self.ReticleTable.hdivider
		self.ReticleTable.h = iScreenHeight/self.ReticleTable.hdivider

		self.FilterTable = {}
		self.FilterTable.wdivider = 3.125
		self.FilterTable.hdivider = 1.7579/1.35	
		self.FilterTable.x = (iScreenWidth/2)-((iScreenHeight/self.FilterTable.hdivider)/2)
		self.FilterTable.y = (iScreenHeight/2)-((iScreenHeight/self.FilterTable.hdivider)/2)
		self.FilterTable.w = iScreenHeight/self.FilterTable.hdivider
		self.FilterTable.h = iScreenHeight/self.FilterTable.hdivider
	end
	
end

function SWEP:SecondaryAttack()

	if not IsFirstTimePredicted() or self:GetNWBool("Holster") == true or self.Owner:KeyDown(IN_SPEED) then return end
	
	if self:GetNWBool("InIron") == false then
		self:SetNWBool("InIron" , true)
		self:SetIronsights(true, self.Owner)
		self.Weapon:SendWeaponAnim( self.IronInAnim	)
		self.Owner:SetFOV( self.Secondary.ScopeZoom, 0.3 )
	elseif self:GetNWBool("InIron") == true then
		self:SetNWBool("InIron" , false)
		self:SetIronsights(false, self.Owner)
		self.Weapon:SendWeaponAnim( self.IronOutAnim )
		self.Owner:SetFOV( 0, 0.3 )
	end
	
	self:SetNWFloat("InAnim", CurTime() + self.Owner:GetViewModel():SequenceDuration())
	//self.Weapon:SetNextPrimaryFire(CurTime() + self.Owner:GetViewModel():SequenceDuration())
	
end


function SWEP:Reload()

	if self:GetNWBool("InIron") == true and self.Weapon:Clip1() < self.Primary.ClipSize then
		self:SetNWBool("InIron" , false)
		self:SetIronsights(false, self.Owner)
		self.Weapon:SendWeaponAnim( self.IronOutAnim )
		self.Owner:SetFOV( 0, 0.3 )
	elseif self:GetNWBool("Holster") == true or CurTime() < self:GetNWFloat("InAnim") or self.Weapon:GetNWBool("Reloading") or self.Weapon:GetNWFloat("ReloadTime") > CurTime() or not IsValid(self.Weapon)  then 
		return 
	end
	
	if self.BoltAction and !self.Hybrid and (self.Weapon:Clip1() < self.Primary.ClipSize and self.Owner:GetAmmoCount(self.Primary.Ammo) > 0) then
		self.ShotgunReloading = true
		self.Weapon:SendWeaponAnim( self.ReloadStartAnim )
		self.Weapon:SetClip1(self.Weapon:Clip1() + 1)
		self.Owner:RemoveAmmo(1, self.Primary.Ammo)
		self.Weapon:SetNWFloat("InAnim",CurTime() + self.Owner:GetViewModel():SequenceDuration())
		self.Weapon:SetNWFloat("ReloadTime",CurTime() + self.Owner:GetViewModel():SequenceDuration())
		self.Weapon:SetNextPrimaryFire(CurTime() + self.Owner:GetViewModel():SequenceDuration())
		self.Weapon:SetNextSecondaryFire(CurTime() + self.Owner:GetViewModel():SequenceDuration())
		timer.Simple(self.Owner:GetViewModel():SequenceDuration(), function()
			if not IsValid(self.Weapon) then return end
			self.ShotgunReloading = false
			self.Weapon:SetNWBool("Reloading", true)
		end)
	else
		if (self.Weapon:Clip1() < self.Primary.ClipSize) and (self.Owner:GetAmmoCount(self.Primary.Ammo) > 0) then
			self.IronSightsMode = false
			if self.Weapon:Clip1() == 0 then
				self.Weapon:DefaultReload(self.EmptyReloadAnim)
			else
				self.Weapon:DefaultReload(self.ReloadAnim)
				timer.Simple(self.Owner:GetViewModel():SequenceDuration() + 0.01, 
				function()
					if (not IsValid(self.Owner) or not IsValid(self.Weapon) or not self.Owner:Alive())then return end
					self:SetClip1( self.Primary.ClipSize + 1 )
					self.Owner:RemoveAmmo( 1, self:GetPrimaryAmmoType() )
				end)
			end
		end
	end

end

function SWEP:ReloadThink()
	// We need to think in order to continue loading bullets
	if self:GetNWBool("Reloading") == true and self:GetNWFloat("ReloadTime") < CurTime() then
		if (self.Weapon:Clip1() >= self.Primary.ClipSize or self.Owner:GetAmmoCount(self.Primary.Ammo) <= 0) then
			self.Weapon:SendWeaponAnim(self.ReloadEndAnim)
			self:SetNWFloat("InAnim", CurTime() + self.Owner:GetViewModel():SequenceDuration())
			self.Weapon:SetNextPrimaryFire(CurTime() + self.Owner:GetViewModel():SequenceDuration())
			self.Weapon:SetNextSecondaryFire(CurTime() + self.Owner:GetViewModel():SequenceDuration())
			self:SetNWBool("Reloading", false)
		else
			self.Weapon:SetClip1(self.Weapon:Clip1() + 1)
			self.Owner:RemoveAmmo(1, self.Primary.Ammo, false)
			--	self.Owner:DoReloadEvent()
			self.Weapon:SendWeaponAnim(self.InsertAnim)
			self:SetNWFloat("InAnim", CurTime() + self.Owner:GetViewModel():SequenceDuration())
			self:SetNWFloat("ReloadTime", CurTime() + self.Owner:GetViewModel():SequenceDuration() + 0.02)
			self.Weapon:SetNextPrimaryFire(CurTime() + self.Owner:GetViewModel():SequenceDuration())
			self.Weapon:SetNextSecondaryFire(CurTime() + self.Owner:GetViewModel():SequenceDuration())
		end
	end
	
	// Interrupt reload to shoot
	if (self.Owner:KeyDown(IN_ATTACK)) and self.Weapon:Clip1() < 10 and (self.Weapon:GetNWBool("Reloading", false) == true) then
		self.Weapon:SetNextPrimaryFire(CurTime() + self.Owner:GetViewModel():SequenceDuration())
		self.Weapon:SetNextPrimaryFire(CurTime() + self.Owner:GetViewModel():SequenceDuration())
		self:SetNWFloat("InAnim", CurTime() + self.Owner:GetViewModel():SequenceDuration())
		self.Weapon:SetNWFloat("ReloadTime", CurTime() + self.Owner:GetViewModel():SequenceDuration())
		self.Weapon:SetNWBool("Reloading", false)
		self.Weapon:SendWeaponAnim(self.ReloadEndAnim)
		timer.Simple(self.Owner:GetViewModel():SequenceDuration(), function()
			if not IsValid(self.Owner) then return end
		end)
	end
	
end

/*---------------------------------------------------------
Think
---------------------------------------------------------*/
function SWEP:Think()

	self:IronSights()
	self:ReloadThink()
	self:SelectFire()
	self:HolsterWep()
	self:Sprint()
	self:Sway()

end

/*---------------------------------------------------------
IronSight
---------------------------------------------------------*/
function SWEP:IronSight()
end

function SWEP:DrawHUD()

	if  self:GetNWBool("InIron") == true then
	
		if self.Secondary.UseACOG then
			-- Draw the FAKE SCOPE THANG
			surface.SetDrawColor(0, 0, 0, 255)
			surface.SetTexture(surface.GetTextureID("scope/gdcw_closedsight"))
			surface.DrawTexturedRect(self.LensTable.x, self.LensTable.y, self.LensTable.w, self.LensTable.h)

			-- Draw the CHEVRON
			surface.SetDrawColor(0, 0, 0, 255)
			surface.SetTexture(surface.GetTextureID("scope/gdcw_acogchevron"))
			surface.DrawTexturedRect(self.ReticleTable.x, self.ReticleTable.y, self.ReticleTable.w, self.ReticleTable.h)

			-- Draw the ACOG REFERENCE LINES
			surface.SetDrawColor(0, 0, 0, 255)
			surface.SetTexture(surface.GetTextureID("scope/gdcw_acogcross"))
			surface.DrawTexturedRect(self.ReticleTable.x, self.ReticleTable.y, self.ReticleTable.w, self.ReticleTable.h)
		end

		if self.Secondary.UseMilDot then
			-- Draw the MIL DOT SCOPE
			surface.SetDrawColor(0, 0, 0, 255)
			surface.SetTexture(surface.GetTextureID("scope/gdcw_scopesight"))
			surface.DrawTexturedRect(self.LensTable.x, self.LensTable.y, self.LensTable.w, self.LensTable.h)
		end

		if self.Secondary.UseSVD then
			-- Draw the SVD SCOPE
			surface.SetDrawColor(0, 0, 0, 255)
			surface.SetTexture(surface.GetTextureID("scope/gdcw_svdsight"))
			surface.DrawTexturedRect(self.LensTable.x, self.LensTable.y, self.LensTable.w, self.LensTable.h)
		end

		if self.Secondary.UseParabolic then
			-- Draw the PARABOLIC SCOPE
			surface.SetDrawColor(0, 0, 0, 255)
			surface.SetTexture(surface.GetTextureID("scope/gdcw_parabolicsight"))
			surface.DrawTexturedRect(self.LensTable.x, self.LensTable.y, self.LensTable.w, self.LensTable.h)
		end

		if self.Secondary.UseElcan then
			-- Draw the RETICLE
			surface.SetDrawColor(0, 0, 0, 255)
			surface.SetTexture(surface.GetTextureID("scope/gdcw_elcanreticle"))
			surface.DrawTexturedRect(self.ReticleTable.x, self.ReticleTable.y, self.ReticleTable.w, self.ReticleTable.h)
			
			-- Draw the ELCAN SCOPE
			surface.SetDrawColor(0, 0, 0, 255)
			surface.SetTexture(surface.GetTextureID("scope/gdcw_elcansight"))
			surface.DrawTexturedRect(self.LensTable.x, self.LensTable.y, self.LensTable.w, self.LensTable.h)
		end

		if self.Secondary.UseGreenDuplex then
			-- Draw the RETICLE
			surface.SetDrawColor(0, 0, 0, 255)
			surface.SetTexture(surface.GetTextureID("scope/gdcw_nvgilluminatedduplex"))
			surface.DrawTexturedRect(self.ReticleTable.x, self.ReticleTable.y, self.ReticleTable.w, self.ReticleTable.h)

			-- Draw the SCOPE
			surface.SetDrawColor(0, 0, 0, 255)
			surface.SetTexture(surface.GetTextureID("scope/gdcw_closedsight"))
			surface.DrawTexturedRect(self.LensTable.x, self.LensTable.y, self.LensTable.w, self.LensTable.h)
		end

		if self.Secondary.UseRangefinder then
			local trace = {}
			trace.start = self.Owner:GetShootPos()
			trace.endpos = self.Owner:GetShootPos() + self.Owner:GetAimVector()*60000		// Laser Rangefinder
			trace.filter = self.Owner
			local tr = util.TraceLine( trace )

			self.Range = self.Owner:GetShootPos():Distance(tr.HitPos)/52.5
			self.Time = math.Round(((self.Range)/self.Velocity)*100)/100
			self.Drop = math.Round((4.9*(self.Time^2))*100)/100

			draw.SimpleText( "RANGE " ..tostring(math.Round(self.Range)) .. "m","Default",ScrW() / 3, ScrH() * (44/60),Color(130,170,70,255))			//Range in meters
			draw.SimpleText( "TIME " ..tostring(self.Time) .. "s","Default",ScrW() / 3, ScrH() * (45/60),Color(170,130,70,255))					//Flight time in seconds
			draw.SimpleText( "DROP " ..tostring(self.Drop) .. "m","Default",ScrW() / 3, ScrH() * (46/60),Color(230,70,70,255))					//Drop in meters
		end
		
	end
end

function SWEP:AdjustMouseSensitivity()
	if self:GetNWBool("InIron") then
		return (1/(self.Secondary.ScopeZoom/2))
	else 
		return 1
	end
end