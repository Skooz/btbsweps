AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include('shared.lua')

function ENT:Initialize()

	self.Entity:SetModel("models/weapons/w_eq_fraggrenade.mdl")
	self.Entity:PhysicsInit( SOLID_VPHYSICS )
	self.Entity:SetMoveType( MOVETYPE_VPHYSICS )
	self.Entity:SetSolid( SOLID_VPHYSICS )
	self.Entity:DrawShadow( false )
	self.Entity:SetCollisionGroup( COLLISION_GROUP_WEAPON )
	self.Entity:SetNetworkedString("Owner", "World")
	
	local phys = self.Entity:GetPhysicsObject()
	if (phys:IsValid()) then
	phys:Wake()
	phys:SetMass( 5 )
	end

	self.timeleft = CurTime() + 3
	self:Think()
end

 function ENT:Think()
	
	if self.timeleft < CurTime() then
		util.BlastDamage(self.Entity, self.Entity, self.Entity:GetPos(), 525, 150)
					local effectdata = EffectData()
					effectdata:SetOrigin(self.Entity:GetPos())				// Position of Impact
					effectdata:SetNormal(Vector(0,0,1))			// Direction of Impact
					effectdata:SetStart(Vector(0,0,1))	// Direction of Round
					effectdata:SetEntity(self.Entity)			// Who done it?
					effectdata:SetScale(1.5)				// Size of explosion
					effectdata:SetRadius(1)			// Texture of Impact
					effectdata:SetMagnitude(18)				// Length of explosion trails
					util.Effect( "gdcw_staticboom", effectdata )
					util.ScreenShake(self.Entity:GetPos(), 10, 5, 1, 1500 )
					self.Entity:Remove()	
		end

	self.Entity:NextThink( CurTime() )
	return true
end

/*---------------------------------------------------------
OnTakeDamage
---------------------------------------------------------*/
function ENT:OnTakeDamage( dmginfo )
end


/*---------------------------------------------------------
Use
---------------------------------------------------------*/
function ENT:Use( activator, caller, type, value )
end


/*---------------------------------------------------------
StartTouch
---------------------------------------------------------*/
function ENT:StartTouch( entity )
end


/*---------------------------------------------------------
EndTouch
---------------------------------------------------------*/
function ENT:EndTouch( entity )
end


/*---------------------------------------------------------
Touch
---------------------------------------------------------*/
function ENT:Touch( entity )
end