/obj/item/armorkit
	name = "don't use armor kit"
	desc = "A glorified sewing kit with durathread sheets, thread, and a titanium needle, for reinforcing jumpsuits and uniforms."
	icon = 'modularz_arkstation/modules/clothing-update/icons/obj/armor_kits.dmi'
	w_class = WEIGHT_CLASS_SMALL
	icon_state = "blueshield_armor_kit"
	var/armor_kit_type = /datum/armor/clothing_under/rank_security
	var/altername = "durathread" // Like "durathread science uniform"
	var/syndicate_armor_kit = FALSE

/obj/item/armorkit/interact_with_atom(obj/item/target, mob/user, proximity_flag, click_parameters)
	var/obj/item/clothing/C = target

	if(C.armored_with_kit == FALSE)
		C.set_armor(armor_kit_type)
		user.visible_message("<span class = 'notice'>[user] reinforces [C] with [src].</span>", \
		"<span class = 'notice'>You reinforce [C] with [src], making it's more protective.</span>")
		if(!syndicate_armor_kit)
			C.name = "[altername] [C.name]"
		C.armored_with_kit = TRUE
		qdel(src)
		return TRUE
	else
		to_chat(user, "<span class = 'notice'>You don't need to reinforce [C] any further.")
		return

/obj/item/clothing
	var/armored_with_kit = FALSE

/// PRESETS
// SUITS
/obj/item/armorkit/suit
	armor_kit_type = /datum/armor/suit_armor
	altername = "aegis"

/obj/item/armorkit/suit/interact_with_atom(obj/item/target, mob/user, proximity_flag, click_parameters)
	if(!(isobj(target) && target.slot_flags & ITEM_SLOT_OCLOTHING))
		return
	..()

// HELMETS
/obj/item/armorkit/helmet
	name = "aegis headgear kit"
	desc = "A nanotrasen armoring kit with armored plates and some nanoglue, for reinforcing hats or other headgear."
	icon_state = "blueshield_helmet_kit"
	armor_kit_type = /datum/armor/head_helmet
	altername = "aegis"

/obj/item/armorkit/helmet/interact_with_atom(obj/item/target, mob/user, proximity_flag, click_parameters)
	if(!(isobj(target) && target.slot_flags & ITEM_SLOT_HEAD))
		return
	..()

//
// BLUESHIELD //

/obj/item/armorkit/suit/blueshield
	name = "aegis armor kit"
	desc = "A nanotrasen armoring kit with armored plates and some nanoglue, for reinforcing outerwear."
	icon_state = "blueshield_armor_kit"
	armor_kit_type = /datum/armor/suit_armor
	altername = "aegis"

/obj/item/armorkit/helmet/blueshield
	name = "aegis headgear kit"
	desc = "A nanotrasen armoring kit with armored plates and some nanoglue, for reinforcing hats or other headgear."
	icon_state = "blueshield_helmet_kit"
	armor_kit_type = /datum/armor/head_helmet
	altername = "aegis"

// SECURITY //

/obj/item/armorkit/suit/security
	name = "rampart armor kit"
	desc = "A security armoring kit with flexible armored sheets and some nanoglue, for reinforcing outerwear."
	icon_state = "sec_armor_kit"
	armor_kit_type = /datum/armor/suit_armor
	altername = "rampart"

/obj/item/armorkit/helmet/security
	name = "rampart headgear kit"
	desc = "A security armoring kit with flexible armored sheets and some nanoglue, for reinforcing hats or other headgear."
	icon_state = "sec_helmet_kit"
	armor_kit_type = /datum/armor/head_helmet
	altername = "rampart"

// SYNDICATE //
/datum/armor/suit_armor_syndicate
	melee = 45
	bullet = 40
	laser = 40
	energy = 50
	bomb = 35
	fire = 60
	acid = 60
	wound = 20

/datum/armor/head_helmet_syndicate
	melee = 45
	bullet = 40
	laser = 40
	energy = 50
	bomb = 35
	fire = 60
	acid = 60
	wound = 20

/obj/item/armorkit/suit/syndicate
	name = "syndicate armor kit"
	desc = "A syndicate armoring kit with flexible armored sheets and some nanoglue, for reinforcing outerwear. Has no mark!"
	icon_state = "sec_armor_kit"
	armor_kit_type = /datum/armor/suit_armor_syndicate
	altername = ""
	syndicate_armor_kit = TRUE

/obj/item/armorkit/helmet/syndicate
	name = "syndicate headgear kit"
	desc = "A syndicate armoring kit with flexible armored sheets and some nanoglue, for reinforcing hats or other headgear. Has no mark!"
	icon_state = "sec_helmet_kit"
	armor_kit_type = /datum/armor/head_helmet_syndicate
	altername = ""
	syndicate_armor_kit = TRUE

// In uplink below -

/datum/uplink_item/suits/armor_kit
	name = "Syndicate Suit Armor Kit"
	desc = "With this set you can strengthen any suit, and it is completely invisible."
	item = /obj/item/armorkit/suit/syndicate
	cost = 2

/datum/uplink_item/suits/armor_kit_head
	name = "Syndicate Head Armor Kit"
	desc = "With this set you can strengthen any hat or helmet, and it is completely invisible."
	item = /obj/item/armorkit/helmet/syndicate
	cost = 2
