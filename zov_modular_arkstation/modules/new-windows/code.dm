// Smooth Change
/obj/structure/window/fulltile
	canSmoothWith = SMOOTH_GROUP_AIRLOCK + SMOOTH_GROUP_WINDOW_FULLTILE + SMOOTH_GROUP_WALLS

/obj/structure/window/reinforced
	canSmoothWith = SMOOTH_GROUP_AIRLOCK + SMOOTH_GROUP_WINDOW_FULLTILE + SMOOTH_GROUP_WALLS

/obj/structure/window/plasma
	canSmoothWith = SMOOTH_GROUP_AIRLOCK + SMOOTH_GROUP_WINDOW_FULLTILE + SMOOTH_GROUP_WALLS

// New-Old Icons (Ark Style)
/obj/structure/window/fulltile/old
	icon = 'zov_modular_arkstation/modules/new-windows/window.dmi'

/obj/structure/window/reinforced/fulltile/old
	icon = 'zov_modular_arkstation/modules/new-windows/r_window.dmi'

/obj/structure/window/reinforced/tinted/fulltile/old
	icon = 'zov_modular_arkstation/modules/new-windows/r_window_tined.dmi'
	icon_state = "reinforced_window-0"
	base_icon_state = "reinforced_window"

/obj/structure/window/plasma/fulltile/old
	icon = 'zov_modular_arkstation/modules/new-windows/window_plasma.dmi'
	icon_state = "window-0"
	base_icon_state = "window"

/obj/structure/window/reinforced/plasma/fulltile/old
	icon = 'zov_modular_arkstation/modules/new-windows/r_window_plasma.dmi'
	icon_state = "reinforced_window-0"
	base_icon_state = "reinforced_window"

// Spawners
/obj/effect/spawner/structure/window/old
	spawn_list = list(/obj/structure/grille, /obj/structure/window/fulltile/old)

/obj/effect/spawner/structure/window/reinforced/old
	spawn_list = list(/obj/structure/grille, /obj/structure/window/reinforced/fulltile/old)

/obj/effect/spawner/structure/window/reinforced/tinted/old
	spawn_list = list(/obj/structure/grille, /obj/structure/window/reinforced/tinted/old)

/obj/effect/spawner/structure/window/plasma/old
	spawn_list = list(/obj/structure/grille, /obj/structure/window/plasma/fulltile/old)

/obj/effect/spawner/structure/window/reinforced/plasma/old
	spawn_list = list(/obj/structure/grille, /obj/structure/window/reinforced/plasma/fulltile/old)
