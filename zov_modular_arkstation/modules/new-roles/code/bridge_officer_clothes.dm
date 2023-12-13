/obj/item/clothing/head/bridge_officer_beret
	name = "bridge officer beret"
	icon = 'zov_modular_arkstation/modules/new-roles/icons/obj/head.dmi'
	worn_icon = 'zov_modular_arkstation/modules/new-roles/icons/mob/head.dmi'
	icon_state = "beret_bridgesec"
	inhand_icon_state = null
	supports_variations_flags = CLOTHING_SNOUTED_VARIATION_NO_NEW_ICON
	desc = "A generic blue beret for the background officer"

/obj/item/clothing/head/bridge_officer_cap
	name = "bridge officer cap"
	icon = 'zov_modular_arkstation/modules/new-roles/icons/obj/head.dmi'
	worn_icon = 'zov_modular_arkstation/modules/new-roles/icons/mob/head.dmi'
	icon_state = "bridgeseccap"
	inhand_icon_state = null
	supports_variations_flags = CLOTHING_SNOUTED_VARIATION_NO_NEW_ICON
	desc = "A generic blue cap for the background officer"

/obj/item/clothing/under/rank/bridge_officer_uniform
	name = "bridge officer uniform"
	desc = "The uniform of a bridge officer. It makes you feel extremely important, even if you are not."
	icon = 'zov_modular_arkstation/modules/new-roles/icons/obj/under.dmi'
	worn_icon = 'zov_modular_arkstation/modules/new-roles/icons/mob/under.dmi'
	worn_icon_digi = 'zov_modular_arkstation/modules/new-roles/icons/mob/under_digi.dmi'
	icon_state = "bridgesec"
	armor_type = /datum/armor/bridge_officer
	can_adjust = FALSE

/obj/item/clothing/under/rank/bridge_officer_uniform/skirt
	name = "bridge officer skirt"
	icon_state = "bridgesecf"
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/datum/armor/bridge_officer
	melee = 5
	bullet = 0
	laser = 5
	energy = 0
	bomb = 0
	fire = 0
	acid = 0
	wound = 0

/obj/item/clothing/suit/toggle/lawyer/bridge_officer_jacket
	name = "bridge officer jacket"
	icon_state = "suitjacket_bridgesec"
	icon = 'zov_modular_arkstation/modules/new-roles/icons/obj/suits.dmi'
	worn_icon = 'zov_modular_arkstation/modules/new-roles/icons/mob/suits.dmi'
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON


//////////////////////////////////////////////////////////////
