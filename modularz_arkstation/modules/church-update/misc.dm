/obj/structure/statue/knight
	name = "majestic knight statue"
	desc = "The great knight leaned over you, leaning on his mighty sword."
	icon = 'modularz_arkstation/modules/church-update/icons/misc/knight_statues_rot.dmi'
	icon_state = "generic"
	anchored = TRUE
	max_integrity = 500

/obj/structure/statue/knight/wrench_act(mob/living/user, obj/item/tool)
	return

/obj/structure/statue/knight/attackby(obj/item/W, mob/living/user, params)
	add_fingerprint(user)
	return ..()

/obj/structure/statue/knight/left
	icon_state = "oknightstatue_l"

/obj/structure/statue/knight/right
	icon_state = "oknightstatue_r"


// HEADSETS //
/obj/item/radio/headset/headset_church
	name = "church radio headset"
	desc = "Headset used by the church staff. God bless our Ark."
	icon_state = "srv_headset"
	worn_icon_state = "srv_headset"
	keyslot = /obj/item/encryptionkey/headset_church

/obj/item/encryptionkey/headset_church
	name = "church radio encryption key"
	icon_state = "cypherkey_service"
	channels = list(RADIO_CHANNEL_CHURCH = 1)
	greyscale_config = /datum/greyscale_config/encryptionkey_service
	greyscale_colors = "#3758c4#3bca5a"

// Priest - Command
/obj/item/radio/headset/heads/priest
	name = "command church radio headset"
	desc = "Headset used by the Priest. God bless our Ark."
	icon_state = "srv_headset"
	worn_icon_state = "srv_headset"
	keyslot = /obj/item/encryptionkey/heads/headset_priest

/obj/item/encryptionkey/heads/headset_priest
	name = "\proper the priests's encryption key"
	icon_state = "cypherkey_cube"
	channels = list(RADIO_CHANNEL_CHURCH = 1, RADIO_CHANNEL_COMMAND = 1)
	greyscale_config = /datum/greyscale_config/encryptionkey_security
	greyscale_colors = "#280b1a#820a16"


// DEPARTMENTAL BUDGET //
/obj/item/card/id/departmental_budget/church
	department_ID = ACCOUNT_CHR
	department_name = ACCOUNT_CHR_NAME
	icon = 'modularz_arkstation/modules/church-update/icons/misc/card.dmi'
	icon_state = "church_budget"

// CLOSETS //
//Priest
/obj/structure/closet/wardrobe/chaplain_black
	name = "priest's wardrobe"
	desc = "It's a storage unit for Nanotrasen-approved religious attire."
	icon_door = "chap_wardrobe"

/obj/structure/closet/wardrobe/chaplain_black/PopulateContents()
	new /obj/item/clothing/under/rank/civilian/chaplain(src)
	new /obj/item/clothing/under/rank/civilian/chaplain/skirt(src)
	new /obj/item/clothing/shoes/sneakers/black(src)
	new /obj/item/clothing/shoes/sneakers/white(src)
	new /obj/item/clothing/suit/chaplainsuit/nun(src)
	new /obj/item/clothing/head/chaplain/nun_hood(src)
	new /obj/item/clothing/suit/chaplainsuit/priest(src)
	new /obj/item/clothing/neck/cloak/priest(src)
	new /obj/item/clothing/head/chaplain/priest(src)
	new /obj/item/storage/backpack/medieval(src)
	new /obj/item/storage/backpack/satchel/medieval(src)
	new /obj/item/storage/backpack/cultpack(src)
	new /obj/item/clothing/neck/cross(src)
	new /obj/item/storage/fancy/candle_box(src)
	new /obj/item/storage/fancy/candle_box(src)
	new /obj/item/card/id/departmental_budget/church(src)
	return

//Deacon
/obj/structure/closet/wardrobe/chaplain_black/deacon
	name = "deacon's wardrobe"
	desc = "It's a storage unit for Nanotrasen-approved religious attire."
	icon_door = "deacon_wardrobe"

/obj/structure/closet/wardrobe/chaplain_black/deacon/PopulateContents()
	new /obj/item/clothing/under/rank/civilian/chaplain(src)
	new /obj/item/clothing/under/rank/civilian/chaplain/skirt(src)
	new /obj/item/clothing/shoes/sneakers/black(src)
	new /obj/item/clothing/shoes/sneakers/white(src)
	new /obj/item/clothing/shoes/jackboots/black/medieval(src)
	new /obj/item/clothing/gloves/combat/medieval(src)
	new /obj/item/clothing/suit/chaplainsuit/deacon(src)
	new /obj/item/clothing/head/chaplain/deacon(src)
	new /obj/item/storage/backpack/medieval(src)
	new /obj/item/storage/backpack/satchel/medieval(src)
	new /obj/item/clothing/neck/cross(src)
	new /obj/item/storage/fancy/candle_box(src)
	return

//Fiscal
/obj/structure/closet/wardrobe/chaplain_black/fiscal
	name = "fiscal's wardrobe"
	desc = "It's a storage unit for Nanotrasen-approved religious attire."
	icon_door = "fiscal_wardrobe"

/obj/structure/closet/wardrobe/chaplain_black/fiscal/PopulateContents()
	new /obj/item/clothing/under/rank/civilian/chaplain(src)
	new /obj/item/clothing/under/rank/civilian/chaplain/skirt(src)
	new /obj/item/clothing/shoes/sneakers/black(src)
	new /obj/item/clothing/shoes/sneakers/white(src)
	new /obj/item/clothing/shoes/jackboots/black/medieval(src)
	new /obj/item/clothing/gloves/combat/medieval(src)
	new /obj/item/storage/backpack/medieval(src)
	new /obj/item/storage/backpack/satchel/medieval(src)
	new /obj/item/clothing/neck/cross(src)
	new /obj/item/storage/fancy/candle_box(src)
	new /obj/item/clothing/suit/armor/riot/knight/inquisitor(src)
	new /obj/item/clothing/head/helmet/toggleable/inquisitor(src)
	new /obj/item/clothing/shoes/combat/medieval_steel(src)
	new /obj/item/clothing/gloves/combat/medieval/steel(src)
	new /obj/item/clothing/mask/medieval(src)
	new /obj/item/clothing/neck/medieval_chainmail(src)
	new /obj/item/claymore/cerberus(src)
	return
