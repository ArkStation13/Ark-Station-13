// Временно убираем.
// /obj/structure/window/fulltile
// 	canSmoothWith = SMOOTH_GROUP_WINDOW_FULLTILE + SMOOTH_GROUP_WALLS

// /obj/structure/window/plasma/fulltile
// 	smoothing_flags = SMOOTH_BITMASK
// 	smoothing_groups = SMOOTH_GROUP_WINDOW_FULLTILE
// 	canSmoothWith = SMOOTH_GROUP_WINDOW_FULLTILE + SMOOTH_GROUP_WALLS

// /obj/structure/window/reinforced/plasma/fulltile
// 	smoothing_flags = SMOOTH_BITMASK
// 	smoothing_groups = SMOOTH_GROUP_WINDOW_FULLTILE
// 	canSmoothWith = SMOOTH_GROUP_WINDOW_FULLTILE + SMOOTH_GROUP_WALLS

// /obj/structure/window/reinforced/fulltile
// 	smoothing_flags = SMOOTH_BITMASK
// 	smoothing_groups = SMOOTH_GROUP_WINDOW_FULLTILE
// 	canSmoothWith = SMOOTH_GROUP_WINDOW_FULLTILE + SMOOTH_GROUP_WALLS

// /obj/structure/window/reinforced/tinted/fulltile
// 	smoothing_flags = SMOOTH_BITMASK
// 	smoothing_groups = SMOOTH_GROUP_WINDOW_FULLTILE
// 	canSmoothWith = SMOOTH_GROUP_WINDOW_FULLTILE + SMOOTH_GROUP_WALLS

/obj/structure/window/reinforced/shuttle
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = SMOOTH_GROUP_SHUTTLE_PARTS + SMOOTH_GROUP_WINDOW_FULLTILE_SHUTTLE
	canSmoothWith = SMOOTH_GROUP_WINDOW_FULLTILE_SHUTTLE + SMOOTH_GROUP_WALLS

/obj/structure/window/reinforced/plasma/plastitanium
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = SMOOTH_GROUP_SHUTTLE_PARTS + SMOOTH_GROUP_WINDOW_FULLTILE_PLASTITANIUM
	canSmoothWith = SMOOTH_GROUP_SHUTTLE_PARTS + SMOOTH_GROUP_AIRLOCK + SMOOTH_GROUP_WINDOW_FULLTILE_PLASTITANIUM + SMOOTH_GROUP_PLASTITANIUM_WALLS + SMOOTH_GROUP_SYNDICATE_WALLS

// /obj/structure/window/bronze/fulltile
// 	smoothing_flags = SMOOTH_BITMASK
// 	smoothing_groups = SMOOTH_GROUP_WINDOW_FULLTILE_BRONZE + SMOOTH_GROUP_WINDOW_FULLTILE
// 	canSmoothWith = SMOOTH_GROUP_WINDOW_FULLTILE_BRONZE

// /turf/closed/indestructible/fakeglass
// 	smoothing_flags = SMOOTH_BITMASK
// 	smoothing_groups = SMOOTH_GROUP_WINDOW_FULLTILE
// 	canSmoothWith = SMOOTH_GROUP_WINDOW_FULLTILE + SMOOTH_GROUP_WALLS

// /turf/closed/indestructible/opsglass
// 	smoothing_flags = SMOOTH_BITMASK
// 	smoothing_groups = SMOOTH_GROUP_SHUTTLE_PARTS + SMOOTH_GROUP_WINDOW_FULLTILE_PLASTITANIUM
// 	canSmoothWith = SMOOTH_GROUP_WINDOW_FULLTILE_PLASTITANIUM

/obj/structure/window/reinforced/shuttle/spaceship
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = SMOOTH_GROUP_SHUTTLE_PARTS + SMOOTH_GROUP_WINDOW_FULLTILE_SHUTTLE + SMOOTH_GROUP_SHIPWALLS
	canSmoothWith = SMOOTH_GROUP_WINDOW_FULLTILE_SHUTTLE + SMOOTH_GROUP_WALLS
