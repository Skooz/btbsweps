// BTB Sounds
// Adds and precaches all sounds in this pack

sound.Add({
	name 	= "Jam1.Pistol",
	channel = CHAN_STATIC,
	volume 	= 1.0,
	soundlevel = 100,
	sound 	=  "jamming/jam3.wav" 
})
util.PrecacheSound("Jam1.Pistol")

sound.Add({
	name 	= "Jam2.Pistol",
	channel = CHAN_STATIC,
	volume 	= 1.0,
	soundlevel = 100,
	sound 	=  "jamming/jam4.wav" 
})
util.PrecacheSound("Jam2.Pistol")

sound.Add({
	name 	= "Jam1.Rifle",
	channel = CHAN_STATIC,
	volume 	= 1.0,
	soundlevel = 100,
	sound 	=  "jamming/jam1.wav" 
})
util.PrecacheSound("Jam1.Rifle")

sound.Add({
	name 	= "Jam2.Rifle",
	channel = CHAN_STATIC,
	volume 	= 1.0,
	soundlevel = 100,
	sound 	=  "jamming/jam2.wav" 
})
util.PrecacheSound("Jam2.Rifle")

sound.Add({
	name 	= "Dry.Rifle",
	channel = CHAN_STATIC,
	volume 	= 1.0,
	soundlevel = 100,
	sound 	=  "folley/empty_assaultrifles.wav" 
})
util.PrecacheSound("Dry.Rifle")

sound.Add({
	name 	= "Dry.Pistol",
	channel = CHAN_STATIC,
	volume 	= 1.0,
	soundlevel = 100,
	sound 	=  "folley/empty_pistols.wav" 
})
util.PrecacheSound("Dry.Pistol")

sound.Add({
	name 	= "Holster.Wep",
	channel = CHAN_STATIC,
	volume 	= 1.0,
	soundlevel = 100,
	sound 	=  {
				"folley/weapon_holster1.wav",
				"folley/weapon_holster2.wav",
				"folley/weapon_holster3.wav",
			    }
})
util.PrecacheSound("Holster.Wep")

sound.Add({
	name 	= "Fireselect.Switch",
	channel = CHAN_STATIC,
	volume 	= 1.0,
	soundlevel = 100,
	sound 	=  {
				"folley/switch1.wav",
				"folley/switch2.wav",
				"folley/switch3.wav",
				"folley/switch4.wav",
				"folley/switch5.wav",
				"folley/switch6.wav",
			    }
})
util.PrecacheSound("Fireselect.Switch")

sound.Add({
	name 	= "BTB_RagingBull.Deploy",
	channel = CHAN_STATIC,
	volume 	= 1.0,
	soundlevel = 100,
	sound 	=  "weapons/btb/ragingbull/ragingbull_deploy.wav" 
})
util.PrecacheSound("BTB_RagingBull.Deploy")

sound.Add({
	name = "BTB_RagingBull.Chamber_Out",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/ragingbull/ragingbull_chamber_out.wav" 
})
util.PrecacheSound("BTB_RagingBull.Chamber_Out")


sound.Add({
	name = "BTB_RagingBull.Chamber_In",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/ragingbull/ragingbull_chamber_in.wav" 
})
util.PrecacheSound("BTB_RagingBull.Chamber_In")


sound.Add({
	name = "BTB_RagingBull.Chamber_Bullets_Out",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/ragingbull/ragingbull_chamber_bulletsout.wav" 
})
util.PrecacheSound("BTB_RagingBull.Chamber_Bullets_Out")

sound.Add({
	name = "BTB_RagingBull.Chamber_Bullets_In",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/ragingbull/ragingbull_chamber_bulletsin.wav" 
})
util.PrecacheSound("BTB_RagingBull.Chamber_Bullets_In")

sound.Add({
	name = "BTB_RagingBull.Fire",
	channel	=	CHAN_WEAPON,
	volume = 1.0,
	soundlevel = 100,
	pitch = { 95, 110 },
	sound = 	"weapons/btb/ragingbull/ragingbull_fire.wav"
})
util.PrecacheSound("BTB_RagingBull.Fire")

//
//G3A4
//


sound.Add({
	name = "BTB_G3A4.Deploy",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 	"weapons/btb/g3a4/g3a4_deploy.wav" 
})
util.PrecacheSound("BTB_G3A4.Deploy")

sound.Add({
	name = "BTB_G3A4.Clip_Out",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/g3a4/g3a4_mag_out.wav" 
})
util.PrecacheSound("BTB_G3A4.Clip_Out")

sound.Add({
	name = "BTB_G3A4.Clip_In",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/g3a4/g3a4_mag_in.wav" 
})
util.PrecacheSound("BTB_G3A4.Clip_In")

sound.Add({
	name = "BTB_G3A4.Clip_Tap",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/g3a4/g3a4_mag_tap.wav" 
})
util.PrecacheSound("BTB_G3A4.Clip_Tap")

sound.Add({
	name = "BTB_G3A4.Bolt_Back",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/g3a4/g3a4_bolt_back.wav" 
})
util.PrecacheSound("BTB_G3A4.Bolt_Back")

sound.Add({
	name = "BTB_G3A4.Bolt_Forward",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/g3a4/g3a4_bolt_forward.wav" 
})
util.PrecacheSound("BTB_G3A4.Bolt_Forward")

sound.Add({
	name = "BTB_G3A4.Fire",
	channel	= CHAN_WEAPON,
	volume = 1.0,
	soundlevel = 100,
	pitch = { 95, 105 },
	sound = 	"weapons/btb/g3a4/g3a4_fire.wav"
})
util.PrecacheSound("BTB_G3A4.Fire")

sound.Add({
	name = "BTB_G3A4.FireSilenced",
	channel	= CHAN_WEAPON,
	volume = 1.0,
	volume = 1.0,
	soundlevel = 100,
	pitch = { 95, 105 },
	sound = 	"weapons/btb/g3a4/g3a4_fire_silenced.wav"
})
util.PrecacheSound("BTB_G3A4.FireSilenced")

//
// AK-74M
//

sound.Add({
	name = "BTB_AK74M.Deploy",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/ak74m/ak74m_deploy.wav" 
})
util.PrecacheSound("BTB_AK74M.Deploy")

sound.Add({
	name = "BTB_AK74M.Clip_Out",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/ak74m/ak74m_mag_out.wav" 
})
util.PrecacheSound("BTB_AK74M.Clip_Out")

sound.Add({
	name = "BTB_AK74M.Clip_In",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/ak74m/ak74m_mag_in.wav" 
})
util.PrecacheSound("BTB_AK74M.Clip_In")


sound.Add({
	name = "BTB_AK74M.Bolt_Back",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/ak74m/ak74m_bolt_back.wav" 
})
util.PrecacheSound("BTB_AK74M.Bolt_Back")


sound.Add({
	name = "BTB_AK74M.Bolt_Forward",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/ak74m/ak74m_bolt_forward.wav" 
})
util.PrecacheSound("BTB_AK74M.Bolt_Forward")


sound.Add({
	name = "BTB_AK74M.Fire",
	channel	=	CHAN_WEAPON,
	volume = 1.0,
	soundlevel = 100,
	pitch = { 95, 105 },
	sound = 	"weapons/btb/ak74m/ak74m_fire.wav"
})
util.PrecacheSound("BTB_AK74M.Fire")


sound.Add({
	name = "BTB_AK74M.FireSilenced",
	channel	=	CHAN_WEAPON,
	volume = 1.0,
	soundlevel = 100,
	pitch = { 95, 105 },
	sound = 	"weapons/btb/ak74m/ak74m_fire_silenced.wav"
})
util.PrecacheSound("BTB_AK74M.FireSilenced")

//
// AK47
//


sound.Add({
	name = "BTB_AK47.Deploy",
	channel = CHAN_STATIC,
	volume = 1.0,
	
	soundlevel = 100,

	sound = 			"weapons/btb/ak47/ak47_deploy.wav" 
})
util.PrecacheSound("BTB_AK47.Deploy")

sound.Add({
	name = "BTB_AK47.Clip_Out",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/ak74m/ak74m_mag_out.wav" 
})
util.PrecacheSound("BTB_AK47.Clip_Out")


sound.Add({
	name = "BTB_AK47.Clip_In",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/ak74m/ak74m_mag_in.wav" 
})
util.PrecacheSound("BTB_AK47.Clip_In")


sound.Add({
	name = "BTB_AK47.Bolt_Back",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/ak74m/ak74m_bolt_back.wav" 
})
util.PrecacheSound("BTB_AK47.Bolt_Back")


sound.Add({
	name = "BTB_AK47.Bolt_Forward",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/ak74m/ak74m_bolt_forward.wav" 
})
util.PrecacheSound("BTB_AK47.Bolt_Forward")


sound.Add({
	name = "BTB_AK47.Fire",
	channel = CHAN_WEAPON,
	volume = 1.0,
	soundlevel = 100,
	pitch = { 95, 105 },
	sound = 	"weapons/btb/ak47/ak47_fire.wav"
})
util.PrecacheSound("BTB_AK47.Fire")


sound.Add({
	name = "BTB_AK47.FireSilenced",
	channel = CHAN_WEAPON,
	volume = 1.0,
	soundlevel = 100,
	pitch = { 95, 105 },
	sound = 	"weapons/btb/ak47/ak47_fire_silenced.wav"
})
util.PrecacheSound("BTB_AK47.FireSilenced")

//
// AKS-74U
//

sound.Add({
	name = "BTB_AKS74U.Deploy",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/aks74u/aks74u_deploy.wav" 
})
util.PrecacheSound("BTB_AKS74U.Deploy")

sound.Add({
	name = "BTB_AKS74U.Clip_Out",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/aks74u/aks74u_mag_out.wav" 
})
util.PrecacheSound("BTB_AKS74U.Clip_Out")

sound.Add({
	name = "BTB_AKS74U.Clip_In",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/aks74u/aks74u_mag_in.wav" 
})
util.PrecacheSound("BTB_AKS74U.Clip_In")

sound.Add({
	name = "BTB_AKS74U.Bolt_Back",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/aks74u/aks74u_bolt_back.wav" 
})
util.PrecacheSound("BTB_AKS74U.Bolt_Back")

sound.Add({
	name = "BTB_AKS74U.Bolt_Forward",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/aks74u/aks74u_bolt_forward.wav" 
})
util.PrecacheSound("BTB_AKS74U.Bolt_Forward")

sound.Add({
	name = "BTB_AKS74U.Fire",
	channel = CHAN_WEAPON,
	volume = 1.0,
	soundlevel = 100,
	pitch = { 95, 105 },
	sound = 	"weapons/btb/aks74u/aks74u_fire.wav"
})
util.PrecacheSound("BTB_AKS74U.Fire")

sound.Add({
	name = "BTB_AKS74U.FireSilenced",
	channel = CHAN_WEAPON,
	volume = 1.0,
	soundlevel = 100,
	pitch = { 95, 105 },
	sound = 	"weapons/btb/aks74u/aks74u_fire_silenced.wav"
})
util.PrecacheSound("BTB_AKS74U.FireSilenced")

//
// Glock 17
//


sound.Add({
	name = "BTB_Glock17.Deploy",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/glock17/glock17_deploy.wav" 
})
util.PrecacheSound("BTB_Glock17.Deploy")

sound.Add({
	name = "BTB_Glock17.Clip_Out",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/glock17/glock17_mag_out.wav" 
})
util.PrecacheSound("BTB_Glock17.Clip_Out")

sound.Add({
	name = "BTB_Glock17.Clip_In",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/glock17/glock17_mag_in.wav" 
}) 
util.PrecacheSound("BTB_Glock17.Clip_In")


sound.Add({
	name = "BTB_Glock17.Slide_Release",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/glock17/glock17_slide_forward.wav" 
}) 
util.PrecacheSound("BTB_Glock17.Slide_Release")


sound.Add({
	name = "BTB_Glock17.Fire",
	channel = CHAN_WEAPON,
	volume = 1.0,
	soundlevel = 100,
	pitch = { 95, 105 },
	sound = 	"weapons/btb/glock17/glock17_fire.wav"
}) 
util.PrecacheSound("BTB_Glock17.Fire")


sound.Add({
	name = "BTB_Glock17.FireSilenced",
	channel = CHAN_WEAPON,
	volume = 1.0,
	soundlevel = 100,
	pitch = { 95, 105 },
	sound = 	"weapons/btb/glock17/glock17_fire_silenced.wav"
}) 
util.PrecacheSound("BTB_Glock17.FireSilenced")

//
// P229
//

sound.Add({
	name = "BTB_P229.Deploy",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/p229/p229_deploy.wav" 
}) 
util.PrecacheSound("BTB_P229.Deploy")


sound.Add({
	name = "BTB_P229.Clip_Out",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/p229/p229_mag_out.wav" 
}) 
util.PrecacheSound("BTB_P229.Clip_Out")


sound.Add({
	name = "BTB_P229.Clip_In",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/p229/p229_mag_in.wav" 
}) 
util.PrecacheSound("BTB_P229.Clip_In")

sound.Add({
	name = "BTB_P229.Slide_Release",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/p229/p229_slide_release.wav" 
}) 
util.PrecacheSound("BTB_P229.Slide_Release")


sound.Add({
	name = "BTB_P229.Fire",
	channel = CHAN_WEAPON,
	volume = 1.0,
	soundlevel = 100,
	pitch = { 95, 105 },
	sound = 	"weapons/btb/p229/p229_fire.wav"
}) 
util.PrecacheSound("BTB_P229.Fire")

//
// Desert Eagle
//

sound.Add({
	name = "BTB_DesertEagle.Deploy",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/deserteagle/deserteagle_deploy.wav" 
}) 
util.PrecacheSound("BTB_DesertEagle.Deploy")


sound.Add({
	name = "BTB_DesertEagle.Clip_Out",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/deserteagle/deserteagle_mag_out.wav" 
}) 
util.PrecacheSound("BTB_DesertEagle.Clip_Out")


sound.Add({
	name = "BTB_DesertEagle.Clip_In",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/deserteagle/deserteagle_mag_in.wav" 
}) 
util.PrecacheSound("BTB_DesertEagle.Clip_In")


sound.Add({
	name = "BTB_DesertEagle.Slide_Release",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/deserteagle/deserteagle_slide_release.wav" 
}) 
util.PrecacheSound("BTB_DesertEagle.Slide_Release")


sound.Add({
	name = "BTB_DesertEagle.Fire",
	channel = CHAN_WEAPON,
	volume = 1.0,
	soundlevel = 100,
	pitch = { 95, 105 },
	sound = 	"weapons/btb/deserteagle/deserteagle_fire.wav"
}) 
util.PrecacheSound("BTB_DesertEagle.Fire")

//
// TAR-21
//

sound.Add({
	name = "BTB_TAR21.Deploy",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/tar21/tar21_deploy.wav" 
}) 
util.PrecacheSound("BTB_TAR21.Deploy")

sound.Add({
	name = "BTB_TAR21.Clip_Out",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/tar21/tar21_mag_out.wav" 
}) 
util.PrecacheSound("BTB_TAR21.Clip_Out")

sound.Add({
	name = "BTB_TAR21.Clip_In",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/tar21/tar21_mag_in.wav" 
}) 
util.PrecacheSound("BTB_TAR21.Clip_In")

sound.Add({
	name = "BTB_TAR21.Bolt",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/tar21/tar21_bolt.wav" 
}) 
util.PrecacheSound("BTB_TAR21.Bolt")

sound.Add({
	name = "BTB_TAR21.Fire",
	channel = CHAN_WEAPON,
	volume = 1.0,
	soundlevel = 100,
	pitch = { 95, 105 },
	sound = 	"weapons/btb/tar21/tar21_fire.wav"
}) 
util.PrecacheSound("BTB_TAR21.Fire")

sound.Add({
	name = "BTB_TAR21.FireSilenced",
	channel = CHAN_WEAPON,
	volume = 1.0,
	soundlevel = 100,
	pitch = { 95, 105 },
	sound = 	"weapons/btb/tar21/tar21_fire_silenced.wav"
}) 
util.PrecacheSound("BTB_TAR21.FireSilenced")

//
// UZI
//


sound.Add({
	name = "BTB_UZI.Deploy",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/uzi/uzi_deploy.wav" 
}) 
util.PrecacheSound("BTB_UZI.Deploy")


sound.Add({
	name = "BTB_UZI.Clip_Out",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/uzi/uzi_mag_out.wav" 
}) 
util.PrecacheSound("BTB_UZI.Clip_Out")

sound.Add({	
	name = "BTB_UZI.Clip_In",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/uzi/uzi_mag_in.wav" 
}) 
util.PrecacheSound("BTB_UZI.Clip_In")

sound.Add({
	name = "BTB_UZI.Bolt",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/uzi/uzi_bolt.wav" 
}) 
util.PrecacheSound("BTB_UZI.Bolt")

sound.Add({
	name = "BTB_UZI.Fire",
	channel = CHAN_WEAPON,
	volume = 1.0,
	soundlevel = 100,
	pitch = { 95, 105 },
	sound = 	"weapons/btb/uzi/uzi_fire.wav"
}) 
util.PrecacheSound("BTB_UZI.Fire")

sound.Add({
	name = "BTB_UZI.FireSilenced",
	channel = CHAN_WEAPON,
	volume = 1.0,
	soundlevel = 100,
	pitch = { 95, 105 },
	sound = 	"weapons/btb/uzi/uzi_fire_silenced.wav"
}) 
util.PrecacheSound("BTB_UZI.FireSilenced")

//
// K2-A1
//


sound.Add({	
	name = "BTB_K2.Deploy",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/k2/k2_deploy.wav" 
}) 
util.PrecacheSound("BTB_K2.Deploy")

sound.Add({
	name = "BTB_K2.Clip_Out",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/k2/k2_mag_out.wav" 
}) 
util.PrecacheSound("BTB_K2.Clip_Out")

sound.Add({
	name = "BTB_K2.Clip_In",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/k2/k2_mag_in.wav" 
}) 
util.PrecacheSound("BTB_K2.Clip_In")

sound.Add({
	name = "BTB_K2.Clip_Lock",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/k2/k2_mag_lock.wav" 
}) 
util.PrecacheSound("BTB_K2.Clip_Lock")


sound.Add({
	name = "BTB_K2.Fire",
	channel = CHAN_WEAPON,
	volume = 1.0,
	soundlevel = 100,
	pitch = { 95, 105 },
	sound = 	"weapons/btb/k2/k2_fire.wav"
}) 
util.PrecacheSound("BTB_K2.Fire")


//
// MP7
//


sound.Add({
	name = "BTB_MP7.Deploy",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/mp7/mp7_deploy.wav" 
}) 
util.PrecacheSound("BTB_MP7.Deploy")


sound.Add({
	name = "BTB_MP7.Clip_Out",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/mp7/mp7_mag_out.wav" 
}) 
util.PrecacheSound("BTB_MP7.Clip_Out")


sound.Add({
	name = "BTB_MP7.Clip_In",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/mp7/mp7_mag_in.wav" 
}) 
util.PrecacheSound("BTB_MP7.Clip_In")


sound.Add({
	name = "BTB_MP7.Clip_Lock",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/mp7/mp7_mag_lock.wav" 
}) 
util.PrecacheSound("BTB_MP7.Clip_Lock")


sound.Add({	
	name = "BTB_MP7.Fire",
	channel = CHAN_WEAPON,
	volume = 1.0,
	soundlevel = 100,
	pitch = { 95, 105 },
	sound = 	"weapons/btb/mp7/mp7_fire.wav"
}) 
util.PrecacheSound("BTB_MP7.Fire")

sound.Add({
	name = "BTB_MP7.FireSilenced",
	channel = CHAN_WEAPON,
	volume = 1.0,
	soundlevel = 100,
	pitch = { 95, 105 },
	sound = 	"weapons/btb/mp7/mp7_fire_silenced.wav"
}) 
util.PrecacheSound("BTB_MP7.FireSilenced")

//
// MP5
//

sound.Add({
	name = "BTB_MP5.Deploy",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/mp5/mp5_deploy.wav" 
}) 
util.PrecacheSound("BTB_MP5.Deploy")


sound.Add({
	name = "BTB_MP5.Clip_Out",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/mp5/mp5_mag_out.wav" 
}) 
util.PrecacheSound("BTB_MP5.Clip_Out")

sound.Add({
	name = "BTB_MP5.Clip_In",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/mp5/mp5_mag_in.wav" 
}) 
util.PrecacheSound("BTB_MP5.Clip_In")

sound.Add({
	name = "BTB_MP5.Bolt",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/mp5/mp5_bolt.wav" 
}) 
util.PrecacheSound("BTB_MP5.Bolt")

sound.Add({
	name = "BTB_MP5.Fire",
	channel = CHAN_WEAPON,
	volume = 1.0,
	soundlevel = 100,
	pitch = { 95, 105 },
	sound = 	"weapons/btb/mp5/mp5_fire.wav"
}) 
util.PrecacheSound("BTB_MP5.Fire")

sound.Add({
	name = "BTB_MP5.FireSilenced",
	channel = CHAN_WEAPON,
	volume = 1.0,
	soundlevel = 100,
	pitch = { 95, 105 },
	sound = 	"weapons/btb/mp5/mp5_fire_silenced.wav"
}) 
util.PrecacheSound("BTB_MP5.FireSilenced")

//
// M1911
//

sound.Add({
	name = "BTB_1911.Deploy",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/1911/1911_deploy.wav" 
}) 
util.PrecacheSound("BTB_1911.Deploy")


sound.Add({
	name = "BTB_1911.Clip_Out",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/glock17/glock17_mag_out.wav" 
}) 
util.PrecacheSound("BTB_1911.Clip_Out")


sound.Add({
	name = "BTB_1911.Clip_In",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/glock17/glock17_mag_in.wav" 
}) 
util.PrecacheSound("BTB_1911.Clip_In")


sound.Add({
	name = "BTB_1911.Slide_Release",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/glock17/glock17_slide_forward.wav" 
}) 
util.PrecacheSound("BTB_1911.Slide_Release")


sound.Add({
	name = "BTB_1911.Fire",
	channel = CHAN_WEAPON,
	volume = 1.0,
	soundlevel = 100,
	pitch = { 95, 105 },
	sound = 	"weapons/btb/1911/1911_fire.wav"
}) 
util.PrecacheSound("BTB_1911.Fire")


sound.Add({
	name = "BTB_1911.FireSilenced",
	channel = CHAN_WEAPON,
	volume = 1.0,
	soundlevel = 100,
	pitch = { 95, 105 },
	sound = 	"weapons/btb/1911/1911_fire_silenced.wav"
}) 
util.PrecacheSound("BTB_1911.FireSilenced")

//
// KTR
//


sound.Add({
	name = "BTB_KTR.Deploy",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/ktr/ktr_deploy.wav" 
}) 
util.PrecacheSound("BTB_KTR.Deploy")


sound.Add({
	name = "BTB_KTR.Clip_Grab",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/ktr/ktr_mag_grab.wav" 
}) 
util.PrecacheSound("BTB_KTR.Clip_Grab")


sound.Add({
	name = "BTB_KTR.Clip_Out",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/ktr/ktr_mag_out.wav" 
}) 
util.PrecacheSound("BTB_KTR.Clip_Out")


sound.Add({
	name = "BTB_KTR.Clip_In",
	channel = CHAN_STATIC,
	volume = 1.0,
	
	soundlevel = 100,

	sound = 			"weapons/btb/ktr/ktr_mag_in.wav" 
}) 
util.PrecacheSound("BTB_KTR.Clip_In")


sound.Add({
	name = "BTB_KTR.Bolt_Back",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/ktr/ktr_bolt_back.wav" 
}) 
util.PrecacheSound("BTB_KTR.Bolt_Back")

sound.Add({
	name = "BTB_KTR.Bolt_Forward",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/ktr/ktr_bolt_forward.wav" 
}) 
util.PrecacheSound("BTB_KTR.Bolt_Forward")


sound.Add({
	name = "BTB_KTR.Hand_To_Weapon",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/ktr/ktr_hand_to_weapon.wav" 
}) 
util.PrecacheSound("BTB_KTR.Hand_To_Weapon")


sound.Add({
	name = "BTB_KTR.Fire",
	channel = CHAN_WEAPON,
	volume = 1.0,
	soundlevel = 100,
	pitch = { 95, 105 },
	sound = 	"weapons/btb/ktr/ktr_fire.wav"
}) 
util.PrecacheSound("BTB_KTR.Fire")


sound.Add({
	name = "BTB_KTR.FireSilenced",
	channel = CHAN_WEAPON,
	volume = 1.0,
	soundlevel = 100,
	pitch = { 95, 105 },
	sound = 	"weapons/btb/ktr/ktr_fire_silenced.wav"
}) 
util.PrecacheSound("BTB_KTR.FireSilenced")

//
// M82A1
//


sound.Add({
	name = "BTB_M82A1.Deploy",
	channel = CHAN_STATIC,
	volume = 1.0,
	
	soundlevel = 100,

	sound = 			"weapons/btb/m82a1/m82a1_deploy.wav" 
}) 
util.PrecacheSound("BTB_M82A1.Deploy")


sound.Add({
	name = "BTB_M82A1.Clip_Release",
	channel = CHAN_STATIC,
	volume = 1.0,
	
	soundlevel = 100,

	sound = 			"weapons/btb/m82a1/m82a1_mag_release.wav" 
}) 
util.PrecacheSound("BTB_M82A1.Clip_Release")


sound.Add({
	name = "BTB_M82A1.Clip_Out",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/m82a1/m82a1_mag_out.wav" 
}) 
util.PrecacheSound("BTB_M82A1.Clip_Out")


sound.Add({
	name = "BTB_M82A1.Clip_In",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/m82a1/m82a1_mag_in.wav" 
}) 
util.PrecacheSound("BTB_M82A1.Clip_In")


sound.Add({
	name = "BTB_M82A1.Bolt_Back",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/m82a1/m82a1_bolt_back.wav" 
}) 
util.PrecacheSound("BTB_M82A1.Bolt_Back")


sound.Add({
	name = "BTB_M82A1.Bolt_Forward",
	channel = CHAN_STATIC,
	volume = 1.0,
	
	soundlevel = 100,

	sound = 			"weapons/btb/m82a1/m82a1_bolt_forward.wav" 
}) 
util.PrecacheSound("BTB_M82A1.Bolt_Forward")


sound.Add({
	name = "BTB_M82A1.Fire",
	channel = CHAN_WEAPON,
	volume = 1.0,
	soundlevel = 100,
	pitch = { 95, 105 },
	sound = 	"weapons/btb/m82a1/m82a1_fire.wav"
}) 
util.PrecacheSound("BTB_M82A1.Fire")

//
// Cheytac
//


sound.Add({
	name = "BTB_CHEYTEC.Deploy",
	channel = CHAN_STATIC,
	volume = 1.0,
	
	soundlevel = 100,

	sound = 			"weapons/btb/cheytec/cheytec_deploy.wav" 
}) 
util.PrecacheSound("BTB_CHEYTEC.Deploy")


sound.Add({
	name = "BTB_CHEYTEC.Insert_Round",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/cheytec/cheytec_insert_round.wav" 
}) 
util.PrecacheSound("BTB_CHEYTEC.Insert_Round")


sound.Add({
	name = "BTB_CHEYTEC.Bolt_Back",
	channel = CHAN_STATIC,
	volume = 1.0,
	
	soundlevel = 100,

	sound = 			"weapons/btb/cheytec/cheytec_bolt_back.wav" 
}) 
util.PrecacheSound("BTB_CHEYTEC.Bolt_Back")


sound.Add({
	name = "BTB_CHEYTEC.Bolt_Forward",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/cheytec/cheytec_bolt_forward.wav" 
}) 
util.PrecacheSound("BTB_CHEYTEC.Bolt_Forward")


sound.Add({
	name = "BTB_CHEYTEC.Fire",
	channel = CHAN_WEAPON,
	volume = 1.0,
	soundlevel = 100,
	pitch = { 95, 105 },
	sound = 	"weapons/btb/cheytec/cheytec_fire.wav"
}) 
util.PrecacheSound("BTB_CHEYTEC.Fire")

//
// M24
//

sound.Add({
	name = "BTB_M24.Deploy",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/m24/m24_deploy.wav" 
}) 
util.PrecacheSound("BTB_M24.Deploy")

sound.Add({
	name = "BTB_M24.Insert_Round",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	pitch = { 95, 110 },
	sound = 			"weapons/btb/m24/m24_insert_round.wav" 
}) 
util.PrecacheSound("BTB_M24.Insert_Round")


sound.Add({
	name = "BTB_M24.Bolt_Back",
	channel = CHAN_STATIC,
	volume = 1.0,
	pitch = { 95, 110 },
	soundlevel = 100,

	sound = 			"weapons/btb/m24/m24_bolt_back.wav" 
}) 
util.PrecacheSound("BTB_M24.Bolt_Back")


sound.Add({
	name = "BTB_M24.Bolt_Forward",
	channel = CHAN_STATIC,
	volume = 1.0,
	pitch = { 95, 110 },
	soundlevel = 100,

	sound = 			"weapons/btb/m24/m24_bolt_forward.wav" 
}) 
util.PrecacheSound("BTB_M24.Bolt_Forward")


sound.Add({
	name = "BTB_M24.Fire",
	channel = CHAN_WEAPON,
	volume = 1.0,
	soundlevel = 100,
	pitch = { 95, 105 },
	sound = 	"weapons/btb/m24/m24_fire.wav"
}) 
util.PrecacheSound("BTB_M24.Fire")

//
// F2000
//


sound.Add({
	name = "BTB_F2000.Deploy",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/f2000/f2000_deploy.wav" 
}) 
util.PrecacheSound("BTB_F2000.Deploy")

sound.Add({
	name = "BTB_F2000.Clip_Out",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/f2000/f2000_mag_out.wav" 
}) 
util.PrecacheSound("BTB_F2000.Clip_Out")


sound.Add({
	name = "BTB_F2000.Clip_In",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/f2000/f2000_mag_in.wav" 
}) 
util.PrecacheSound("BTB_F2000.Clip_In")


sound.Add({
	name = "BTB_F2000.Bolt",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/f2000/f2000_bolt.wav" 
}) 
util.PrecacheSound("BTB_F2000.Bolt")


sound.Add({
	name = "BTB_F2000.Fire",
	channel = CHAN_WEAPON,
	volume = 1.0,
	soundlevel = 100,
	pitch = { 95, 105 },
	
	sound = 	"weapons/btb/f2000/f2000_fire.wav"
}) 
util.PrecacheSound("BTB_F2000.Fire")

//
// G36C
//


sound.Add({
	name = "BTB_G36C.Deploy",
	channel = CHAN_STATIC,
	volume = 1.0,
	
	soundlevel = 100,

	sound = 			"weapons/btb/g36c/g36c_deploy.wav" 
}) 
util.PrecacheSound("BTB_G36C.Deploy")


sound.Add({
	name = "BTB_G36C.Clip_Out",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/g36c/g36c_mag_out.wav" 
}) 
util.PrecacheSound("BTB_G36C.Clip_Out")


sound.Add({
	name = "BTB_G36C.Clip_In",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/g36c/g36c_mag_in.wav" 
}) 
util.PrecacheSound("BTB_G36C.Clip_In")


sound.Add({
	name = "BTB_G36C.Bolt",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/g36c/g36c_bolt.wav" 
}) 
util.PrecacheSound("BTB_G36C.Bolt")


sound.Add({
	name = "BTB_G36C.Fire",
	channel = CHAN_WEAPON,
	volume = 1.0,
	soundlevel = 100,
	pitch = { 95, 105 },
	sound = 	"weapons/btb/g36c/g36c_fire.wav"
}) 
util.PrecacheSound("BTB_G36C.Fire")

//
// K7
//


sound.Add({
	name = "BTB_K7.Deploy",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/k7/k7_deploy.wav" 
}) 
util.PrecacheSound("BTB_K7.Deploy")


sound.Add({
	name = "BTB_K7.Clip_Out",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/k7/k7_mag_out.wav" 
}) 
util.PrecacheSound("BTB_K7.Clip_Out")


sound.Add({
	name = "BTB_K7.Clip_In",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/k7/k7_mag_in.wav" 
}) 
util.PrecacheSound("BTB_K7.Clip_In")

sound.Add({
	name = "BTB_K7.Maglock",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/k7/k7_mag_lock.wav" 
}) 
util.PrecacheSound("BTB_K7.Maglock")


sound.Add({
	name = "BTB_K7.Bolt",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/k7/k7_bolt.wav" 
}) 
util.PrecacheSound("BTB_K7.Bolt")


sound.Add({
	name = "BTB_K7.Fire",
	channel = CHAN_WEAPON,
	volume = 1.0,
	soundlevel = 100,
	pitch = { 95, 105 },
	sound = 	"weapons/btb/k7/k7_fire.wav"
}) 
util.PrecacheSound("BTB_K7.Fire")

//
// Scar H
//


sound.Add({
	name = "BTB_SCARH.Deploy",
	channel = CHAN_STATIC,
	volume = 1.0,
	
	soundlevel = 100,

	sound = 			"weapons/btb/scarh/scarh_deploy.wav" 
}) 
util.PrecacheSound("BTB_SCARH.Deploy")


sound.Add({
	name = "BTB_SCARH.Clip_Out",
	channel = CHAN_STATIC,
	volume = 1.0,
	
	soundlevel = 100,

	sound = 			"weapons/btb/scarh/scarh_mag_out.wav" 
}) 
util.PrecacheSound("BTB_SCARH.Clip_Out")


sound.Add({
	name = "BTB_SCARH.Clip_In",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/scarh/scarh_mag_in.wav" 
}) 
util.PrecacheSound("BTB_SCARH.Clip_In")


sound.Add({
	name = "BTB_SCARH.Maglock",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/scarh/scarh_mag_lock.wav" 
}) 
util.PrecacheSound("BTB_SCARH.Maglock")


sound.Add({
	name = "BTB_SCARH.Bolt",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/scarh/scarh_bolt.wav" 
}) 
util.PrecacheSound("BTB_SCARH.Bolt")


sound.Add({
	name = "BTB_SCARH.Fire",
	channel = CHAN_WEAPON,
	volume = 1.0,
	soundlevel = 100,
	pitch = { 95, 105 },
	sound = 	"weapons/btb/scarh/scarh_fire.wav"
}) 
util.PrecacheSound("BTB_SCARH.Fire")

//
// Vector
//

sound.Add({
	name = "BTB_Vector.Deploy",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/vector/vector_deploy.wav" 
}) 
util.PrecacheSound("BTB_Vector.Deploy")


sound.Add({
	name = "BTB_Vector.Clip_Out",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/vector/vector_mag_out.wav" 
}) 
util.PrecacheSound("BTB_Vector.Clip_Out")


sound.Add({
	name = "BTB_Vector.Clip_In",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/vector/vector_mag_in.wav" 
}) 
util.PrecacheSound("BTB_Vector.Clip_In")


sound.Add({
	name = "BTB_Vector.Bolt_Back",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/vector/vector_bolt_back.wav" 
}) 
util.PrecacheSound("BTB_Vector.Bolt_Back")


sound.Add({
	name = "BTB_Vector.Bolt_Forward",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/vector/vector_bolt_forward.wav" 
}) 
util.PrecacheSound("BTB_Vector.Bolt_Forward")


sound.Add({
	name = "BTB_Vector.Fire",
	channel = CHAN_WEAPON,
	volume = 1.0,
	soundlevel = 100,
	pitch = { 95, 105 },
	sound = 	"weapons/btb/vector/vector_fire.wav"
}) 
util.PrecacheSound("BTB_Vector.Fire")

//
// UMP45
//

sound.Add({
	name = "BTB_UMP45.Deploy",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/ump45/ump45_deploy.wav" 
}) 
util.PrecacheSound("BTB_UMP45.Deploy")

sound.Add({
	name = "BTB_UMP45.Clip_Out",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/ump45/ump45_mag_out.wav" 
}) 
util.PrecacheSound("BTB_UMP45.Clip_Out")

sound.Add({
	name = "BTB_UMP45.Clip_In",
	channel = CHAN_STATIC,
	volume = 1.0,
	
	soundlevel = 100,

	sound = 			"weapons/btb/ump45/ump45_mag_in.wav" 
}) 
util.PrecacheSound("BTB_UMP45.Clip_In")


sound.Add({
	name = "BTB_UMP45.Bolt",
	channel = CHAN_STATIC,
	volume = 1.0,
	
	soundlevel = 100,

	sound = 			"weapons/btb/ump45/ump45_bolt.wav" 
}) 
util.PrecacheSound("BTB_UMP45.Bolt")


sound.Add({
	name = "BTB_UMP45.Maglock",
	channel = CHAN_STATIC,
	volume = 1.0,
	
	soundlevel = 100,

	sound = 			"weapons/btb/ump45/ump45_mag_lock.wav" 
}) 
util.PrecacheSound("BTB_UMP45.Maglock")


sound.Add({
	name = "BTB_UMP45.Fire",
	channel = CHAN_WEAPON,
	volume = 1.0,
	soundlevel = 100,
	pitch = { 95, 105 },
	sound = 	"weapons/btb/ump45/ump45_fire.wav"
}) 
util.PrecacheSound("BTB_UMP45.Fire")

//
// ACR
//


sound.Add({
	name = "BTB_ACR.Deploy",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 		"weapons/btb/acr/acr_deploy.wav" 
}) 
util.PrecacheSound("BTB_ACR.Deploy")


sound.Add({
	name = "BTB_ACR.Clip_Out",
	channel = CHAN_STATIC,
	volume = 1.0,
	
	soundlevel = 100,

	sound = 			"weapons/btb/acr/acr_mag_out.wav" 
}) 
util.PrecacheSound("BTB_ACR.Clip_Out")


sound.Add({
	name = "BTB_ACR.Clip_In",
	channel = CHAN_STATIC,
	volume = 1.0,
	
	soundlevel = 100,

	sound = 			"weapons/btb/acr/acr_mag_in.wav" 
}) 
util.PrecacheSound("BTB_ACR.Clip_In")


sound.Add({
	name = "BTB_ACR.Bolt",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/acr/acr_bolt.wav" 
}) 
util.PrecacheSound("BTB_ACR.Bolt")


sound.Add({
	name = "BTB_ACR.Maglock",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/acr/acr_mag_lock.wav" 
}) 
util.PrecacheSound("BTB_ACR.Maglock")


sound.Add({
	name = "BTB_ACR.Fire",
	channel = CHAN_WEAPON,
	volume = 1.0,
	soundlevel = 100,
	pitch = { 95, 105 },
	sound = 	"weapons/btb/acr/acr_fire.wav"
}) 
util.PrecacheSound("BTB_ACR.Fire")

//
// KAC PDW
//


sound.Add({
	name = "BTB_KAC.Deploy",
	channel = CHAN_STATIC,
	volume = 1.0,
	
	soundlevel = 100,

	sound = 			"weapons/btb/kac/kac_deploy.wav" 
}) 
util.PrecacheSound("BTB_KAC.Deploy")


sound.Add({
	name = "BTB_KAC.Clip_Out",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/kac/kac_mag_out.wav" 
}) 
util.PrecacheSound("BTB_KAC.Clip_Out")


sound.Add({
	name = "BTB_KAC.Clip_In",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/kac/kac_mag_in.wav" 
}) 
util.PrecacheSound("BTB_KAC.Clip_In")


sound.Add({
	name = "BTB_KAC.Maglock",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/kac/kac_mag_lock.wav" 
}) 
util.PrecacheSound("BTB_KAC.Maglock")


sound.Add({
	name = "BTB_KAC.Bolt_Back",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/kac/kac_bolt_back.wav" 
}) 
util.PrecacheSound("BTB_KAC.Bolt_Back")


sound.Add({
	name = "BTB_KAC.Bolt_Forward",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/kac/kac_bolt_forward.wav" 
}) 
util.PrecacheSound("BTB_KAC.Bolt_Forward")


sound.Add({
	name = "BTB_KAC.Fire",
	channel = CHAN_WEAPON,
	volume = 1.0,
	soundlevel = 100,
	pitch = { 95, 105 },
	sound = 	"weapons/btb/kac/kac_fire.wav"
}) 
util.PrecacheSound("BTB_KAC.Fire")

//
// Hectate
//


sound.Add({
	name = "BTB_Hectate.Deploy",
	channel = CHAN_STATIC,
	volume = 1.0,
	
	soundlevel = 100,

	sound = 			"weapons/btb/hectate/hectate_deploy.wav" 
}) 
util.PrecacheSound("BTB_Hectate.Deploy")


sound.Add({
	name = "BTB_Hectate.Clip_Out",
	channel = CHAN_STATIC,
	volume = 1.0,
	
	soundlevel = 100,

	sound = 			"weapons/btb/hectate/hectate_mag_out.wav" 
}) 
util.PrecacheSound("BTB_Hectate.Clip_Out")


sound.Add({
	name = "BTB_Hectate.Clip_In",
	channel = CHAN_STATIC,
	volume = 1.0,
	
	soundlevel = 100,

	sound = 			"weapons/btb/hectate/hectate_mag_in.wav" 
}) 
util.PrecacheSound("BTB_Hectate.Clip_In")


sound.Add({
	name = "BTB_Hectate.Clip_Tap",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/hectate/hectate_mag_tap.wav" 
}) 
util.PrecacheSound("BTB_Hectate.Clip_Tap")


sound.Add({
	name = "BTB_Hectate.Bolt_Back",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/hectate/hectate_bolt_back.wav" 
}) 
util.PrecacheSound("BTB_Hectate.Bolt_Back")

sound.Add({
	name = "BTB_Hectate.Bolt_Forward",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/hectate/hectate_bolt_forward.wav" 
}) 
util.PrecacheSound("BTB_Hectate.Bolt_Forward")


sound.Add({
	name = "BTB_Hectate.Fire",
	channel = CHAN_WEAPON,
	volume = 1.0,
	soundlevel = 100,
	pitch = { 95, 105 },
	sound = 	"weapons/btb/hectate/hectate_fire.wav"
}) 
util.PrecacheSound("BTB_Hectate.Fire")

//
// M21
//


sound.Add({
	name = "BTB_M21.Deploy",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/m21/m21_deploy.wav" 
}) 
util.PrecacheSound("BTB_M21.Deploy")


sound.Add({
	name = "BTB_M21.Clip_Out",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/m21/m21_mag_out.wav" 
}) 
util.PrecacheSound("BTB_M21.Clip_Out")


sound.Add({
	name = "BTB_M21.Clip_In",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/m21/m21_mag_in.wav" 
}) 
util.PrecacheSound("BTB_M21.Clip_In")


sound.Add({
	name = "BTB_M21.Clip_Tap",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/m21/m21_mag_tap.wav" 
}) 
util.PrecacheSound("BTB_M21.Clip_Tap")


sound.Add({
	name = "BTB_M21.Bolt_Back",
	channel = CHAN_STATIC,
	volume = 1.0,
	
	soundlevel = 100,

	sound = 			"weapons/btb/m21/m21_bolt_back.wav" 
}) 
util.PrecacheSound("BTB_M21.Bolt_Back")


sound.Add({
	name = "BTB_M21.Bolt_Forward",
	channel = CHAN_STATIC,
	volume = 1.0,
	
	soundlevel = 100,

	sound = 			"weapons/btb/m21/m21_bolt_forward.wav" 
}) 
util.PrecacheSound("BTB_M21.Bolt_Forward")


sound.Add({
	name = "BTB_M21.Fire",
	channel = CHAN_WEAPON,
	volume = 1.0,
	soundlevel = 100,
	pitch = { 95, 105 },
	sound = 	"weapons/btb/m21/m21_fire.wav"
}) 
util.PrecacheSound("BTB_M21.Fire")


sound.Add({
	name = "BTB_M21.FireSilenced",
	channel = CHAN_WEAPON,
	volume = 1.0,
	soundlevel = 100,
	pitch = { 95, 105 },
	sound = 	"weapons/btb/m21/m21_fire_silenced.wav"
}) 
util.PrecacheSound("BTB_M21.FireSilenced")

//
// Dragunov
//


sound.Add({
	name = "BTB_DRAGUNOV.Deploy",
	channel = CHAN_STATIC,
	volume = 1.0,
	
	soundlevel = 100,

	sound = 			"weapons/btb/dragunov/dragunov_deploy.wav" 
}) 
util.PrecacheSound("BTB_DRAGUNOV.Deploy")


sound.Add({
	name = "BTB_DRAGUNOV.Clip_Out",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/dragunov/dragunov_mag_out.wav" 
}) 
util.PrecacheSound("BTB_DRAGUNOV.Clip_Out")

sound.Add({
	name = "BTB_DRAGUNOV.Clip_In",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/dragunov/dragunov_mag_in.wav" 
}) 
util.PrecacheSound("BTB_DRAGUNOV.Clip_In")


sound.Add({
	name = "BTB_DRAGUNOV.Bolt",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/dragunov/dragunov_bolt.wav" 
}) 
util.PrecacheSound("BTB_DRAGUNOV.Bolt")


sound.Add({
	name = "BTB_DRAGUNOV.Fire",
	channel = CHAN_WEAPON,
	volume = 1.0,
	soundlevel = 100,
	pitch = { 95, 105 },
	sound = 	"weapons/btb/dragunov/dragunov_fire.wav"
}) 
util.PrecacheSound("BTB_DRAGUNOV.Fire")


sound.Add({
	name = "BTB_DRAGUNOV.FireSilenced",
	channel = CHAN_WEAPON,
	volume = 1.0,
	soundlevel = 100,
	pitch = { 95, 105 },
	sound = 	"weapons/btb/dragunov/dragunov_fire_silenced.wav"
}) 
util.PrecacheSound("BTB_DRAGUNOV.FireSilenced")

//
// P90
//


sound.Add({
	name = "BTB_P90.Deploy",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/p90/p90_deploy.wav" 
}) 
util.PrecacheSound("BTB_P90.Deploy")


sound.Add({
	name = "BTB_P90.Clip_Out",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/p90/p90_mag_out.wav" 
}) 
util.PrecacheSound("BTB_P90.Clip_Out")


sound.Add({
	name = "BTB_P90.Clip_In",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/p90/p90_mag_in.wav" 
}) 
util.PrecacheSound("BTB_P90.Clip_In")


sound.Add({
	name = "BTB_P90.Clip_Hit",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/p90/p90_mag_hit.wav" 
}) 
util.PrecacheSound("BTB_P90.Clip_Hit")


sound.Add({
	name = "BTB_P90.Bolt",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/p90/p90_bolt.wav" 
}) 
util.PrecacheSound("BTB_P90.Bolt")


sound.Add({
	name = "BTB_P90.Fire",
	channel = CHAN_WEAPON,
	volume = 1.0,
	soundlevel = 100,
	pitch = { 95, 105 },
	sound = 	"weapons/btb/p90/p90_fire.wav"
}) 
util.PrecacheSound("BTB_P90.Fire")


sound.Add({
	name = "BTB_P90.FireSilenced",
	channel = CHAN_WEAPON,
	volume = 1.0,
	soundlevel = 100,
	pitch = { 95, 105 },
	sound = 	"weapons/btb/p90/p90_fire_silenced.wav"
}) 
util.PrecacheSound("BTB_P90.FireSilenced")

//
// M16A4
//

sound.Add({
	name = "BTB_M16A4.Deploy",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/m16a4/m16a4_deploy.wav" 
}) 
util.PrecacheSound("BTB_M16A4.Deploy")


sound.Add({
	name = "BTB_M16A4.Clip_Out",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/m16a4/m16a4_mag_out.wav" 
}) 
util.PrecacheSound("BTB_M16A4.Clip_Out")

sound.Add({
	name = "BTB_M16A4.Clip_In",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/m16a4/m16a4_mag_in.wav" 
}) 
util.PrecacheSound("BTB_M16A4.Clip_In")


sound.Add({
	name = "BTB_M16A4.Clip_Tap",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/m16a4/m16a4_mag_tap.wav" 
}) 
util.PrecacheSound("BTB_M16A4.Clip_Tap")

sound.Add({
	name = "BTB_M16A4.Bolt_Back",
	channel = CHAN_STATIC,
	volume = 1.0,
	
	soundlevel = 100,

	sound = 			"weapons/btb/m16a4/m16a4_bolt_back.wav" 
}) 
util.PrecacheSound("BTB_M16A4.Bolt_Back")


sound.Add({
	name = "BTB_M16A4.Bolt_Forward",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/m16a4/m16a4_bolt_forward.wav" 
}) 
util.PrecacheSound("BTB_M16A4.Bolt_Forward")


sound.Add({
	name = "BTB_M16A4.Maglock",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/m16a4/m16a4_mag_lock.wav" 
}) 
util.PrecacheSound("BTB_M16A4.Maglock")


sound.Add({
	name = "BTB_M16A4.Fire",
	channel = CHAN_WEAPON,
	volume = 1.0,
	soundlevel = 100,
	pitch = { 95, 105 },
	sound = 	"weapons/btb/m16a4/m16a4_fire.wav"
}) 
util.PrecacheSound("BTB_M16A4.Fire")


sound.Add({
	name = "BTB_M16A4.FireSilenced",
	channel = CHAN_WEAPON,
	volume = 1.0,
	soundlevel = 100,
	pitch = { 95, 105 },
	sound = 	"weapons/btb/m16a4/m16a4_fire_silenced.wav"
}) 
util.PrecacheSound("BTB_M16A4.FireSilenced")

//
// SCAR-L
//


sound.Add({
	name = "BTB_SCARL.Deploy",
	channel = CHAN_STATIC,
	volume = 1.0,
	
	soundlevel = 100,

	sound = 			"weapons/btb/scarl/scarl_deploy.wav" 
}) 
util.PrecacheSound("BTB_SCARL.Deploy")


sound.Add({
	name = "BTB_SCARL.Clip_Out",
	channel = CHAN_STATIC,
	volume = 1.0,
	
	soundlevel = 100,

	sound = 			"weapons/btb/scarl/scarl_mag_out.wav" 
}) 
util.PrecacheSound("BTB_SCARL.Clip_Out")


sound.Add({
	name = "BTB_SCARL.Clip_In",
	channel = CHAN_STATIC,
	volume = 1.0,
	
	soundlevel = 100,

	sound = 			"weapons/btb/scarl/scarl_mag_in.wav" 
}) 
util.PrecacheSound("BTB_SCARL.Clip_In")


sound.Add({
	name = "BTB_SCARL.Bolt",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/scarl/scarl_bolt.wav" 
}) 
util.PrecacheSound("BTB_SCARL.Bolt")


sound.Add({
	name = "BTB_SCARL.Maglock",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/scarl/scarl_mag_lock.wav" 
}) 
util.PrecacheSound("BTB_SCARL.Maglock")


sound.Add({
	name = "BTB_SCARL.Fire",
	channel = CHAN_WEAPON,
	volume = 1.0,
	soundlevel = 100,
	pitch = { 95, 105 },
	sound = 	"weapons/btb/scarl/scarl_fire.wav"
}) 
util.PrecacheSound("BTB_SCARL.Fire")


sound.Add({
	name = "BTB_SCARL.FireSilenced",
	channel = CHAN_WEAPON,
	volume = 1.0,
	soundlevel = 100,
	pitch = { 95, 105 },
	sound = 	"weapons/btb/scarl/scarl_fire_silenced.wav"
}) 
util.PrecacheSound("BTB_SCARL.FireSilenced")

//
// AT4
//


sound.Add({
	name = "BTB_AT4.Deploy",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 		"weapons/btb/rpg7/rpg7_deploy.wav" 
}) 
util.PrecacheSound("BTB_AT4.Deploy")


sound.Add({
	name = "BTB_AT4.Rocket_In",
	channel = CHAN_STATIC,
	volume = 1.0,
	
	soundlevel = 100,

	sound = 			"weapons/btb/at4/at4_rocket_in.wav" 
}) 
util.PrecacheSound("BTB_AT4.Rocket_In")


sound.Add({
	name = "BTB_AT4.Rocket_Hit",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/at4/at4_rocket_in_hit.wav" 
}) 
util.PrecacheSound("BTB_AT4.Rocket_Hit")

//
// RPG-7
//

sound.Add({
	name = "BTB_RPG7.Deploy",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/rpg7/rpg7_deploy.wav" 
}) 
util.PrecacheSound("BTB_RPG7.Deploy")


sound.Add({
	name = "BTB_RPG7.Rocket_In",
	channel = CHAN_STATIC,
	volume = 1.0,
	
	soundlevel = 100,

	sound = 			"weapons/btb/rpg7/rpg7_rocket_in.wav" 
}) 
util.PrecacheSound("BTB_RPG7.Rocket_In")


sound.Add({
	name = "BTB_RPG7.Rocket_Twist",
	channel = CHAN_STATIC,
	volume = 1.0,
	
	soundlevel = 100,

	sound = 			"weapons/btb/rpg7/rpg7_rocket_twist.wav" 
}) 
util.PrecacheSound("BTB_RPG7.Rocket_Twist")


sound.Add({
	name = "BTB_RPG7.Fire",
	channel = CHAN_WEAPON,
	volume = 1.0,
	soundlevel = 100,
	sound = 	"weapons/btb/rpg7/rpg7_fire.wav"
}) 
util.PrecacheSound("BTB_RPG7.Fire")


sound.Add({
	name = "BTB_ROCKET.Explode",
	channel =	CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = {"weapons/btb/rpg7/Rocket_Explode1.wav",
	"weapons/btb/rpg7/Rocket_Explode2.wav",
	"weapons/btb/rpg7/Rocket_Explode3.wav",
	"weapons/btb/rpg7/Rocket_Explode4.wav",
	}
}) 
util.PrecacheSound("BTB_ROCKET.Explode")


sound.Add({
	name = "BTB_ROCKET.Flight",
	channel = CHAN_WEAPON,
	volume = 1.0,
	soundlevel = 100,
	sound = 	"weapons/btb/rpg7/Rocket_Flight.wav",
}) 
util.PrecacheSound("BTB_ROCKET.Flight")

//
// Knife
//

sound.Add({
	name = "BTB_KNIFE.Swing",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	pitch = { 90, 110 },

	sound = {"weapons/btb/knife/knife_swing1.wav",
	"weapons/btb/knife/knife_swing2.wav",
	}
}) 
util.PrecacheSound("BTB_KNIFE.Swing")


sound.Add({
	name = "BTB_KNIFE.Stab",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
    sound = {"weapons/btb/knife/knife_hit1.wav",
	"weapons/btb/knife/knife_hit2.wav",
	}
}) 
util.PrecacheSound("BTB_KNIFE.Stab")

//
// Folley Sounds
//


sound.Add({
	name = "BTB_Folley.Weapon_Deploy",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = {"folley/weapon_deploy1.wav",
	"folley/weapon_deploy2.wav",
	"folley/weapon_deploy3.wav",
	}
	
}) 
util.PrecacheSound("BTB_Folley.Weapon_Deploy")


sound.Add({
	name = "BTB_Folley.Weapon_Holster",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = {"folley/weapon_holster1.wav",
	"folley/weapon_holster2.wav",
	"folley/weapon_holster3.wav",
	}
}) 
util.PrecacheSound("BTB_Folley.Weapon_Holster")


sound.Add({
	name = "BTB_Folley.Cloth_Fast",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = {"folley/generic_cloth_fast1.wav",
	"folley/generic_cloth_fast2.wav",
	}
}) 
util.PrecacheSound("BTB_Folley.Cloth_Fast")


sound.Add({
	name = "BTB_Folley.Cloth_Medium",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = {"folley/generic_cloth_medium1.wav",
	"folley/generic_cloth_medium2.wav",
	}
}) 
util.PrecacheSound("BTB_Folley.Cloth_Medium")


sound.Add({
	name = "BTB_Folley.Cloth_Slow",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = {"folley/generic_cloth_slow1.wav",
	"folley/generic_cloth_slow2.wav",
	}
}) 
util.PrecacheSound("BTB_Folley.Cloth_Slow")


sound.Add({
	name = "BTB_Folley.Cloth_Generic",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = {"folley/generic_cloth_movement1.wav",
	"folley/generic_cloth_movement2.wav",
	"folley/generic_cloth_movement3.wav",
	"folley/generic_cloth_movement4.wav",
	}
}) 
util.PrecacheSound("BTB_Folley.Cloth_Generic")


sound.Add({
	name = "BTB_Folley.Mag_Pouch",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = {"folley/generic_magpouch1.wav",
	"folley/generic_magpouch2.wav",
	}
}) 
util.PrecacheSound("BTB_Folley.Mag_Pouch")


sound.Add({
	name = "BTB_Folley.Ironsight_In",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = {"folley/weapon_sightraise.wav",
	"folley/weapon_sightraise2.wav",
	}
}) 
util.PrecacheSound("BTB_Folley.Ironsight_In")


sound.Add({
	name = "BTB_Folley.Ironsight_Out",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = {"folley/weapon_sightlower.wav",
	"folley/weapon_sightlower2.wav",
	}
}) 
util.PrecacheSound("BTB_Folley.Ironsight_Out")


sound.Add({
	name = "BTB_M4A1.Deploy",
	channel = CHAN_STATIC,
	volume = 1.0, 
	soundlevel = 100,
	sound = "weapons/btb/m4a1/m4_deploy.wav"
}) 
util.PrecacheSound("BTB_M4A1.Deploy")

sound.Add({
	name = "BTB_M4A1.Clip_Out",
	channel = CHAN_STATIC,
	volume = 1.0, 
	soundlevel = 100,
	sound = "weapons/btb/m4a1/m4_mag_out.wav"
}) 
util.PrecacheSound("BTB_M4A1.Clip_Out")


sound.Add({
	name = "BTB_M4A1.Clip_In",
	channel = CHAN_STATIC,
	volume = 1.0, 
	soundlevel = 100,
	sound = "weapons/btb/m4a1/m4_mag_in.wav"
}) 
util.PrecacheSound("BTB_M4A1.Clip_In")


sound.Add({
	name = "BTB_M4A1.Bolt_Back",
	channel = CHAN_STATIC,
	volume = 1.0, 
	soundlevel = 100,
	sound = "weapons/btb/m4a1/m4_bolt_back.wav" 
}) 
util.PrecacheSound("BTB_M4A1.Bolt_Back")


sound.Add({
	name = "BTB_M4A1.Bolt_Forward",
	channel	= CHAN_STATIC,
	volume	= 1.0,
	soundlevel = 100,
	sound = "weapons/btb/m4a1/m4_bolt_forward.wav"
}) 
util.PrecacheSound("BTB_M4A1.Bolt_Forward")


sound.Add({
	name = "BTB_M4A1.Clip_Lock",
	channel = CHAN_STATIC,
	volume = 1.0, 
	soundlevel = 100,
	sound = "weapons/btb/m4a1/m4_mag_lock.wav" 
}) 
util.PrecacheSound("BTB_M4A1.Clip_Lock")


sound.Add({
	name = "BTB_M4A1.Fire",
	channel = CHAN_WEAPON,
	volume = 1.0, 
	soundlevel = 100,
	pitch = { 95, 105 },
	sound = "weapons/btb/m4a1/m4_fire.wav"
}) 
util.PrecacheSound("BTB_M4A1.Fire")


sound.Add({
	name = "BTB_M4A1.FireSilenced",
	channel = CHAN_STATIC,
	volume = 1.0, 
	soundlevel = 100,
	pitch = { 95, 105 },
	sound = "weapons/btb/m4a1/m4_fire_silenced.wav"
}) 
util.PrecacheSound("BTB_M4A1.FireSilenced")

//
// Grenade Sounds
//

sound.Add({
	name = "BTB_GRENADE.Explode",
	channel	= CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = {"weapons/btb/grenade/Frag_Explode1.wav",
	"weapons/btb/grenade/Frag_Explode2.wav",
	"weapons/btb/grenade/Frag_Explode3.wav",
	"weapons/btb/grenade/Frag_Explode4.wav",
	}
}) 
util.PrecacheSound("BTB_GRENADE.Explode")


sound.Add({
	name = "BTB_GRENADE.Impact",
	channel = CHAN_STATIC,
	volume = 1.0,
	soundlevel = 100,
	sound = {"weapons/btb/grenade/Frag_Bounce_Generic1.wav", 
	"weapons/btb/grenade/Frag_Bounce_Generic2.wav",
	"weapons/btb/grenade/Frag_Bounce_Generic3.wav",
	"weapons/btb/grenade/Frag_Bounce_Generic4.wav",
	"weapons/btb/grenade/Frag_Bounce_Generic5.wav",
	}
}) 
util.PrecacheSound("BTB_GRENADE.Impact")


sound.Add({
	name = "BTB_GRENADE.Deploy",
	channel = CHAN_WEAPON,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/grenade/Frag_Deploy.wav",
}) 
util.PrecacheSound("BTB_GRENADE.Deploy")


sound.Add({
	name = "BTB_GRENADE.PullPin",
	channel = CHAN_WEAPON,
	volume = 1.0,
	soundlevel = 100,
	sound = 			"weapons/btb/grenade/Frag_Pull_Pin.wav",
}) 
util.PrecacheSound("BTB_GRENADE.PullPin")


sound.Add({
	name = "BTB_GRENADE.Throw",
	channel = CHAN_WEAPON,
	volume = 1.0,
	soundlevel = 100,
	sound = "weapons/btb/grenade/Frag_Throw.wav",
}) 
util.PrecacheSound("BTB_GRENADE.Throw")