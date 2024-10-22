/**********************Ice Moon Areas**************************/

/area/omega
	icon = 'icons/area/areas_station.dmi'
	icon_state = "mining"
	has_gravity = STANDARD_GRAVITY
	flags_1 = NONE
	area_flags = UNIQUE_AREA | FLORA_ALLOWED
	ambience_index = AMBIENCE_OMEGA
	sound_environment = SOUND_AREA_OMEGA
	ambient_buzz = 'modularz_arkstation/modules/sounds-renewal/sound/ambience/church.ogg'

/area/omega/surface
	name = "Forest"
	icon_state = "explored"
	always_unpowered = TRUE
	power_environ = FALSE
	power_equip = FALSE
	power_light = FALSE
	requires_power = TRUE
	area_flags = UNIQUE_AREA | FLORA_ALLOWED | MOB_SPAWN_ALLOWED | CAVES_ALLOWED
	min_ambience_cooldown = 70 SECONDS
	max_ambience_cooldown = 220 SECONDS

/area/omega/surface/outdoors // parent that defines if something is on the exterior of the station.
	name = "Forest Wastes"
	outdoors = TRUE

/area/omega/surface/outdoors/nospawn // this is the area you use for stuff to not spawn, but if you still want weather.

/area/omega/surface/outdoors/nospawn/New() // unless you roll forested trait lol
	. = ..()
	if(HAS_TRAIT(SSstation, STATION_TRAIT_FORESTED))
		map_generator = /datum/map_generator/cave_generator/omega/surface/forested
		area_flags = MOB_SPAWN_ALLOWED | FLORA_ALLOWED//flip this on, the generator has already disabled dangerous fauna

/area/omega/surface/outdoors/noteleport // for places like the cursed spring water
	area_flags = UNIQUE_AREA | FLORA_ALLOWED | NOTELEPORT

/area/omega/surface/outdoors/noruins // when you want random generation without the chance of getting ruins
	icon_state = "noruins"
	area_flags = UNIQUE_AREA | FLORA_ALLOWED | MOB_SPAWN_ALLOWED | CAVES_ALLOWED
	map_generator = /datum/map_generator/cave_generator/omega/surface/noruins

/area/omega/surface/outdoors/labor_camp
	name = "Forest Labor Camp"
	area_flags = UNIQUE_AREA

/area/omega/surface/outdoors/unexplored //monsters and ruins spawn here
	icon_state = "unexplored"
	area_flags = UNIQUE_AREA | FLORA_ALLOWED | MOB_SPAWN_ALLOWED | CAVES_ALLOWED

/area/omega/surface/outdoors/unexplored/rivers // rivers spawn here
	icon_state = "danger"
	map_generator = /datum/map_generator/cave_generator/omega/surface

/area/omega/surface/outdoors/unexplored/rivers/New()
	. = ..()
	if(HAS_TRAIT(SSstation, STATION_TRAIT_FORESTED))
		map_generator = /datum/map_generator/cave_generator/omega/surface/forested
		area_flags |= MOB_SPAWN_ALLOWED //flip this on, the generator has already disabled dangerous fauna

/area/omega/surface/outdoors/unexplored/rivers/no_monsters
	area_flags = UNIQUE_AREA | FLORA_ALLOWED | CAVES_ALLOWED

/area/omega/underground
	name = "Forest Caves"
	outdoors = TRUE
	always_unpowered = TRUE
	requires_power = TRUE
	power_environ = FALSE
	power_equip = FALSE
	power_light = FALSE
	area_flags = UNIQUE_AREA | FLORA_ALLOWED
	min_ambience_cooldown = 70 SECONDS
	max_ambience_cooldown = 220 SECONDS

/area/omega/underground/unexplored // mobs and megafauna and ruins spawn here
	name = "Forest Caves"
	icon_state = "unexplored"
	area_flags = CAVES_ALLOWED | FLORA_ALLOWED | MOB_SPAWN_ALLOWED | MEGAFAUNA_SPAWN_ALLOWED

/area/omega/underground/unexplored/no_rivers
	icon_state = "norivers"
	area_flags = CAVES_ALLOWED | FLORA_ALLOWED // same rules as "shoreline" turfs since we might need this to pull double-duty
	map_generator = /datum/map_generator/cave_generator/omega

/area/omega/underground/unexplored/rivers // rivers spawn here
	icon_state = "danger"
	map_generator = /datum/map_generator/cave_generator/omega

/area/omega/underground/unexplored/rivers/deep
	map_generator = /datum/map_generator/cave_generator/omega/deep

/area/omega/underground/unexplored/rivers/deep/shoreline //use this for when you don't want mobs to spawn in certain areas in the "deep" portions. Think adjacent to rivers or station structures.
	icon_state = "shore"
	area_flags = UNIQUE_AREA | CAVES_ALLOWED | FLORA_ALLOWED

/area/omega/underground/explored // ruins can't spawn here
	name = "Forest Underground"
	area_flags = UNIQUE_AREA
	map_generator = /datum/map_generator/cave_generator/omega/deep
