ENT.Type = "anim"
ENT.PrintName			= "USed Matador"
ENT.Author			= "Generic Default"
ENT.Contact			= "AIDS"
ENT.Purpose			= "Nothing"
ENT.Instructions		= "2000$ Waste"

/*---------------------------------------------------------
OnRemove
---------------------------------------------------------*/
function ENT:OnRemove()
end

/*---------------------------------------------------------
PhysicsUpdate
---------------------------------------------------------*/
function ENT:PhysicsUpdate()
end

/*---------------------------------------------------------
PhysicsCollide
---------------------------------------------------------*/
function ENT:PhysicsCollide(data,phys)
	if data.Speed > 150 then
	self.Entity:EmitSound("physics/metal/weapon_impact_hard2.wav")
	end
	
	local impulse = -data.Speed * data.HitNormal * .4 + (data.OurOldVelocity * -.6)
	phys:ApplyForceCenter(impulse)
end
