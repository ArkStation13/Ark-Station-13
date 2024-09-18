// Smooth Change
/turf/closed/wall
	canSmoothWith = SMOOTH_GROUP_AIRLOCK + SMOOTH_GROUP_WINDOW_FULLTILE + SMOOTH_GROUP_WALLS

// New Icons (Shiptest Style)
/turf/closed/wall
	icon = 'modularz_arkstation/modules/new-walls/walls/wall.dmi'
	icon_state = "wall-0"
	base_icon_state = "wall"

/turf/closed/wall/r_wall
	icon = 'modularz_arkstation/modules/new-walls/walls/rwalls/reinforced_wall.dmi'
	icon_state = "reinforced_wall-0"
	base_icon_state = "reinforced_wall"

/turf/closed/wall/rust
	icon = 'modularz_arkstation/modules/new-walls/walls/rusty_wall.dmi'
	icon_state = "rusty_wall-0"
	base_icon_state = "rusty_wall"

/turf/closed/wall/r_wall/rust
	icon = 'modularz_arkstation/modules/new-walls/walls/rusty_reinforced_wall.dmi'
	icon_state = "rusty_reinforced_wall-0"
	base_icon_state = "rusty_reinforced_wall"
	base_decon_state = "r_wall"

/turf/closed/wall/material
	icon = 'modularz_arkstation/modules/new-walls/walls/materialwall.dmi'
	icon_state = "materialwall-0"
	base_icon_state = "materialwall"

/turf/closed/wall/mineral/titanium/survival
	icon = 'modularz_arkstation/modules/new-walls/walls/survival_pod_walls.dmi'

/turf/closed/wall/mineral/titanium/survival/nodiagonal
	icon = 'modularz_arkstation/modules/new-walls/walls/survival_pod_walls.dmi'

/turf/closed/wall/mineral/titanium/spaceship
	icon = 'modularz_arkstation/modules/new-walls/walls/plastitanium_wall.dmi'
	icon_state = "plastitanium_wall-0"
	base_icon_state = "plastitanium_wall"

/turf/closed/wall/mineral/titanium/spaceship/nodiagonal

/turf/closed/wall/mineral/plastitanium
	icon = 'modularz_arkstation/modules/new-walls/walls/plastitanium_wall.dmi'

/turf/closed/wall/mineral/plastitanium/nodiagonal
	icon = 'modularz_arkstation/modules/new-walls/walls/plastitanium_wall.dmi'

/turf/closed/wall/mineral/iron
	icon = 'modularz_arkstation/modules/new-walls/walls/iron_wall.dmi'

/turf/closed/wall/mineral/titanium
	icon = 'modularz_arkstation/modules/new-walls/walls/shuttle_wall.dmi'

/turf/closed/wall/mineral/titanium/nodiagonal
	icon = 'modularz_arkstation/modules/new-walls/walls/shuttle_wall.dmi'

/turf/closed/wall/mineral/wood
	icon = 'modularz_arkstation/modules/new-walls/walls/wood_wall.dmi'

/turf/closed/wall/mineral/sandstone
	icon = 'modularz_arkstation/modules/new-walls/walls/sandstone_wall.dmi'

/turf/closed/indestructible/riveted/boss
	icon = 'modularz_arkstation/modules/new-walls/walls/boss_wall.dmi'

/turf/closed/wall/mineral/stone
	icon = 'modularz_arkstation/modules/new-walls/walls/iron_wall.dmi'
	icon_state = "iron_wall-0"
	base_icon_state = "iron_wall"

/turf/closed/mineral
	icon = MAP_SWITCH('modularz_arkstation/modules/new-walls/walls/smoothrocks.dmi', 'icons/turf/mining.dmi')

/turf/closed/mineral/strange_rock/volcanic
	icon = MAP_SWITCH('modularz_arkstation/modules/new-walls/walls/smoothrocks.dmi', 'modular_nova/modules/xenoarch/icons/mining.dmi')

/turf/closed/mineral/snowmountain
	icon = MAP_SWITCH('modularz_arkstation/modules/new-walls/walls/mountain_wall.dmi', 'icons/turf/mining.dmi')

/turf/closed/mineral/random/snow
	icon = MAP_SWITCH('modularz_arkstation/modules/new-walls/walls/mountain_wall.dmi', 'icons/turf/mining.dmi')

/turf/closed/mineral/random/labormineral/ice
	icon = MAP_SWITCH('modularz_arkstation/modules/new-walls/walls/mountain_wall.dmi', 'icons/turf/mining.dmi')

/turf/closed/mineral/snowmountain/cavern
	icon = MAP_SWITCH('modularz_arkstation/modules/new-walls/walls/icerock_wall.dmi', 'icons/turf/mining.dmi')

/turf/closed/mineral/random/snow
	icon = MAP_SWITCH('modularz_arkstation/modules/new-walls/walls/icerock_wall.dmi', 'icons/turf/mining.dmi')

/turf/closed/mineral/asteroid
	icon = MAP_SWITCH('modularz_arkstation/modules/new-walls/walls/red_wall.dmi', 'icons/turf/mining.dmi')

/turf/closed/mineral/random/stationside/asteroid
	icon = MAP_SWITCH('modularz_arkstation/modules/new-walls/walls/red_wall.dmi', 'icons/turf/mining.dmi')

// New-Old Icons (Ark Style)
/turf/closed/wall/old
	icon = 'modularz_arkstation/modules/new-walls/walls.dmi'

/turf/closed/wall/r_wall/old
	icon = 'modularz_arkstation/modules/new-walls/r_walls.dmi'

/turf/closed/wall/rust/old
	icon = 'modularz_arkstation/modules/new-walls/walls.dmi'
	icon_state = "wall-0"
	base_icon_state = "wall"

/turf/closed/wall/r_wall/rust/old
	icon = 'modularz_arkstation/modules/new-walls/r_walls.dmi'
	icon_state = "reinforced_wall-0"
	base_icon_state = "reinforced_wall"
	base_decon_state = "r_wall"

/turf/closed/wall/material/old
	icon = 'modularz_arkstation/modules/new-walls/material_wall.dmi'
	icon_state = "wall-0"
	base_icon_state = "wall"

// False Walls
/obj/structure/falsewall/old
	icon = 'modularz_arkstation/modules/new-walls/walls.dmi'
	fake_icon = 'modularz_arkstation/modules/new-walls/walls.dmi'

/obj/structure/falsewall/reinforced/old
	name = "reinforced wall"
	desc = "A huge chunk of reinforced metal used to separate rooms."
	icon = 'modularz_arkstation/modules/new-walls/r_walls.dmi'
	fake_icon = 'modularz_arkstation/modules/new-walls/r_walls.dmi'

/obj/structure/falsewall/material/old
	icon = 'modularz_arkstation/modules/new-walls/material_wall.dmi'
	icon_state = "wall-open"
	base_icon_state = "wall"
	fake_icon = 'modularz_arkstation/modules/new-walls/material_wall.dmi'

// // TG false walls, overridden back to the TG file because we overrode the base falsewall with our aesthetic icon. New ones from TG will have to be added here.
// // Yes, this is dumb
// /obj/structure/falsewall/uranium
// 	icon = 'icons/turf/walls/false_walls.dmi'

// /obj/structure/falsewall/gold
// 	icon = 'icons/turf/walls/false_walls.dmi'

// /obj/structure/falsewall/silver
// 	icon = 'icons/turf/walls/false_walls.dmi'

// /obj/structure/falsewall/diamond
// 	icon = 'icons/turf/walls/false_walls.dmi'

// /obj/structure/falsewall/plasma
// 	icon = 'icons/turf/walls/false_walls.dmi'

// /obj/structure/falsewall/bananium
// 	icon = 'icons/turf/walls/false_walls.dmi'

// /obj/structure/falsewall/sandstone
// 	icon = 'icons/turf/walls/false_walls.dmi'

// /obj/structure/falsewall/wood
// 	icon = 'icons/turf/walls/false_walls.dmi'

// /obj/structure/falsewall/bamboo
// 	icon = 'icons/turf/walls/false_walls.dmi'

// /obj/structure/falsewall/iron
// 	icon = 'icons/turf/walls/false_walls.dmi'

// /obj/structure/falsewall/abductor
// 	icon = 'icons/turf/walls/false_walls.dmi'

// /obj/structure/falsewall/titanium
// 	icon = 'icons/turf/walls/false_walls.dmi'

// /obj/structure/falsewall/plastitanium
// 	icon = 'icons/turf/walls/false_walls.dmi'
