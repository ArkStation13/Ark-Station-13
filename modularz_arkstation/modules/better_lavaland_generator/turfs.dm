/turf/open/misc/grass/lavaland
	name = "ungodly grass"
	desc = "Common grass, tinged to unnatural colours by chemicals in the atmosphere."
	baseturfs = /turf/open/misc/grass/lavaland
	initial_gas_mix = LAVALAND_DEFAULT_ATMOS
	icon_state = "grass-255"
	base_icon_state = "grass"
	planetary_atmos = TRUE
	icon = 'modularz_arkstation/modules/better_lavaland_generator/lava_grass_red.dmi'
	smooth_icon = 'modularz_arkstation/modules/better_lavaland_generator/lava_grass_red.dmi'
	light_range = 0.1
	light_power = 0.1
	light_color = LIGHT_COLOR_FIRE
	gender = PLURAL

/turf/open/misc/grass/lavaland/orange
	icon = 'modularz_arkstation/modules/better_lavaland_generator/lava_grass_orange.dmi'
	smooth_icon = 'modularz_arkstation/modules/better_lavaland_generator/lava_grass_orange.dmi'
	baseturfs = /turf/open/misc/grass/lavaland/orange

/turf/open/misc/grass/lavaland/purple
	baseturfs = /turf/open/misc/grass/lavaland/purple
	icon = 'modularz_arkstation/modules/better_lavaland_generator/lava_grass_purple.dmi'
	smooth_icon = 'modularz_arkstation/modules/better_lavaland_generator/lava_grass_purple.dmi'

//
/turf/open/misc/asteroid/basalt/lava_land_surface/lit
	light_range = 0.3
	light_power = 0.4
	light_color = LIGHT_COLOR_FIRE

//
/turf/open/misc/asteroid/purple
	name = "ashen sand"
	desc = "Sand, tinted by the chemicals in the atmosphere to an uncanny shade of purple."
	icon = 'modularz_arkstation/modules/better_lavaland_generator/lavaland_purple.dmi'
	baseturfs = /turf/open/misc/asteroid/purple
	turf_type = /turf/open/misc/asteroid/basalt/purple
	initial_gas_mix = LAVALAND_DEFAULT_ATMOS
	planetary_atmos = TRUE

/turf/open/misc/asteroid/purple/lit
	light_range = 0.3
	light_power = 0.2
	light_color = LIGHT_COLOR_FIRE

//
/turf/open/misc/asteroid/basalt/purple
	icon = 'modularz_arkstation/modules/better_lavaland_generator/lavaland_purple.dmi'
	baseturfs = /turf/open/misc/asteroid/basalt/purple
	turf_type = /turf/open/misc/asteroid/basalt/purple
	initial_gas_mix = LAVALAND_DEFAULT_ATMOS
	planetary_atmos = TRUE

/turf/open/misc/asteroid/basalt/purple/lit
	light_range = 0.3
	light_power = 0.4
	light_color = LIGHT_COLOR_FIRE

//
/turf/open/floor/plating/moss
	name = "mossy carpet"
	desc = "When the forests burned away and the sky grew dark, the moss learned to feed on the falling ash."
	baseturfs = /turf/open/floor/plating/moss
	initial_gas_mix = LAVALAND_DEFAULT_ATMOS
	planetary_atmos = TRUE
	icon_state = "moss"
	icon = 'modularz_arkstation/modules/better_lavaland_generator/lava_moss.dmi'
	base_icon_state = "moss"
	bullet_bounce_sound = null
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_GRASS
	clawfootstep = FOOTSTEP_GRASS
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	layer = HIGH_TURF_LAYER
	gender = PLURAL
	light_power = 0.5
	light_range = 0.5
	pixel_x = -9
	pixel_y = -9
