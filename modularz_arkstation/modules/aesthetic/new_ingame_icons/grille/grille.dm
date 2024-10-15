/obj/structure/grille
	desc = "A flimsy framework of iron rods."
	name = "grille"
	icon = 'modularz_arkstation/modules/aesthetic/new_ingame_icons/grille/grille.dmi'
	icon_state = "grille-0"
	base_icon_state = "grille"
	color = "#545454"
	density = TRUE
	anchored = TRUE
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = SMOOTH_GROUP_GRILLE
	canSmoothWith = SMOOTH_GROUP_WALLS + SMOOTH_GROUP_WINDOW_FULLTILE + SMOOTH_GROUP_GRILLE + SMOOTH_GROUP_AIRLOCK

/obj/structure/grille/Initialize(mapload)
	. = ..()
	update_appearance()

/obj/structure/grille/update_icon_state()
	. = ..()
	if(broken)
		icon_state = "brokengrille"

/obj/structure/grille/set_smoothed_icon_state(new_junction)
	if(broken)
		return
	return ..()
