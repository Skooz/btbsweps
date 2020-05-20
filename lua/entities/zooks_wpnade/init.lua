AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include('shared.lua')

function ENT:Initialize()

	self.Entity:SetModel("models/weapons/w_eq_smokegrenade.mdl")
	self.Entity:PhysicsInit( SOLID_VPHYSICS )
	self.Entity:SetMoveType( MOVETYPE_VPHYSICS )
	self.Entity:SetSolid( SOLID_VPHYSICS )
	self.Entity:DrawShadow( false )
	self.Entity:SetCollisionGroup( COLLISION_GROUP_WEAPON )
	self.Entity:SetNetworkedString("Owner", "World")
	
	local phys = self.Entity:GetPhysicsObject()
	if (phys:IsValid()) then
	phys:Wake()
	end

	self.timeleft = CurTime() + 3
	self:Think()
end

 function ENT:Think()
	
		if self.timeleft < CurTime() then
		util.BlastDamage(self.Entity, self.Entity, self.Entity:GetPos(), 525, 50)
		util.ScreenShake(self.Entity:GetPos(), 10, 5, 1, 1500 )

			for k, v in pairs ( ents.FindInSphere( self.Entity:GetPos(), 525 ) ) do		// Find anything within 10 meters
				if v:IsPlayer() || v:IsNPC() then					// If its alive then
				local trace = {}						// Make sure there's not a wall in between
				trace.start = self.Entity:GetPos()
				trace.endpos = v:GetPos() + Vector(0,0,30)			// Trace to the torso
				trace.filter = self.Entity
				local tr = util.TraceLine( trace )				// If the trace hits a living thing then
				if tr.Entity:IsPlayer() || tr.Entity:IsNPC() then v:Ignite( 5, 0 ) end end	// Fry it for 5 seconds
				end	
		

	local trace 	= {}
	trace.start 	= self.Entity:GetPos()
	trace.endpos 	= self.Entity:GetPos()+Vector(0,0,-30)
	trace.filter 	= self.Entity
	//trace.mask 	= MASK_SHOT + MASK_WATER
	local tr 	= util.TraceLine( trace )
	

					if tr.Hit then
					local effectdata = EffectData()
					effectdata:SetOrigin(self.Entity:GetPos())
					effectdata:SetNormal(tr.HitNormal)
					effectdata:SetScale(2.0)
					effectdata:SetRadius(2.0)
					effectdata:SetMagnitude(20)
					util.Effect( "gdcw_whitephosphorus", effectdata )
				else

					local effectdata = EffectData()
					effectdata:SetOrigin(self.Entity:GetPos())				// Position of Impact
					effectdata:SetNormal(Vector(0,0,1))			// Direction of Impact
					effectdata:SetStart(Vector(0,0,1))	// Direction of Round
					effectdata:SetScale(1.5)				// Size of explosion
					effectdata:SetRadius(1)			// Texture of Impact
					effectdata:SetMagnitude(20)				// Length of explosion trails
					util.Effect( "gdcw_whitephosphorusairburst", effectdata )
				end
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