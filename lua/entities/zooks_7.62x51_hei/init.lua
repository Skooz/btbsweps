AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include('shared.lua')

function ENT:Initialize()   
math.randomseed(CurTime())
self.Data 		= self.Entity:GetVar("Data")
self.Tracer		= 0					// How much the bullet will drift in flight (Inaccuracy)
self.Owner 		= self:GetOwner()			// Who dun it!
self.Penetrate 		= 0					// How deep Generic Default goes
self.Flightvector 	= self.Entity:GetUp()*((850*52.5)/66)	// Velocity in m/s, FIRST NUMMER is SPEED (FrameTime)
self.Timeleft 		= CurTime() + 5				// How long before auto-remove?
self.Impacted 		= false					// Important for flight continuation, see line 173
self.Splatter 		= false					// Carries blood and AIDS after the round passes through someone
self.EffectSize		= 1.3					// How much stuff gets kicked up on impact
self.TissueDamage	= math.Rand(40,50)			// Player damage is multiplied by 2 for some reason
self.BallisticDrag	= 60					// Fraction of velocity lost per tick, higher is less
self.Drift		= 0.2					// How much the bullet will drift in flight (Inaccuracy)

self.Entity:SetModel( "models/led.mdl" )
self.Entity:PhysicsInit( SOLID_VPHYSICS )
self.Entity:SetMoveType( MOVETYPE_NONE )
self.Entity:SetSolid( SOLID_NONE )

self:Think()
end   


function ENT:Think()
if self.Tracer==0 and self.Data.x==1 then		
self.Tracer=1
Trail = ents.Create("env_spritetrail")				// The streak of the tracer
Trail:SetKeyValue("lifetime","0.15")
Trail:SetKeyValue("startwidth","25")
Trail:SetKeyValue("endwidth","25")
Trail:SetKeyValue("spritename","trails/laser.vmt")
Trail:SetKeyValue("rendermode","5")
Trail:SetKeyValue("rendercolor","255 150 100")
Trail:SetPos(self.Entity:GetPos())
Trail:SetParent(self.Entity)
Trail:Spawn()
Trail:Activate()
Glow = ents.Create("env_sprite")				// The ball of the tracer
Glow:SetKeyValue("model","orangecore2.vmt")
Glow:SetKeyValue("rendercolor","255 150 100")
Glow:SetKeyValue("scale","0.10")
Glow:SetPos(self.Entity:GetPos())
Glow:SetParent(self.Entity)
Glow:Spawn()
Glow:Activate()
Shine = ents.Create("env_sprite")
Shine:SetPos(self.Entity:GetPos())
Shine:SetKeyValue("renderfx", "0")
Shine:SetKeyValue("rendermode", "5")
Shine:SetKeyValue("renderamt", "255")
Shine:SetKeyValue("rendercolor", "255 150 100")
Shine:SetKeyValue("framerate12", "20")
Shine:SetKeyValue("model", "light_glow03.spr")
Shine:SetKeyValue("scale", "0.25")
Shine:SetKeyValue("GlowProxySize", "1")
Shine:SetParent(self.Entity)
Shine:Spawn()
Shine:Activate()
end

		if self.Timeleft < CurTime() then
		self.Entity:Remove()		
		end

	Table	={} 			//Table name is table name
	Table[1]	=self.Owner 		//The person holding the gat
	Table[2]	=self.Entity 		//The cap

	local trace = {}
		trace.start = self.Entity:GetPos()
		trace.endpos = self.Entity:GetPos() + self.Flightvector
		trace.filter = Table
		trace.mask = MASK_SHOT + MASK_WATER			// Trace for stuff that bullets would normally hit

	local tr = util.TraceLine( trace )
	

					if tr.Hit then
						if tr.MatType==88 || tr.StartSolid then
						self.Entity:Remove()
						return true
						end

					if tr.MatType==83 then				//83 is wata
					local effectdata = EffectData()
					effectdata:SetOrigin( tr.HitPos )
					effectdata:SetNormal( tr.HitNormal )		// In case you hit sideways water?
					effectdata:SetScale( 20 )			// Big splash for big bullets
					util.Effect( "watersplash", effectdata )
					self.Entity:Remove()
					return true
					end

						if tr.Entity:IsNPC() then
							if math.Rand(1,4)>3 then tr.Entity:Ignite( 4, 10 ) end
						end

					util.BlastDamage(self.Owner, self.Owner, tr.HitPos, 30, self.TissueDamage)		//Radius, Damage
					local effectdata = EffectData()
					effectdata:SetOrigin(tr.HitPos)				// Position of Impact
					effectdata:SetNormal(tr.HitNormal)			// Direction of Impact
					effectdata:SetScale(self.EffectSize)			// Size of explosion
					effectdata:SetRadius(tr.MatType)			// Texture of Impact
					util.Effect("gdcw_hei_impact",effectdata)
					util.ScreenShake(tr.HitPos, 10, 5, 0.1, 300 )
					util.Decal("fadingScorch", tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)
					self.Entity:Remove()
					return true
					end

self.Entity:SetPos(self.Entity:GetPos() + self.Flightvector)
self.Flightvector = self.Flightvector - self.Flightvector/self.BallisticDrag + (VectorRand():GetNormalized()*self.Drift) + Vector(0,0,-0.111)
self.Entity:SetAngles(self.Flightvector:Angle() + Angle(90,0,0))
self.Entity:NextThink( CurTime() )
return true
end								// Ends the think function and loops the bullet code

 
