// Budget
/datum/config_entry/number/omega_budget
	default = 90
	integer = FALSE
	min_val = 0

// Spawn System
/datum/controller/subsystem/mapping/setup_ruins()
	..()
	var/list/omega_ruins = levels_by_trait(ZTRAIT_OMEGA_RUINS)
	if (omega_ruins.len)
		// needs to be whitelisted for underground too so place_below ruins work
		seedRuins(omega_ruins, CONFIG_GET(number/omega_budget), list(/area/omega/surface/outdoors/unexplored, /area/omega/underground/unexplored), themed_ruins[ZTRAIT_OMEGA_RUINS], clear_below = TRUE, mineral_budget = 4, mineral_budget_update = OREGEN_PRESET_TRIPLE_Z)

	var/list/omega_ruins_underground = levels_by_trait(ZTRAIT_OMEGA_RUINS_UNDERGROUND)
	if (omega_ruins_underground.len)
		seedRuins(omega_ruins_underground, CONFIG_GET(number/omega_budget), list(/area/omega/underground/unexplored), themed_ruins[ZTRAIT_OMEGA_RUINS_UNDERGROUND], clear_below = TRUE, mineral_budget = 21)

// Ruins
// Hey! Listen! Update \config\omegaruinblacklist.txt with your new ruins!

/datum/map_template/ruin/omega
	prefix = "_maps/ark_map_files/OmegaRuins/"
	allow_duplicates = FALSE
	cost = 5
	ruin_type = ZTRAIT_OMEGA_RUINS
	default_area = /area/omega/surface/outdoors/unexplored
	has_ceiling = TRUE
	ceiling_turf = /turf/closed/mineral/random/forest
	ceiling_baseturfs = list(/turf/open/misc/grass/jungle/planet)

/*----- Surface -----*/
/datum/map_template/ruin/omega/gas
	name = "Omega-Ruin Lizard Gas Station"
	id = "omega_lizgasruin"
	description = "A gas station. It appears to have been recently open and is in mint condition."
	suffix = "omega_surface_gas.dmm"

/datum/map_template/ruin/omega/lust
	name = "Omega-Ruin Ruin of Lust"
	id = "omega_lust"
	description = "Not exactly what you expected."
	suffix = "omega_surface_lust.dmm"

/datum/map_template/ruin/omega/pizza
	name = "Omega-Ruin Moffuchi's Pizzeria"
	id = "omega_pizzeria"
	description = "Moffuchi's Family Pizzeria chain has a reputation for providing affordable artisanal meals of questionable edibility. This particular pizzeria seems to have been abandoned for some time."
	suffix = "omega_surface_pizza.dmm"

/datum/map_template/ruin/omega/frozen_phonebooth
	name = "Omega-Ruin Phonebooth"
	id = "omega_frozen_phonebooth"
	description = "A venture by nanotrasen to help popularize the use of holopads. This one was sent to a omega."
	suffix = "omega_surface_phonebooth.dmm"

/datum/map_template/ruin/omega/smoking_room
	name = "Omega-Ruin Smoking Room"
	id = "omega_smoking_room"
	description = "Here lies Charles Morlbaro. He died the way he lived."
	suffix = "omega_surface_smoking_room.dmm"

/datum/map_template/ruin/omega/ore_vent
	name = "Omega-Ruin Ore Vent"
	id = "omega_ore_vent"
	description = "Ore Vent."
	suffix = "omega_surface_ore_vent.dmm"

/*----- Underground -----*/
/datum/map_template/ruin/omega/underground/nova/mining_site_below
	name = "Omega-ruin Mining Site Underground"
	id = "omega_miningsite-underground"
	description = "The Iceminer arena."
	prefix = "_maps/RandomRuins/IceRuins/nova/"
	suffix = "omega_underground_mining_site.dmm"
	always_place = TRUE
