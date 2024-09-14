/datum/map_generator/cave_generator/omega
	weighted_open_turf_types = list(/turf/open/misc/grass/jungle/planet = 1)
	initial_closed_chance = 40
	flora_spawn_chance = 80
	weighted_closed_turf_types = list(
		/turf/closed/mineral/random/forest = 50,
		//turf/closed/mineral/gibtonite/ice/icemoon = 4, // NOVA EDIT REMOVAL - Removes additional gibtonite call
	)


	weighted_mob_spawn_list = list(
		/mob/living/basic/mining/goldgrub = 10,
		/mob/living/basic/mining/legion = 10,
		/mob/living/basic/mining/wolf = 30,
		/mob/living/basic/bear/brown = 10,
	)
	weighted_flora_spawn_list = list(
		/obj/structure/flora/ash/cacti = 2,
		/obj/structure/flora/rock/style_random = 2,
		/obj/structure/flora/rock/pile/style_random = 2,
		/obj/structure/flora/tree/jungle/style_random = 20,
		/obj/structure/flora/bush/fullgrass/style_random = 50,
		/obj/structure/flora/bush/style_random = 25,
		/obj/structure/flora/bush/leavy/style_random = 25,
		/obj/structure/flora/bush/pale/style_random = 25,
		/obj/structure/flora/bush/grassy/style_random = 25,
		/obj/structure/flora/bush/ferny/style_random = 25,
	)
	///Note that this spawn list is also in the lavaland generator
	weighted_feature_spawn_list = list(
		/obj/structure/geyser/hollowwater = 10,
		/obj/structure/geyser/plasma_oxide = 10,
		/obj/structure/geyser/protozine = 10,
		/obj/structure/geyser/random = 2,
		/obj/structure/geyser/wittel = 10,
		/obj/structure/ore_vent = 1,
	)

/datum/map_generator/cave_generator/omega/surface
	weighted_open_turf_types = list(/turf/open/misc/grass/jungle/planet = 1)
	initial_closed_chance = 10

	flora_spawn_chance = 80
	weighted_flora_spawn_list = list(
		/obj/structure/flora/tree/jungle/style_random = 18,
		/obj/structure/flora/rock/style_random = 5,
		/obj/structure/flora/rock/pile/style_random = 5,
		/obj/structure/flora/bush/fullgrass/style_random = 50,
		/obj/structure/flora/bush/style_random = 25,
		/obj/structure/flora/bush/leavy/style_random = 25,
		/obj/structure/flora/bush/pale/style_random = 25,
		/obj/structure/flora/bush/grassy/style_random = 25,
		/obj/structure/flora/bush/ferny/style_random = 25,
		/obj/structure/flora/ash = 2,
	)

	mob_spawn_chance = 0.2
	weighted_mob_spawn_list = list(/mob/living/basic/deer = 99, /mob/living/basic/bear/brown = 1)

/// Surface snow generator variant for forested station trait, WITH FORESTSSSS
/datum/map_generator/cave_generator/omega/surface/forested
	weighted_open_turf_types = list(/turf/open/misc/grass/jungle/planet = 1)
	initial_closed_chance = 10

	flora_spawn_chance = 80
	weighted_flora_spawn_list = list(
		/obj/structure/flora/tree/jungle/style_random = 18,
		/obj/structure/flora/rock/style_random = 1,
		/obj/structure/flora/rock/pile/style_random = 3,
		/obj/structure/flora/bush/fullgrass/style_random = 50,
		/obj/structure/flora/bush/style_random = 25,
		/obj/structure/flora/bush/leavy/style_random = 25,
		/obj/structure/flora/bush/pale/style_random = 25,
		/obj/structure/flora/bush/grassy/style_random = 25,
		/obj/structure/flora/bush/ferny/style_random = 25,
		/obj/structure/flora/ash/chilly = 1,
	)

	mob_spawn_chance = 0.2
	weighted_mob_spawn_list = list(/mob/living/basic/deer = 99, /mob/living/basic/bear/brown = 1)

/datum/map_generator/cave_generator/omega/surface/noruins //use this for when you don't want ruins to spawn in a certain area

/datum/map_generator/cave_generator/omega/deep
	weighted_closed_turf_types = list(/turf/open/misc/grass/jungle/planet = 1)
	initial_closed_chance = 40
	flora_spawn_chance = 60
	weighted_closed_turf_types = list(
		/turf/closed/mineral/random/forest = 50,
	)
	weighted_mob_spawn_list = list(
		SPAWN_MEGAFAUNA = 1,
		/mob/living/basic/mining/goliath = 100,
		/mob/living/basic/mining/bileworm = 60,
		/mob/living/basic/mining/legion = 100,
		/obj/structure/spawner/lavaland/goliath = 6,
		/obj/structure/spawner/lavaland = 6,
		/obj/structure/spawner/lavaland/legion = 6,
		/mob/living/basic/bear/brown = 20,
	)
	weighted_megafauna_spawn_list = list(/mob/living/simple_animal/hostile/megafauna/colossus = 1)
	weighted_flora_spawn_list = list(
		/obj/structure/flora/rock/style_random = 6,
		/obj/structure/flora/rock/pile/style_random = 6,
		/obj/structure/flora/ash = 3,
		/obj/structure/flora/tree/jungle/style_random = 10,
		/obj/structure/flora/bush/fullgrass/style_random = 18,
	)

/mob/living/basic/bear/brown
	name = "brown bear"
	icon_state = "brownbear"
	icon_living = "brownbear"
	icon_dead = "brownbear_dead"
	desc = "It's a brown bear."

/turf/open/openspace/icemoon/keep_below/forest
	initial_gas_mix = OPENTURF_DEFAULT_ATMOS

/turf/closed/mineral/random/forest
	initial_gas_mix = OPENTURF_DEFAULT_ATMOS
	baseturfs = /turf/open/misc/asteroid/forest

/turf/open/misc/asteroid/forest
	initial_gas_mix = OPENTURF_DEFAULT_ATMOS
