
--define the class
ACF_defineGunClass("AC", {
	spread = 0.12,
	name = "Autocannon",
	desc = "Autocannons have a rather high weight and bulk for the ammo they fire, but they can fire it extremely fast.",
	muzzleflash = "30mm_muzzleflash_noscale",
	rofmod = 0.35,
	sound = "weapons/ACF_Gun/ac_fire4.wav",
	soundDistance = " ",
	soundNormal = " "
} )

--add a gun to the class
ACF_defineGun("20mmAC", { --id
	name = "20mm Autocannon",
	desc = "The 20mm AC is the smallest of the family; having a good rate of fire but a tiny shell.",
	model = "models/autocannon/autocannon_20mm.mdl",
	caliber = 2.0,
	gunclass = "AC",
	weight = 225,
	year = 1930,
	rofmod = 1.8,
	magsize = 100,
	magreload = 3,
	round = {
		maxlength = 32,
		propweight = 0.13
	}
} )
	
ACF_defineGun("30mmAC", {
	name = "30mm Autocannon",
	desc = "The 30mm AC can fire shells with sufficient space for a small payload, and has modest anti-armor capability",
	model = "models/autocannon/autocannon_30mm.mdl",
	gunclass = "AC",
	caliber = 3.0,
	weight = 960,
	year = 1935,
	rofmod = 1,
	magsize = 75,
	magreload = 3,
	round = {
		maxlength = 39,
		propweight = 0.350
	}
} )
	
ACF_defineGun("40mmAC", {
	name = "40mm Autocannon",
	desc = "The 40mm AC can fire shells with sufficient space for a useful payload, and can get decent penetration with proper rounds.",
	model = "models/autocannon/autocannon_40mm.mdl",
	gunclass = "AC",
	caliber = 4.0,
	weight = 1500,
	year = 1940,
	rofmod = 0.92,
	magsize = 30,
	magreload = 3,
	round = {
		maxlength = 45,
		propweight = 0.9
	}
} )
	
ACF_defineGun("50mmAC", {
	name = "50mm Autocannon",
	desc = "The 50mm AC fires shells comparable with the 50mm Cannon, making it capable of destroying light armour quite quickly.",
	model = "models/autocannon/autocannon_50mm.mdl",
	gunclass = "AC",
	caliber = 5.0,
	weight = 2130,
	year = 1965,
	rofmod = 0.9,
	magsize = 20,
	magreload = 3,
	round = {
		maxlength = 52,
		propweight = 1.2
	}
} )

ACF_defineGun("100mmAC", {
	name = "100mm Assaultcannon",
	desc = "A fast boom toob.",
	model = "models/tankgun/tankgun_short_100mm.mdl",
	gunclass = "AC",
	caliber = 10.0,
	weight = 3130,
	year = 1965,
	rofmod = 0.1,
	magsize = 50,
	magreload = 3,
	round = {
		maxlength = 93,
		propweight = 9.5
	}
} )

ACF_defineGun("280mmAC", {
	name = "280mm Heavy Assaultcannon",
	desc = "When a Bigrac isnt enough...",
	model = "models/mortar/mortar_280mm.mdl",
	gunclass = "AC",
	caliber = 28.0,
	weight = 9085,
	year = 1965,
	rofmod = 0.06,
	magsize = 50,
	magreload = 6,
	round = {
		maxlength = 105,
		propweight = 40.5
	}
} )

