
-- Touring car engines for Avtomat events 2021


--I4
ACF_DefineEngine( "1.6-I4T", {
	name = "1.6L I4T Petrol",
	desc = "1.6L turbocharged touring car engine",
	model = "models/engines/inline4s.mdl",
	sound = "acf_extra/vehiclefx/engines/l4/mini_onhigh.wav",
	pitch = 0.75,
	category = "Touring",
	fuel = "Petrol",
	enginetype = "GenericPetrol",
	requiresfuel = true,
	weight = 82,
	torque = 258*1.2,
	flywheelmass = 0.041,
	idlerpm = 1100,
	peakminrpm = 4000,
	peakmaxrpm = 7000,
	limitrpm = 8800
} )

ACF_DefineEngine( "2.5-I4T", {
	name = "2.5L I4T Petrol",
	desc = "2.5L turbocharged I4 touring car engine",
	model = "models/engines/inline4s.mdl",
	sound = "acf_extra/vehiclefx/engines/l4/mini_onhigh.wav",
	pitch = 0.75,
	category = "Touring",
	fuel = "Petrol",
	enginetype = "GenericPetrol",
	requiresfuel = true,
	weight = 129,
	torque = 330*1.2,
	flywheelmass = 0.1,
	idlerpm = 1100,
	peakminrpm = 3700,
	peakmaxrpm = 6620,
	limitrpm = 7500
} )

ACF_DefineEngine( "2.5-I4", {
	name = "2.5L I4 Petrol",
	desc = "2.5L  I4 touring car engine",
	model = "models/engines/inline4s.mdl",
	sound = "acf_extra/vehiclefx/engines/l4/mini_onhigh.wav",
	pitch = 0.75,
	category = "Touring",
	fuel = "Petrol",
	enginetype = "GenericPetrol",
	requiresfuel = true,
	weight = 97,
	torque = 237.5*1.2,
	flywheelmass = 0.1,
	idlerpm = 900,
	peakminrpm = 3500,
	peakmaxrpm = 6000,
	limitrpm = 7200
} )

--B4
ACF_DefineEngine( "2.5-B4T", {
	name = "2.5L B4T Petrol",
	desc = "2.5L turbocharged B4 touring car engine",
	model = "models/engines/b4small.mdl",
	sound = "acf_engines/b4_petrolmedium.wav",
	pitch = 0.75,
	category = "Touring",
	fuel = "Petrol",
	enginetype = "GenericPetrol",
	requiresfuel = true,
	weight = 119,
	torque = 330*1.2,
	flywheelmass = 0.09,
	idlerpm = 1000,
	peakminrpm = 3800,
	peakmaxrpm = 6620,
	limitrpm = 8000
} )

ACF_DefineEngine( "2.5-B4", {
	name = "2.5L B4 Petrol",
	desc = "2.5L  B4 touring car engine",
	model = "models/engines/b4small.mdl",
	sound = "acf_engines/b4_petrolmedium.wav",
	pitch = 0.75,
	category = "Touring",
	fuel = "Petrol",
	enginetype = "GenericPetrol",
	requiresfuel = true,
	weight = 90,
	torque = 237.5*1.2,
	flywheelmass = 0.09,
	idlerpm = 940,
	peakminrpm = 3600,
	peakmaxrpm = 6000,
	limitrpm = 8000
} )


--V6
ACF_DefineEngine( "2.5L-V6", {
	name = "2.5L V6 Petrol",
	desc = "Touring car 300hp class engine",
	model = "models/engines/v6small.mdl",
	sound = "acf_extra/vehiclefx/engines/l6/capri_onmid.WAV",
	category = "Touring",
	fuel = "Petrol",
	enginetype = "GenericPetrol",
	requiresfuel = true,
	weight = 150,
	torque = 246*1.2,
	flywheelmass = 0.075,
	idlerpm = 1000,
	peakminrpm = 3600,
	peakmaxrpm = 5800,
	limitrpm = 7500
} )


ACF_DefineEngine( "2.5L-V6T", {
	name = "2.5L V6T Petrol",
	desc = "2.5L turbocharged V6 touring car engine",
	model = "models/engines/v6small.mdl",
	sound = "acf_extra/vehiclefx/engines/l6/capri_onmid.WAV",
	category = "Touring",
	fuel = "Petrol",
	enginetype = "GenericPetrol",
	requiresfuel = true,
	weight = 180,
	torque = 336.5*1.2,
	flywheelmass = 0.075,
	idlerpm = 1250,
	peakminrpm = 4500,
	peakmaxrpm = 6500,
	limitrpm = 7200
} )

--I6
ACF_DefineEngine( "2.5L-I6", {
	name = "2.5L I6 Petrol",
	desc = "2.5L I6 touring car engine",
	model = "models/engines/inline6s.mdl",
	sound = "acf_extra/vehiclefx/engines/l6/capri_onmid.WAV",
	category = "Touring",
	fuel = "Petrol",
	enginetype = "GenericPetrol",
	requiresfuel = true,
	weight = 160,
	torque = 230*1.2,
	flywheelmass = 0.065,
	idlerpm = 870,
	peakminrpm = 3400,
	peakmaxrpm = 6200,
	limitrpm = 8000
} )


ACF_DefineEngine( "2.5L-I6T", {
	name = "2.5L I6T Petrol",
	desc = "2.5L turbocharged I6 touring car engine",
	model = "models/engines/inline6s.mdl",
	sound = "acf_extra/vehiclefx/engines/l6/capri_onmid.WAV",
	category = "Touring",
	fuel = "Petrol",
	enginetype = "GenericPetrol",
	requiresfuel = true,
	weight = 180,
	torque = 321.5*1.2,
	flywheelmass = 0.065,
	idlerpm = 1080,
	peakminrpm = 4000,
	peakmaxrpm = 6800,
	limitrpm = 8000
} )

--I5
ACF_DefineEngine( "2.5L-I5", {
	name = "2.5L I5 Petrol",
	desc = "2.5L I5 touring car engine",
	model = "models/engines/inline5s.mdl",
	sound = "acf_engines/i5_petrolsmall.wav",
	category = "Touring",
	fuel = "Petrol",
	enginetype = "GenericPetrol",
	requiresfuel = true,
	weight = 130,
	torque = 237.5*1.2,
	flywheelmass = 0.1,
	idlerpm = 900,
	peakminrpm = 3300,
	peakmaxrpm = 6000,
	limitrpm = 7000
} )


ACF_DefineEngine( "2.5L-I5T", {
	name = "2.5L I5T Petrol",
	desc = "2.5L turbocharged I5 touring car engine",
	model = "models/engines/inline5s.mdl",
	sound = "acf_engines/i5_petrolsmall.wav",
	category = "Touring",
	fuel = "Petrol",
	enginetype = "GenericPetrol",
	requiresfuel = true,
	weight = 160,
	torque = 340.5*1.2,
	flywheelmass = 0.1,
	idlerpm = 900,
	peakminrpm = 4400,
	peakmaxrpm = 6420,
	limitrpm = 6900
} )


--V8
ACF_DefineEngine( "4.0L-V8", {
	name = "4.0L V8 Petrol",
	desc = "4.0L V8 touring car engine",
	model = "models/engines/v8s.mdl",
	sound = "acf_engines/v8_petrolsmall.wav",
	category = "Touring",
	fuel = "Petrol",
	enginetype = "GenericPetrol",
	requiresfuel = true,
	weight = 200,
	torque = 330*1.2,
	flywheelmass = 0.14,
	idlerpm = 900,
	peakminrpm = 4000,
	peakmaxrpm = 6620,
	limitrpm = 8500
} )