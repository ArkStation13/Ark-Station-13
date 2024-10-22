/obj/item/clothing/glasses/hud/security
	icon = 'icons/obj/clothing/glasses.dmi'
	worn_icon = 'icons/mob/clothing/eyes.dmi'
	icon_state = "securityhud"
	glass_colour_type = /datum/client_colour/glass_colour/lightred

/obj/item/clothing/glasses/hud/security/sunglasses
	icon_state = "sunhudsec"
	glass_colour_type = /datum/client_colour/glass_colour/red
	uses_advanced_reskins = TRUE
	unique_reskin = list(
		"Dark-Tint Variant" = list(
			RESKIN_ICON = 'modular_nova/master_files/icons/obj/clothing/glasses.dmi',
			RESKIN_WORN_ICON = 'modular_nova/master_files/icons/mob/clothing/eyes.dmi',
			RESKIN_ICON_STATE = "security_hud_black",
			RESKIN_WORN_ICON_STATE = "security_hud_black"
		),
		"Light-Tint Variant" = list(
			RESKIN_ICON = 'modular_nova/master_files/icons/obj/clothing/glasses.dmi',
			RESKIN_WORN_ICON = 'modular_nova/master_files/icons/mob/clothing/eyes.dmi',
			RESKIN_ICON_STATE = "security_hud_blue",
			RESKIN_WORN_ICON_STATE = "security_hud_blue"
		),
	)

/obj/item/clothing/glasses/hud/security/sunglasses/eyepatch
	icon_state = "hudpatch"
	base_icon_state = "hudpatch"

/obj/item/clothing/glasses/hud/security/night
	icon_state = "securityhudnight"

// BALLISTIC GLASSES FOR EVERYONE //
// SECURITY
/obj/item/clothing/glasses/hud/security/sunglasses/ballistic
	name = "hud ballistic security glasses"
	desc = "Made from the same cheap plastic as regular glasses. Don't expect them to help you."
	icon = 'modularz_arkstation/modules/clothing-update/icons/sec_reskins/obj/obj.dmi'
	worn_icon = 'modularz_arkstation/modules/clothing-update/icons/sec_reskins/mob/mob.dmi'
	icon_state = "inteq_goggles_red"
	uses_advanced_reskins = TRUE
	unique_reskin = list(
		"Default" = list(
			RESKIN_ICON_STATE = "inteq_goggles_red",
			RESKIN_WORN_ICON_STATE = "inteq_goggles_red"
		),
		"Blue" = list(
			RESKIN_ICON_STATE = "inteq_goggles_blue",
			RESKIN_WORN_ICON_STATE = "inteq_goggles_blue"
		),
		"Black" = list(
			RESKIN_ICON_STATE = "inteq_goggles_black",
			RESKIN_WORN_ICON_STATE = "inteq_goggles_black"
		),
	)

/datum/crafting_recipe/ball_hudsunsec
	name = "Security HUD Ballistic glasses"
	result = /obj/item/clothing/glasses/hud/security/sunglasses/ballistic
	time = 2 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	reqs = list(/obj/item/clothing/glasses/hud/security/sunglasses = 1,
				/obj/item/clothing/glasses/ballistic = 1,
				/obj/item/stack/cable_coil = 5)
	category = CAT_EQUIPMENT

/datum/crafting_recipe/ball_hudsunsec_removal
	name = "Security HUD Ballistic glasses removal"
	result = /obj/item/clothing/glasses/ballistic
	time = 2 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	reqs = list(/obj/item/clothing/glasses/hud/security/sunglasses/ballistic = 1)
	category = CAT_EQUIPMENT

/obj/item/clothing/glasses/hud/security/sunglasses/ballistic/Initialize(mapload)
	. = ..()
	var/static/list/slapcraft_recipe_list = list(/datum/crafting_recipe/ball_hudsunsec_removal)

	AddElement(
		/datum/element/slapcrafting,\
		slapcraft_recipes = slapcraft_recipe_list,\
	)

// MESON
/obj/item/clothing/glasses/meson/ballistic
	name = "meson ballistic glasses"
	desc = "Made from the same cheap plastic as regular glasses. Don't expect them to help you."
	icon = 'modularz_arkstation/modules/clothing-update/icons/sec_reskins/obj/obj.dmi'
	worn_icon = 'modularz_arkstation/modules/clothing-update/icons/sec_reskins/mob/mob.dmi'
	icon_state = "inteq_goggles_green"

/datum/design/mesons_ballistic
	name = "Ballistic Optical Meson Scanners"
	desc = "Prototype meson scanners fitted with an extra sensor which amplifies the visible light spectrum and overlays it to the UHD display. Test."
	id = "mesons_ballistic"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SMALL_MATERIAL_AMOUNT*5, /datum/material/glass =SMALL_MATERIAL_AMOUNT*5)
	build_path = /obj/item/clothing/glasses/meson/ballistic
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_ENGINEERING
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING | DEPARTMENT_BITFLAG_CARGO

/datum/techweb_node/hud
	id = TECHWEB_NODE_HUD
	display_name = "Integrated HUDs"
	description = "Initially developed for assistants to learn the nuances of different professions through augmented reality."
	prereq_ids = list(TECHWEB_NODE_HOLOGRAPHICS, TECHWEB_NODE_CYBER_IMPLANTS)
	design_ids = list(
		"health_hud",
		"diagnostic_hud",
		"security_hud",
		"mod_visor_medhud",
		"mod_visor_diaghud",
		"mod_visor_sechud",
		"ci-medhud",
		"ci-diaghud",
		"ci-sechud",
		"mesons_ballistic",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_3_POINTS)

/datum/crafting_recipe/ball_hudsunmes
	name = "Meson HUD Ballistic glasses"
	result = /obj/item/clothing/glasses/meson/ballistic
	time = 2 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	reqs = list(/obj/item/clothing/glasses/meson = 1,
				/obj/item/clothing/glasses/ballistic = 1,
				/obj/item/stack/cable_coil = 5)
	category = CAT_EQUIPMENT

/datum/crafting_recipe/ball_hudsunmes_removal
	name = "Meson HUD Ballistic glasses removal"
	result = /obj/item/clothing/glasses/ballistic
	time = 2 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	reqs = list(/obj/item/clothing/glasses/meson/ballistic = 1)
	category = CAT_EQUIPMENT

/obj/item/clothing/glasses/meson/ballistic/Initialize(mapload)
	. = ..()
	var/static/list/slapcraft_recipe_list = list(/datum/crafting_recipe/ball_hudsunmes_removal)

	AddElement(
		/datum/element/slapcrafting,\
		slapcraft_recipes = slapcraft_recipe_list,\
	)


// SCIENCE
/obj/item/clothing/glasses/science/ballistic
	name = "science ballistic glasses"
	desc = "Made from the same cheap plastic as regular glasses. Don't expect them to help you."
	icon = 'modularz_arkstation/modules/clothing-update/icons/sec_reskins/obj/obj.dmi'
	worn_icon = 'modularz_arkstation/modules/clothing-update/icons/sec_reskins/mob/mob.dmi'
	icon_state = "inteq_goggles_purple"

/datum/crafting_recipe/ball_hudsunsci
	name = "Science HUD Ballistic glasses"
	result = /obj/item/clothing/glasses/science/ballistic
	time = 2 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	reqs = list(/obj/item/clothing/glasses/science = 1,
				/obj/item/clothing/glasses/ballistic = 1,
				/obj/item/stack/cable_coil = 5)
	category = CAT_EQUIPMENT

/datum/crafting_recipe/ball_hudsunsci_removal
	name = "Science HUD Ballistic glasses removal"
	result = /obj/item/clothing/glasses/ballistic
	time = 2 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	reqs = list(/obj/item/clothing/glasses/science/ballistic = 1)
	category = CAT_EQUIPMENT

/obj/item/clothing/glasses/science/ballistic/Initialize(mapload)
	. = ..()
	var/static/list/slapcraft_recipe_list = list(/datum/crafting_recipe/ball_hudsunsci_removal)

	AddElement(
		/datum/element/slapcrafting,\
		slapcraft_recipes = slapcraft_recipe_list,\
	)


// MEDICAL
/obj/item/clothing/glasses/hud/health/ballistic
	name = "health-check ballistic glasses"
	desc = "Made from the same cheap plastic as regular glasses. Don't expect them to help you."
	icon = 'modularz_arkstation/modules/clothing-update/icons/sec_reskins/obj/obj.dmi'
	worn_icon = 'modularz_arkstation/modules/clothing-update/icons/sec_reskins/mob/mob.dmi'
	icon_state = "inteq_goggles_medical"

/datum/crafting_recipe/ball_hudsunmed
	name = "Medical HUD Ballistic glasses"
	result = /obj/item/clothing/glasses/hud/health/ballistic
	time = 2 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	reqs = list(/obj/item/clothing/glasses/hud/health = 1,
				/obj/item/clothing/glasses/ballistic = 1,
				/obj/item/stack/cable_coil = 5)
	category = CAT_EQUIPMENT

/datum/crafting_recipe/ball_hudsunmed_removal
	name = "Medical HUD Ballistic glasses removal"
	result = /obj/item/clothing/glasses/ballistic
	time = 2 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	reqs = list(/obj/item/clothing/glasses/hud/health/ballistic = 1)
	category = CAT_EQUIPMENT

/obj/item/clothing/glasses/hud/health/ballistic/Initialize(mapload)
	. = ..()
	var/static/list/slapcraft_recipe_list = list(/datum/crafting_recipe/ball_hudsunmed_removal)

	AddElement(
		/datum/element/slapcrafting,\
		slapcraft_recipes = slapcraft_recipe_list,\
	)

// DIAGNOSTIC
/obj/item/clothing/glasses/hud/diagnostic/ballistic
	name = "diagnostic ballistic glasses"
	desc = "Made from the same cheap plastic as regular glasses. Don't expect them to help you."
	icon = 'modularz_arkstation/modules/clothing-update/icons/sec_reskins/obj/obj.dmi'
	worn_icon = 'modularz_arkstation/modules/clothing-update/icons/sec_reskins/mob/mob.dmi'
	icon_state = "inteq_goggles_diagnostic"

/datum/crafting_recipe/ball_hudsundig
	name = "Diagnostis HUD Ballistic glasses"
	result = /obj/item/clothing/glasses/hud/diagnostic/ballistic
	time = 2 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	reqs = list(/obj/item/clothing/glasses/hud/diagnostic = 1,
				/obj/item/clothing/glasses/ballistic = 1,
				/obj/item/stack/cable_coil = 5)
	category = CAT_EQUIPMENT

/datum/crafting_recipe/ball_hudsundig_removal
	name = "Diagnostic HUD Ballistic glasses removal"
	result = /obj/item/clothing/glasses/ballistic
	time = 2 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	reqs = list(/obj/item/clothing/glasses/hud/diagnostic/ballistic = 1)
	category = CAT_EQUIPMENT

/obj/item/clothing/glasses/hud/diagnostic/ballistic/Initialize(mapload)
	. = ..()
	var/static/list/slapcraft_recipe_list = list(/datum/crafting_recipe/ball_hudsundig_removal)

	AddElement(
		/datum/element/slapcrafting,\
		slapcraft_recipes = slapcraft_recipe_list,\
	)

// CIVIL
/obj/item/clothing/glasses/ballistic
	name = "ballistic glasses"
	desc = "Made from the same cheap plastic as regular glasses. Don't expect them to help you."
	icon = 'modularz_arkstation/modules/clothing-update/icons/sec_reskins/obj/obj.dmi'
	worn_icon = 'modularz_arkstation/modules/clothing-update/icons/sec_reskins/mob/mob.dmi'
	icon_state = "inteq_goggles_black"

