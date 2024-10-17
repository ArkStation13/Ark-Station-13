/obj/item/clothing/head/helmet/sec/metropolice
	name = "metropolice helmet"
	desc = "10-4."
	icon = 'modularz_arkstation/modules/clothing-update/icons/obj/clothing/head/head.dmi'
	worn_icon = 'modularz_arkstation/modules/clothing-update/icons/mob/clothing/head/head.dmi'
	worn_icon_muzzled = 'modularz_arkstation/modules/clothing-update/icons/mob/clothing/head/head_digi.dmi'
	icon_state = "metrocop_helmet"

/obj/item/clothing/head/helmet/sec
	icon = 'icons/obj/clothing/head/helmet.dmi'
	worn_icon = 'icons/mob/clothing/head/helmet.dmi'
	icon_state = "helmet"
	base_icon_state = "helmet"
	inhand_icon_state = "helmet"
	actions_types = list()
	supports_variations_flags = CLOTHING_SNOUTED_VARIATION_NO_NEW_ICON
	clothing_flags = SNUG_FIT | STACKABLE_HELMET_EXEMPT
	flags_cover = HEADCOVERSEYES|EARS_COVERED|PEPPERPROOF
	visor_flags_cover = null
	can_toggle = FALSE
	uses_advanced_reskins = TRUE
	unique_reskin = list(
		"Default" = list(
			RESKIN_ICON_STATE = "helmet",
			RESKIN_ICON = 'icons/obj/clothing/head/helmet.dmi',
			RESKIN_WORN_ICON = 'icons/mob/clothing/head/helmet.dmi',
			RESKIN_WORN_ICON_STATE = "helmet",
			RESKIN_BASE_ICON_STATE = "helmet"
		),
		"Blue" = list(
			RESKIN_ICON_STATE = "helmetalt_blue",
			RESKIN_ICON = 'modular_nova/master_files/icons/obj/clothing/head/helmet.dmi',
			RESKIN_WORN_ICON = 'modular_nova/master_files/icons/mob/clothing/head/helmet.dmi',
			RESKIN_WORN_ICON_STATE = "helmetalt_blue",
			RESKIN_BASE_ICON_STATE = "helmetalt_blue"
		),
		"Blue Alt" = list(
			RESKIN_ICON = 'modularz_arkstation/modules/clothing-update/icons/sec_reskins/obj/obj.dmi',
			RESKIN_WORN_ICON = 'modularz_arkstation/modules/clothing-update/icons/sec_reskins/mob/mob.dmi',
			RESKIN_WORN_ICON_STATE = "inteq_helmet_blue",
			RESKIN_ICON_STATE = "inteq_helmet_blue",
			RESKIN_BASE_ICON_STATE = "inteq_helmet_blue"
		),
		"Red Alt" = list(
			RESKIN_ICON = 'modularz_arkstation/modules/clothing-update/icons/sec_reskins/obj/obj.dmi',
			RESKIN_WORN_ICON = 'modularz_arkstation/modules/clothing-update/icons/sec_reskins/mob/mob.dmi',
			RESKIN_WORN_ICON_STATE = "inteq_helmet_red",
			RESKIN_ICON_STATE = "inteq_helmet_red",
			RESKIN_BASE_ICON_STATE = "inteq_helmet_red"
		),
		"Black" = list(
			RESKIN_ICON = 'modularz_arkstation/modules/clothing-update/icons/sec_reskins/obj/obj.dmi',
			RESKIN_WORN_ICON = 'modularz_arkstation/modules/clothing-update/icons/sec_reskins/mob/mob.dmi',
			RESKIN_WORN_ICON_STATE = "inteq_helmet_black",
			RESKIN_ICON_STATE = "inteq_helmet_black",
			RESKIN_BASE_ICON_STATE = "inteq_helmet_black"
		),
		"Peacekeeper" = list(
			RESKIN_ICON_STATE = "peacekeeper_helmet",
			RESKIN_ICON = 'modular_nova/master_files/icons/obj/clothing/head/helmet.dmi',
			RESKIN_WORN_ICON = 'modular_nova/master_files/icons/mob/clothing/head/helmet.dmi',
			RESKIN_WORN_ICON_STATE = "peacekeeper_helmet",
			RESKIN_BASE_ICON_STATE = "peacekeeper_helmet"
		),
		"No Visor" = list(
			RESKIN_ICON = 'modular_nova/master_files/icons/obj/clothing/head/helmet.dmi',
			RESKIN_WORN_ICON = 'modular_nova/master_files/icons/mob/clothing/head/helmet.dmi',
			RESKIN_WORN_ICON_STATE = "security_helmet_novisor",
			RESKIN_ICON_STATE = "security_helmet_novisor",
			RESKIN_BASE_ICON_STATE = "security_helmet_novisor"
		)
	)

/obj/item/clothing/head/helmet/alt
	name = "bulletproof helmet"
	desc = "A bulletproof combat helmet that excels in protecting the wearer against traditional projectile weaponry and explosives to a minor extent."
	icon_state = "helmetalt"
	base_icon_state = "helmetalt"
	icon = 'icons/obj/clothing/head/helmet.dmi'
	worn_icon = 'icons/mob/clothing/head/helmet.dmi'
	uses_advanced_reskins = TRUE
	unique_reskin = list(
		"Default" = list(
			RESKIN_ICON_STATE = "helmetalt_blue",
			RESKIN_ICON = 'modular_nova/master_files/icons/obj/clothing/head/helmet.dmi',
			RESKIN_WORN_ICON = 'modular_nova/master_files/icons/mob/clothing/head/helmet.dmi',
			RESKIN_WORN_ICON_STATE = "helmetalt_blue",
			RESKIN_BASE_ICON_STATE = "helmetalt_blue"
		),
		"Blue" = list(
			RESKIN_ICON_STATE = "helmetalt_blue",
			RESKIN_ICON = 'modular_nova/master_files/icons/obj/clothing/head/helmet.dmi',
			RESKIN_WORN_ICON = 'modular_nova/master_files/icons/mob/clothing/head/helmet.dmi',
			RESKIN_WORN_ICON_STATE = "helmetalt_blue",
			RESKIN_BASE_ICON_STATE = "helmetalt_blue"
		),
	)

/obj/item/clothing/head/helmet/sec/nova
	name = "Helmet with visor"
	desc = "A unique helmet with a transparent visor that protects you from various impacts. For example, a blow from stones or pepper."
	icon = 'modular_nova/master_files/icons/obj/clothing/head/helmet.dmi'
	worn_icon = 'modular_nova/master_files/icons/mob/clothing/head/helmet.dmi'
	worn_icon_muzzled = 'modular_nova/master_files/icons/mob/clothing/head/helmet_muzzled.dmi'
	icon_state = "security_helmet"
	base_icon_state = "security_helmet"
	actions_types = list(/datum/action/item_action/toggle)
	supports_variations_flags = CLOTHING_SNOUTED_VARIATION
	flags_cover = HEADCOVERSEYES | PEPPERPROOF
	visor_flags_cover = HEADCOVERSEYES | PEPPERPROOF
	dog_fashion = null

	can_toggle = TRUE
	uses_advanced_reskins = FALSE
	unique_reskin = null

/obj/item/clothing/head/hats/hos/cap
	icon = 'icons/obj/clothing/head/hats.dmi'
	worn_icon = 'icons/mob/clothing/head/hats.dmi'
	icon_state = "hoscap"
	uses_advanced_reskins = TRUE
	unique_reskin = list(
		"Blue Cap" = list(
			RESKIN_ICON = 'modular_nova/master_files/icons/obj/clothing/hats.dmi',
			RESKIN_WORN_ICON = 'modular_nova/master_files/icons/mob/clothing/head.dmi',
			RESKIN_ICON_STATE = "hoscap_blue",
			RESKIN_WORN_ICON_STATE = "hoscap_blue"
		),
		"Sol Cap" = list(
			RESKIN_ICON = 'modular_nova/master_files/icons/obj/clothing/hats.dmi',
			RESKIN_WORN_ICON = 'modular_nova/master_files/icons/mob/clothing/head.dmi',
			RESKIN_ICON_STATE = "policechiefcap",
			RESKIN_WORN_ICON_STATE = "policechiefcap"
		),
		"Sheriff Hat" = list(
			RESKIN_ICON = 'modular_nova/master_files/icons/obj/clothing/hats.dmi',
			RESKIN_WORN_ICON = 'modular_nova/master_files/icons/mob/clothing/head.dmi',
			RESKIN_ICON_STATE = "cowboyhat_black",
			RESKIN_WORN_ICON_STATE = "cowboyhat_black"
		),
		"Wide Sheriff Hat" = list(
			RESKIN_ICON = 'modular_nova/master_files/icons/obj/clothing/hats.dmi',
			RESKIN_WORN_ICON = 'modular_nova/master_files/icons/mob/clothing/head.dmi',
			RESKIN_ICON_STATE = "cowboy_black",
			RESKIN_WORN_ICON_STATE = "cowboy_black"
		)
	)

/obj/item/clothing/head/hats/snufkin_hat
	name = "\improper Snufkin's hat"
	desc = "Wide hat with a feather on the top."
	icon_state = "snus-hat"
	inhand_icon_state = null
	icon = 'modularz_arkstation/modules/clothing-update/icons/snufkin_clothes/obj/obj.dmi'
	worn_icon = 'modularz_arkstation/modules/clothing-update/icons/snufkin_clothes/mob/mob.dmi'

/obj/item/clothing/head/hats/gwen_bow
	name = "\improper Doll's bow"
	desc = "some dolly bow"
	icon_state = "gwen_bow"
	inhand_icon_state = null
	icon = 'modularz_arkstation/modules/clothing-update/icons/gwen_clothes/obj/bow.dmi'
	worn_icon = 'modularz_arkstation/modules/clothing-update/icons/gwen_clothes/mob/clothes_on.dmi'

/obj/item/clothing/head/helmet/space/plasmaman/security
	icon_state = "security_envirohelm" // ARK STATION EDIT || REDSEC

/obj/item/clothing/head/helmet/space/plasmaman/security/warden
	icon_state = "warden_envirohelm" // ARK STATION EDIT || REDSEC

/obj/item/clothing/head/helmet/space/plasmaman/security/head_of_security
	icon_state = "hos_envirohelm" // ARK STATION EDIT || REDSEC

