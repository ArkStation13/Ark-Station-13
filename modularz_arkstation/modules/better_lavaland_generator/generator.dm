/datum/map_generator/cave_generator/lavaland
	// values near 0.5 look bad due to the behavior of naive perlin noise
	// so this was bumped down a little below 0.5
	perlin_zoom = 65

	possible_biomes = list(
		BIOME_LOW_HEAT = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/lavaland/forest,
			BIOME_LOW_HUMIDITY = /datum/biome/lavaland/plains/dense/mixed,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/lavaland/forest/rocky,
			BIOME_HIGH_HUMIDITY = /datum/biome/lavaland/outback,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/lavaland/plains/dense
		),
		BIOME_LOWMEDIUM_HEAT = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/lavaland/plains,
			BIOME_LOW_HUMIDITY = /datum/biome/lavaland/outback,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/lavaland/plains/dense,
			BIOME_HIGH_HUMIDITY = /datum/biome/lavaland/plains/dense/mixed,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/lavaland/outback
		),
		BIOME_MEDIUM_HEAT = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/lavaland,
			BIOME_LOW_HUMIDITY = /datum/biome/cave/lavaland/rocky,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/lavaland/forest,
			BIOME_HIGH_HUMIDITY = /datum/biome/lavaland/lush,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/lavaland/lava
		),
		BIOME_HIGHMEDIUM_HEAT = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/lavaland/plains/dense/mixed,
			BIOME_LOW_HUMIDITY = /datum/biome/lavaland/forest,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/cave/lavaland/mossy,
			BIOME_HIGH_HUMIDITY = /datum/biome/lavaland,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/lavaland/lava
		),
		BIOME_HIGH_HEAT = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/lavaland/outback,
			BIOME_LOW_HUMIDITY = /datum/biome/lavaland,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/lavaland/plains/dense/mixed,
			BIOME_HIGH_HUMIDITY = /datum/biome/cave/lavaland,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/cave/lavaland/lava
		),
	)

/datum/biome/lavaland
	turf_type = /turf/open/misc/asteroid/basalt/lava_land_surface/lit
	flora_density = 1
	flora_types = list(
		/obj/structure/flora/bush/flowers_yw/hell = 10,
		/obj/structure/flora/bush/sparsegrass/hell = 40,
		/obj/structure/flora/ash/fern = 5,
		/obj/structure/flora/ash/fireblossom = 1,
		/obj/structure/flora/ash/puce = 5,
	)
	feature_density = 0.3
	feature_types = list(
		/obj/structure/flora/rock = 20,
		/obj/structure/elite_tumor = 4,
		/obj/structure/geyser/random = 4,
		/obj/structure/flora/rock = 14,
		/obj/structure/elite_tumor = 2,
		/obj/structure/geyser/random = 2,
	)
	fauna_density = 4
	fauna_types = list(
		SPAWN_MEGAFAUNA = 2, // Не работает
		/mob/living/simple_animal/hostile/megafauna/bubblegum = 1, // Костыль
		/mob/living/simple_animal/hostile/megafauna/colossus = 2, // Костыль
		/mob/living/simple_animal/hostile/megafauna/dragon = 2, // Костыль
		/obj/effect/spawner/random/lavaland_mob/goliath = 50,
		/obj/effect/spawner/random/lavaland_mob/legion = 30,
		/obj/effect/spawner/random/lavaland_mob/watcher = 40,
		/mob/living/basic/mining/bileworm = 20,
		/mob/living/basic/mining/brimdemon = 20,
		/mob/living/basic/mining/lobstrosity/lava = 20,
		/obj/effect/spawner/random/lavaland_mob/raptor = 15,
		/mob/living/basic/mining/goldgrub = 10,
		/obj/structure/spawner/lavaland = 2,
		/obj/structure/spawner/lavaland/goliath = 3,
		/obj/structure/spawner/lavaland/legion = 3,
	)

/datum/biome/lavaland/forest
	turf_type = /turf/open/misc/asteroid/purple/lit
	flora_types = list(
		/obj/structure/flora/tree/dead/tall/grey = 1,
		/obj/structure/flora/tree/dead/barren = 1,
		/obj/structure/flora/bush/fullgrass/hell = 10,
		/obj/structure/flora/bush/sparsegrass/hell = 5
	)
	flora_density = 85

/datum/biome/lavaland/forest/rocky
	flora_types = list(
		/obj/structure/flora/rock/pile = 3,
		/obj/structure/flora/rock = 2,
		/obj/structure/flora/tree/dead/tall/grey = 10,
		/obj/structure/flora/bush/fullgrass/hell = 40,
		/obj/structure/flora/bush/sparsegrass/hell = 20,
		/obj/structure/flora/bush/flowers_yw/hell = 2
	)
	flora_density = 65

/datum/biome/lavaland/plains
	turf_type = /turf/open/misc/grass/lavaland/purple

	flora_types = list(
		/obj/structure/flora/bush/fullgrass/hell = 50,
		/obj/structure/flora/bush/sparsegrass/hell = 35,
		/obj/structure/flora/bush/flowers_yw/hell = 1,
		/obj/structure/flora/firebush = 1
	)
	flora_density = 15

/datum/biome/lavaland/plains/dense
	flora_density = 85
	turf_type = /turf/open/misc/grass/lavaland
	feature_density = 5
	feature_types = list(
		/obj/structure/flora/tree/dead/barren = 50,
		/obj/structure/flora/tree/dead/tall/grey = 45,
	)

/datum/biome/lavaland/plains/dense/mixed
	flora_density = 50
	turf_type = /turf/open/misc/grass/lavaland

/datum/biome/lavaland/outback
	turf_type = /turf/open/misc/grass/lavaland/orange

	flora_types = list(
		/obj/structure/flora/bush/genericbush/hell = 10,
		/obj/structure/flora/bush/sparsegrass/hell = 3,
		/obj/structure/flora/tree/dead/hell = 3,
		/obj/structure/flora/rock = 2
	)
	flora_density = 30

/datum/biome/lavaland/lush
	turf_type = /turf/open/misc/grass/lavaland/purple
	flora_types = list(
		/obj/structure/flora/ash/fireblossom = 3,
		/obj/structure/flora/tree/dead/hell = 1,
		/obj/structure/flora/bush/fullgrass/hell = 10,
		/obj/structure/flora/bush/sparsegrass/hell = 8,
		/obj/structure/flora/bush/fernybush/hell = 5,
		/obj/structure/flora/bush/genericbush/hell = 5,
		/obj/structure/flora/bush/flowers_yw/hell = 7,
		/obj/structure/flora/firebush = 3
	)
	flora_density = 30

/datum/biome/lavaland/lava
	turf_type = /turf/open/lava/smooth/lava_land_surface
	flora_types = list(
		/obj/structure/flora/rock = 1,
		/obj/structure/flora/rock/pile = 1
	)
	flora_density = 2
	feature_density = 0

/datum/biome/lavaland/lava/rocky
	flora_density = 4

/datum/biome/cave/lavaland
	turf_type = /turf/open/misc/asteroid/basalt/lava_land_surface
	// weighted_closed_turf_types = list(
	// 	/turf/closed/mineral/random/volcanic = 1
	// )
	fauna_density = 4
	fauna_types = list(
		SPAWN_MEGAFAUNA = 2, // Не работает
		/mob/living/simple_animal/hostile/megafauna/bubblegum = 1, // Костыль
		/mob/living/simple_animal/hostile/megafauna/colossus = 2, // Костыль
		/mob/living/simple_animal/hostile/megafauna/dragon = 2, // Костыль
		/obj/effect/spawner/random/lavaland_mob/goliath = 50,
		/obj/effect/spawner/random/lavaland_mob/legion = 30,
		/obj/effect/spawner/random/lavaland_mob/watcher = 40,
		/mob/living/basic/mining/bileworm = 20,
		/mob/living/basic/mining/brimdemon = 20,
		/mob/living/basic/mining/lobstrosity/lava = 20,
		/obj/effect/spawner/random/lavaland_mob/raptor = 15,
		/mob/living/basic/mining/goldgrub = 10,
		/obj/structure/spawner/lavaland = 2,
		/obj/structure/spawner/lavaland/goliath = 3,
		/obj/structure/spawner/lavaland/legion = 3,
	)
	flora_density = 1
	flora_types = list(
		/obj/structure/flora/ash/leaf_shroom = 1,
		/obj/structure/flora/ash/cap_shroom = 2,
		/obj/structure/flora/ash/stem_shroom = 2,
		/obj/structure/flora/ash/cacti = 1,
		/obj/structure/flora/ash/tall_shroom = 2,
		/obj/structure/flora/ash/fern = 2,
		/obj/structure/flora/ash/puce = 2,
	)

/datum/biome/cave/lavaland/rocky
	turf_type = /turf/open/misc/asteroid/purple
	flora_types = list(
		/obj/structure/flora/rock/pile = 3,
		/obj/structure/flora/rock = 3,
	)
	flora_density = 5

/datum/biome/cave/lavaland/mossy
	turf_type = /turf/open/floor/plating/moss
	flora_density = 80
	flora_types = list(
		/obj/structure/flora/bush/fullgrass/hell = 10,
		/obj/structure/flora/bush/sparsegrass/hell = 5,
		/obj/structure/flora/ash/leaf_shroom = 1,
		/obj/structure/flora/ash/cap_shroom = 2,
		/obj/structure/flora/ash/stem_shroom = 2,
		/obj/structure/flora/ash/cacti = 1,
		/obj/structure/flora/ash/tall_shroom = 2
	)

/datum/biome/cave/lavaland/lava
	turf_type = /turf/open/lava/smooth/lava_land_surface
	feature_density = 1
	feature_types = list(/obj/structure/flora/rock/pile = 1)
