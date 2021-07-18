AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
--include('shared.lua')

SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false
SWEP.AdminSpawnable			= true
SWEP.AdminOnly              = true
SWEP.Author					= "Lazermaniac"
SWEP.Contact				= "lazermaniac@gmail.com"

SWEP.Instructions			= "Primary to repair.\nSecondary to damage."

SWEP.Primary.Ammo			= "none"
SWEP.Primary.Automatic		= true
SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Purpose				= "Used to clear baricades and repair vehicles."
SWEP.Secondary.Ammo			= "none"
SWEP.Secondary.Automatic	= true
SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Spawnable				= true
SWEP.ViewModelFlip			= false
SWEP.ViewModelFOV			= 55
SWEP.ViewModel				= "models/weapons/v_cuttingtorch.mdl"
SWEP.WorldModel				= "models/weapons/w_cuttingtorch.mdl"

SWEP.PrintName			= "[ADMIN] ACF Cutting torch"
SWEP.Slot				= 0
SWEP.SlotPos			= 6
SWEP.IconLetter			= "G"
SWEP.DrawAmmo			= false
SWEP.DrawCrosshair		= true


local function Dissolve( ent )

	if SERVER then
		local phys = ent:GetPhysicsObject()
		if (phys:IsValid()) then
			phys:EnableGravity(false)
			ent:SetCollisionGroup(COLLISION_GROUP_DISSOLVING)
		end
		
		local debugnumber = math.Rand(0,2147483646)
		
		ent:SetKeyValue("targetname", "disTarget"..debugnumber)
		local dis = ents.Create("env_entity_dissolver")
		dis:SetKeyValue("magnitude", "100")
		dis:SetKeyValue("dissolvetype", "0")
		dis:Spawn()
		dis:Fire("Dissolve", "disTarget"..debugnumber, 0)
		dis:Fire("kill", "", 2)
	end
	
end


function SWEP:Initialize()
	if ( SERVER ) then 
		self:SetWeaponHoldType("pistol")--"357 hold type doesnt exist, it's the generic pistol one" Kaf
	end
	util.PrecacheSound( "acf_other/penetratingshots/00000295.wav" )
	util.PrecacheSound( "acf_other/penetratingshots/00000296.wav" )
	util.PrecacheSound( "acf_other/penetratingshots/00000297.wav" )
	util.PrecacheSound( "items/medshot4.wav" )
	
	self.LastSend = 0
end

function SWEP:Think()

	if SERVER then 	
	
		local userid = self.Owner
		local trace = {}
		trace.start = userid:GetShootPos()
		trace.endpos = userid:GetShootPos() + ( userid:GetAimVector() * 128	)
		trace.filter = userid --Not hitting the owner's feet when aiming down
		local tr = util.TraceLine( trace )
		local ent = tr.Entity
		if ent:IsValid() and self.LastSend < CurTime() then
			if not ent:IsPlayer() and not ent:IsNPC() then	
				self.LastSend = CurTime() + 1
				local Valid = ACF_Check( ent )
				if Valid then
					self.Weapon:SetNWFloat( "HP", ent.ACF.Health )
					self.Weapon:SetNWFloat( "Armour", ent.ACF.Armour )
					self.Weapon:SetNWFloat( "MaxHP", ent.ACF.MaxHealth )
					self.Weapon:SetNWFloat( "MaxArmour", ent.ACF.MaxArmour )
				end
			end
		end
		
		self:NextThink(CurTime() + 0.2)
	
	end
	
end

function SWEP:PrimaryAttack()

	self.Weapon:SetNextPrimaryFire( CurTime() + 0.05 )
	local userid = self.Owner
	local userid = self.Owner
	local trace = {}
	trace.start = userid:GetShootPos()
	trace.endpos = userid:GetShootPos() + ( userid:GetAimVector() * 64	)
	trace.filter = userid --Not hitting the owner's feet when aiming down
	local tr = util.TraceLine( trace )
		if ( tr.HitWorld ) then return end	
		if CLIENT then return end
	local ent = tr.Entity
	if ent:IsValid() then
		if ent:IsPlayer() || ent:IsNPC() then
			local PlayerHealth = ent:Health() --get the health
			local PlayerMaxHealth = 200 --and max health too
			local PlayerArmour = ent:Armor()
			local PlayerMaxArmour = 200
			if ( PlayerHealth >= PlayerMaxHealth ) then return end --if the player is healthy or somehow dead, move right along.
			PlayerHealth = math.min(PlayerHealth + 5,PlayerMaxHealth) --otherwise add 1 HP
			ent:SetHealth( PlayerHealth ) --and boost the player's HP to that.
			
			self.Weapon:SetNWFloat( "HP", PlayerHealth ) --Output to the HUD bar
			self.Weapon:SetNWFloat( "Armour", PlayerArmour )
			self.Weapon:SetNWFloat( "MaxHP", PlayerMaxHealth )
			self.Weapon:SetNWFloat( "MaxArmour", PlayerMaxArmour )
			
			local effect = EffectData()--then make some pretty effects :D ("Fixed that up a bit so it looks like it's actually emanating from the healing player, well mostly" Kaf)
			local AngPos = userid:GetAttachment( 4 )
			effect:SetOrigin( AngPos.Pos + userid:GetAimVector() * 10 )
			effect:SetNormal( userid:GetAimVector() )
			effect:SetEntity( self.Weapon )
			util.Effect( "thruster_ring", effect, true, true ) --("The 2 booleans control clientside override, by default it doesn't display it since it'll lag a bit behind inputs in MP, same for sounds" Kaf)
			ent:EmitSound( "items/medshot4.wav", true, true )--and play a sound.
		else
			if CPPI and not ent:CPPICanTool( self.Owner, "torch" ) then return false end
			local Valid = ACF_Check ( ent )
			if ( Valid and ent.ACF.Health < ent.ACF.MaxHealth ) then
				ent.ACF.Health = math.min(ent.ACF.Health + (500/ent.ACF.MaxArmour),ent.ACF.MaxHealth)
				ent.ACF.Armour = ent.ACF.MaxArmour * (0.9 + 0.1*ent.ACF.Health/ent.ACF.MaxHealth)
				TeslaSpark(tr.HitPos , 1 )
			end
			self.Weapon:SetNWFloat( "HP", ent.ACF.Health )
			self.Weapon:SetNWFloat( "Armour", ent.ACF.Armour )
			self.Weapon:SetNWFloat( "MaxHP", ent.ACF.MaxHealth )
			self.Weapon:SetNWFloat( "MaxArmour", ent.ACF.MaxArmour )
		end
	else 
		self.Weapon:SetNWFloat( "HP", 0 )
		self.Weapon:SetNWFloat( "Armour", 0 )
		self.Weapon:SetNWFloat( "MaxHP", 0 )
		self.Weapon:SetNWFloat( "MaxArmour", 0 )
	end

end

function SWEP:SecondaryAttack()

self.Weapon:SetNextPrimaryFire( CurTime() + 0.05 )
	local userid = self.Owner
	local userid = self.Owner
	local trace = {}
	trace.start = userid:GetShootPos()
	trace.endpos = userid:GetShootPos() + ( userid:GetAimVector() * 64	)
	trace.filter = userid
	local tr = util.TraceLine( trace )
		if ( tr.HitWorld ) then return end	
		if CLIENT then return end
	local ent = tr.Entity
	if ent:IsValid() then
		local Valid = ACF_Check ( ent )
		if Valid then
			self.Weapon:SetNWFloat( "HP", ent.ACF.Health )
			self.Weapon:SetNWFloat( "Armour", ent.ACF.Armour )
			self.Weapon:SetNWFloat( "MaxHP", ent.ACF.MaxHealth )
			self.Weapon:SetNWFloat( "MaxArmour", ent.ACF.MaxArmour )
			local HitRes = {}
			if(ent:IsPlayer()) then
				HitRes = ACF_Damage ( ent , {Kinetic = 0.05,Momentum = 0,Penetration = 0.05} , 2 , 0 , self.Owner )--We can use the damage function instead of direct access here since no numbers are negative.
			else
				ent:Ignite(1.5)
				HitRes = ACF_Damage ( ent , {Kinetic = math.max(ent.ACF.MaxArmour,4)/128,Momentum = 200,Penetration = 128*math.max(ent.ACF.MaxArmour,4)} , 512 , 16 , self.Owner )--We can use the damage function instead of direct access here since no numbers are negative.
			end
			if HitRes.Kill then
				constraint.RemoveAll( ent )
				ent:SetParent(nil)
				ent:SetCollisionGroup( COLLISION_GROUP_NONE ) 
				local Phys = ent:GetPhysicsObject()
				Dissolve(ent)
			else
				local effectdata = EffectData()
				effectdata:SetMagnitude( 5.0 )
				effectdata:SetRadius( 2.0 )
				effectdata:SetScale( 1.0 )
				effectdata:SetStart( userid:GetShootPos() )
				effectdata:SetOrigin( tr.HitPos )
				effectdata:SetNormal( tr.HitNormal )
				util.Effect( "StunstickImpact", effectdata , true , true )
				util.Decal( "Impact.Metal",tr.HitPos+tr.HitNormal,tr.HitPos-tr.HitNormal )					
				ent:EmitSound( "acf_other/penetratingshots/0000029" ..tostring( math.random( 5, 7 ) ).. ".wav", 60, 120, 1, math.random(16,24) )--Welding noise here, gotte figure out how to do a looped sound.
			end
		else 
			self.Weapon:SetNWFloat( "HP", 0 )
			self.Weapon:SetNWFloat( "Armour", 0 )
			self.Weapon:SetNWFloat( "MaxHP", 0 )
			self.Weapon:SetNWFloat( "MaxArmour", 0 )
		end

	end
	
end
function SWEP:Reload()

end

function TeslaSpark(pos, magnitude)
	zap = ents.Create("point_tesla")
	zap:SetKeyValue("targetname", "teslab")
	zap:SetKeyValue("m_SoundName" ,"null")
	zap:SetKeyValue("texture" ,"sprites/laser.spr")
	zap:SetKeyValue("m_Color" ,"200 200 255")
	zap:SetKeyValue("m_flRadius" ,tostring(magnitude*10))
	zap:SetKeyValue("beamcount_min" ,tostring(math.ceil(magnitude)))
	zap:SetKeyValue("beamcount_max", tostring(math.ceil(magnitude)))
	zap:SetKeyValue("thick_min", tostring(magnitude))
	zap:SetKeyValue("thick_max", tostring(magnitude))
	zap:SetKeyValue("lifetime_min" ,"0.05")
	zap:SetKeyValue("lifetime_max", "0.1")
	zap:SetKeyValue("interval_min", "0.05")
	zap:SetKeyValue("interval_max" ,"0.08")
	zap:SetPos(pos)
	zap:Spawn()
	zap:Fire("DoSpark","",0)
	zap:Fire("kill","", 0.1)
end


