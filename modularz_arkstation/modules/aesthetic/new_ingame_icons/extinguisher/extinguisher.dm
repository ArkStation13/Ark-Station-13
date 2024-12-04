/obj/structure/extinguisher_cabinet
	icon = 'modularz_arkstation/modules/aesthetic/new_ingame_icons/extinguisher/extinguisher.dmi'
	icon_state = "extinguisher_standard_closed"

/obj/structure/extinguisher_cabinet/Initialize(mapload, ndir, building)
	. = ..()
	dir = REVERSE_DIR(dir)

/obj/item/wallframe/extinguisher_cabinet
	icon = 'modularz_arkstation/modules/aesthetic/new_ingame_icons/extinguisher/extinguisher.dmi'
