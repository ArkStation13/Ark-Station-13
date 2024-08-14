// CIVIL //
/obj/item/clothing/under/dress/wedding_dress/medieval
	name = "medieval dress"
	icon_state = "dress"
	icon = 'zov_modular_arkstation/modules/church-update/icons/obj/obj_dress_rot.dmi'
	worn_icon = 'zov_modular_arkstation/modules/church-update/icons/mob/mob_dress_rot.dmi'
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON
	can_adjust = FALSE
	greyscale_config = null
	greyscale_config_worn = null

/obj/item/clothing/shoes/jackboots/black/medieval
	name = "medieval jackboots"
	desc = "Black medieval jackboots."
	icon = 'zov_modular_arkstation/modules/church-update/icons/obj/obj_boots_rot.dmi'
	worn_icon = 'zov_modular_arkstation/modules/church-update/icons/mob/mob_boots_rot.dmi'
	icon_state = "nobleboots"

/obj/item/clothing/gloves/combat/medieval
	name = "medieval combat gloves"
	desc = "Black medieval combat gloves. Does not have electrical insulation."
	icon = 'zov_modular_arkstation/modules/church-update/icons/obj/obj_gloves_rot.dmi'
	icon_state = "combat"
	siemens_coefficient = 0.5

/obj/item/storage/backpack/satchel/medieval
	name = "medieval leather satchel"
	desc = "Medieval looking leather satchel."
	icon = 'zov_modular_arkstation/modules/church-update/icons/obj/obj_satch_rot.dmi'
	worn_icon = 'zov_modular_arkstation/modules/church-update/icons/mob/mob_satch_rot.dmi'
	icon_state = "satchel"
	inhand_icon_state = "satchel-explorer"

/obj/item/storage/backpack/medieval
	name = "medieval leather backpack"
	desc = "Medieval looking leather backpack."
	icon = 'zov_modular_arkstation/modules/church-update/icons/obj/backpack_obj_rot.dmi'
	worn_icon = 'zov_modular_arkstation/modules/church-update/icons/mob/backpack_mob_rot.dmi'
	icon_state = "backpack"
	inhand_icon_state = "explorerpack"

// INQUISITOR //

// Armor
/datum/armor/armor_inquisitor
	melee = 60
	bullet = 20
	laser = 20
	energy = 20
	fire = 90
	acid = 60
	wound = 30

/obj/item/clothing/suit/armor/riot/knight/inquisitor
	name = "medieval coat of plates"
	desc = "Steel armor made up of many plates. Highly effective at stopping melee attacks."
	icon = 'zov_modular_arkstation/modules/church-update/icons/obj/obj_armor_rot.dmi'
	worn_icon = 'zov_modular_arkstation/modules/church-update/icons/mob/mob_armor_rot.dmi'
	icon_state = "coat_of_plates"
	inhand_icon_state = null
	allowed = list(
		/obj/item/banner,
		/obj/item/claymore,
		/obj/item/nullrod,
		/obj/item/tank/internals/emergency_oxygen,
		/obj/item/tank/internals/plasmaman,
		)
	armor_type = /datum/armor/armor_inquisitor

	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/suit/armor/riot/knight/inquisitor/plate
	name = "medieval armour plate"
	desc = "Massive armor with one large plate on the chest. Highly effective at stopping melee attacks."
	icon_state = "plate"

/obj/item/clothing/suit/armor/riot/knight/inquisitor/half_plate
	name = "medieval armour halfplate"
	desc = "Cut-to-the-top steel armor. Highly effective at stopping melee attacks."
	icon_state = "halfplate"

/obj/item/clothing/suit/armor/riot/knight/inquisitor/chainmail
	name = "medieval chainmail armour"
	desc = "Armor made up of hundreds of thousands of steel flakes. Highly effective at stopping melee attacks."
	icon_state = "lamellar"

// Helmet
/datum/armor/helmet_inquisitor
	melee = 60
	bullet = 20
	laser = 20
	energy = 20
	fire = 90
	acid = 60
	wound = 30

/obj/item/clothing/head/helmet/toggleable/inquisitor
	name = "medieval helmet"
	desc = "A classic metal helmet."
	icon_state = "knight"
	inhand_icon_state = "knight_helmet"
	armor_type = /datum/armor/helmet_inquisitor
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDESNOUT
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	strip_delay = 80
	dog_fashion = null
	clothing_traits = list(TRAIT_HEAD_INJURY_BLOCKED)
	actions_types = list(/datum/action/item_action/toggle)

	toggle_message = "You pull the visor down on"
	alt_toggle_message = "You push the visor up on"

	icon = 'zov_modular_arkstation/modules/church-update/icons/obj/obj_helmets_rot.dmi'
	worn_icon = 'zov_modular_arkstation/modules/church-update/icons/mob/mob_helmet_rot.dmi'

/obj/item/clothing/head/helmet/toggleable/inquisitor/hounskull
	name = "medieval hounskull helmet"
	desc = "A helmet with a pointed steel visor, shaped like a rat's face."
	icon_state = "hounskull"

/obj/item/clothing/head/helmet/toggleable/inquisitor/sallet
	name = "medieval sallet helmet"
	desc = "A classic metal helmet."
	icon_state = "sallet"
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR
	flags_cover = HEADCOVERSEYES

// Gloves & Boots
/obj/item/clothing/shoes/combat/medieval_steel
	name = "medieval steel boots"
	desc = "Steel medieval jackboots."
	icon = 'zov_modular_arkstation/modules/church-update/icons/obj/obj_boots_rot.dmi'
	worn_icon = 'zov_modular_arkstation/modules/church-update/icons/mob/mob_boots_rot.dmi'
	icon_state = "armorboots"

/obj/item/clothing/gloves/combat/medieval/steel
	name = "medieval steel combat gloves"
	desc = "Steel medieval combat gloves."
	icon = 'zov_modular_arkstation/modules/church-update/icons/obj/obj_gloves_rot.dmi'
	worn_icon = 'zov_modular_arkstation/modules/church-update/icons/mob/mob_gloves_rot.dmi'
	icon_state = "gauntlets"
	siemens_coefficient = 0

// Mask
/obj/item/clothing/mask/medieval
	name = "steel mask"
	desc = "Steel mask with holes for eyes and breathing."
	icon = 'zov_modular_arkstation/modules/church-update/icons/obj/obj_mask_rot.dmi'
	worn_icon = 'zov_modular_arkstation/modules/church-update/icons/mob/mob_mask_rot.dmi'
	icon_state = "smask"
	flags_inv = HIDEEYES|HIDEFACE|HIDESNOUT
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH

// Neck
/datum/armor/neck_inquisitor
	melee = 60
	bullet = 20
	laser = 20
	energy = 20
	fire = 90
	acid = 60
	wound = 30

/obj/item/clothing/neck/medieval_chainmail
	name = "chain coif"
	desc = "Chainmail armor made to protect your neck."
	icon = 'zov_modular_arkstation/modules/church-update/icons/obj/obj_neck_rot.dmi'
	worn_icon = 'zov_modular_arkstation/modules/church-update/icons/mob/mob_neck_rot.dmi'
	icon_state = "chaincoif"
	armor_type = /datum/armor/neck_inquisitor


// PRIEST //

// Head
/obj/item/clothing/head/chaplain/priest
	name = "priest's headdress"
	desc = "Since ancient times, a headdress used by Orthodox clergy. Decorated with gold ornaments."
	icon_state = "priest"
	inhand_icon_state = "pwig"
	armor_type = /datum/armor/helmet_chaplain
	dog_fashion = null

	icon = 'zov_modular_arkstation/modules/church-update/icons/obj/obj_helmets_rot.dmi'
	worn_icon = 'zov_modular_arkstation/modules/church-update/icons/mob/mob_helmet_priest_rot.dmi'

// Suit
/obj/item/clothing/suit/chaplainsuit/priest
	name = "priests's robe"
	desc = "Glad to see the tithes you collected were well spent."
	icon_state = "robe"
	base_icon_state = "robe"
	inhand_icon_state = "bishoprobe"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	flags_inv = HIDEJUMPSUIT
	icon = 'zov_modular_arkstation/modules/church-update/icons/obj/robe_obj_rot.dmi'
	worn_icon = 'zov_modular_arkstation/modules/church-update/icons/mob/robe_mob_rot.dmi'
	female_sprite = TRUE

	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

// Neck
/obj/item/clothing/neck/cloak/priest
	name = "priest's cape"
	desc = "It's a cape that can be worn around your neck."
	icon_state = "chasuble"

	icon = 'zov_modular_arkstation/modules/church-update/icons/obj/chasuable_obj_rot.dmi'
	worn_icon = 'zov_modular_arkstation/modules/church-update/icons/mob/chasuable_mob_rot.dmi'


// DEACON //

// Head
/obj/item/clothing/head/chaplain/deacon
	name = "deacon's headdress"
	desc = "Cape on the head. You need it to perform sacred sacraments without revealing your face."
	icon_state = "bandithood"
	armor_type = /datum/armor/helmet_chaplain
	dog_fashion = null
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDESNOUT
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH

	icon = 'zov_modular_arkstation/modules/church-update/icons/obj/bandithood_obj_rot.dmi'
	worn_icon = 'zov_modular_arkstation/modules/church-update/icons/mob/bandithood_mob_rot.dmi'

// Suit
/obj/item/clothing/suit/chaplainsuit/deacon
	name = "deacon's robe"
	desc = "Glad to see the tithes you collected were well spent."
	icon_state = "priestunder"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	flags_inv = HIDEJUMPSUIT
	icon = 'zov_modular_arkstation/modules/church-update/icons/obj/banditshirt_obj_rot.dmi'
	worn_icon = 'zov_modular_arkstation/modules/church-update/icons/mob/banditshirt_mob_rot.dmi'

	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON
