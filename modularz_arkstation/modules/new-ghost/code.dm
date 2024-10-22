/datum/preference/choiced/ghost_form/icon_for(value)
	return icon('modularz_arkstation/modules/new-ghost/mob.dmi', value)

/datum/preference/choiced/ghost_form
	savefile_key = "ghost_form"
	savefile_identifier = PREFERENCE_PLAYER
	category = PREFERENCE_CATEGORY_GAME_PREFERENCES
	should_generate_icons = TRUE

	ghost_forms = list(
		"catghost" = "Cat",
		"ghost" = "Default",
		"ghost_black" = "Black",
		"ghost_blazeit" = "Blaze it",
		"ghost_blue" = "Blue",
		"ghost_camo" = "Camo",
		"ghost_cyan" = "Cyan",
		"ghost_dblue" = "Dark blue",
		"ghost_dcyan" = "Dark cyan",
		"ghost_dgreen" = "Dark green",
		"ghost_dpink" = "Dark pink",
		"ghost_dred" = "Dark red",
		"ghost_dyellow" = "Dark yellow",
		"ghost_fire" = "Fire",
		"ghost_funkypurp" = "Funky purple",
		"ghost_green" = "Green",
		"ghost_grey" = "Grey",
		"ghost_mellow" = "Mellow",
		"ghost_pink" = "Pink",
		"ghost_pinksherbert" = "Pink Sherbert",
		"ghost_purpleswirl" = "Purple Swirl",
		"ghost_rainbow" = "Rainbow",
		"ghost_red" = "Red",
		"ghost_yellow" = "Yellow",
		"ghostian2" = "Ian",
		"ghostking" = "King",
		"skeleghost" = "Skeleton",
		"vulpghost" = "Vulpkanine",
	)

/mob/dead/observer // Fuck this, LMAO
	icon = 'modularz_arkstation/modules/new-ghost/mob.dmi'
