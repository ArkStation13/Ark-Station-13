/obj/item/clothing/shoes/jackboots/tall
	name = "tall jackboots"
	desc = "A pair of tall jackboots usually worn by the combatants."
	icon = 'zov_modular_arkstation/modules/clothing-update/icons/obj/clothing/feet/shoes.dmi'
	worn_icon = 'zov_modular_arkstation/modules/clothing-update/icons/mob/clothing/feet/shoes.dmi'
	worn_icon_digi = 'zov_modular_arkstation/modules/clothing-update/icons/mob/clothing/feet/shoes_digi.dmi'
	icon_state = "jackboots-tall"

/obj/item/clothing/shoes/jackboots/toeless
	name = "toeless jackboots"
	desc = "A pair of cut jackboots."
	icon = 'zov_modular_arkstation/modules/clothing-update/icons/obj/clothing/feet/shoes.dmi'
	worn_icon = 'zov_modular_arkstation/modules/clothing-update/icons/mob/clothing/feet/shoes.dmi'
	worn_icon_digi = 'zov_modular_arkstation/modules/clothing-update/icons/mob/clothing/feet/shoes_digi.dmi'
	icon_state = "jackboots-toeless"

/obj/item/clothing/shoes/workboots/toeless
	name = "toeless work boots"
	desc = "A pair of cut work boot."
	icon = 'zov_modular_arkstation/modules/clothing-update/icons/obj/clothing/feet/shoes.dmi'
	worn_icon = 'zov_modular_arkstation/modules/clothing-update/icons/mob/clothing/feet/shoes.dmi'
	worn_icon_digi = 'zov_modular_arkstation/modules/clothing-update/icons/mob/clothing/feet/shoes_digi.dmi'
	icon_state = "workboots-toeless"

/obj/item/clothing/shoes/high_heels/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/squeak, list('modular_nova/modules/modular_items/lewd_items/sounds/highheel1.ogg' = 1, 'modular_nova/modules/modular_items/lewd_items/sounds/highheel2.ogg' = 1), 70)

/obj/item/clothing/shoes/laceup/gwen_shoes
	name = "\improper Doll's shoes"
	desc = "some dolly shoes"
	icon_state = "gwen_shoes"
	inhand_icon_state = null
	icon = 'zov_modular_arkstation/modules/clothing-update/icons/gwen_clothes/obj/laceup.dmi'
	worn_icon = 'zov_modular_arkstation/modules/clothing-update/icons/gwen_clothes/mob/clothes_on.dmi'

/obj/item/clothing/shoes/wraps
	body_parts_covered = FEET

// SECURITY OVERRIDES //

/obj/item/clothing/shoes/jackboots/sec
	name = "security jackboots"
	desc = "Nanotrasen-issue Security combat boots for combat scenarios or combat situations. All combat, all the time."
	icon_state = "jackboots"
	icon = 'modular_nova/master_files/icons/obj/clothing/shoes.dmi'
	worn_icon = 'modular_nova/master_files/icons/mob/clothing/feet.dmi'
	clothing_traits = list(TRAIT_SILENT_FOOTSTEPS)
	uses_advanced_reskins = TRUE
	unique_reskin = list(
		"Red-Trimmed Variant" = list(
			RESKIN_ICON_STATE = "jackboots_sec",
			RESKIN_WORN_ICON_STATE = "jackboots_sec"
		),
		"Blue-Trimmed Variant" = list(
			RESKIN_ICON_STATE = "security_boots",
			RESKIN_WORN_ICON_STATE = "security_boots"
		),
		"White-Trimmed Variant" = list(
			RESKIN_ICON_STATE = "security_boots_white",
			RESKIN_WORN_ICON_STATE = "security_boots_white"
		),
		"Full White Variant" = list(
			RESKIN_ICON_STATE = "security_boots_fullwhite",
			RESKIN_WORN_ICON_STATE = "security_boots_fullwhite"
		),
	)
