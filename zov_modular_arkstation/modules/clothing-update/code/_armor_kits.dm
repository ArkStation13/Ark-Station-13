/obj/item/armorkit
	name = "durathread armor kit"
	desc = "A glorified sewing kit with durathread sheets, thread, and a titanium needle, for reinforcing jumpsuits and uniforms."
	icon = 'zov_modular_arkstation/modules/clothing-update/icons/obj/armor_kits.dmi'
	w_class = WEIGHT_CLASS_SMALL
	icon_state = "durathread_kit" // shoutout to my guy Toriate for being good at sprites tho

/obj/item/armorkit/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	// yeah have fun making subtypes and modifying the afterattack if you want to make variants
	// idiot
	var/used = FALSE

	if(isobj(target) && istype(target, /obj/item/clothing/under))
		var/obj/item/clothing/under/C = target
		if(C.damaged_clothes)
			to_chat(user,"<span class='warning'>You should repair the damage done to [C] first.</span>")
			return
		if(C.attached_accessories.len)
			to_chat(user,"<span class='warning'>Kind of hard to sew around [C.attached_accessories.Join(", ")].</span>")
			return
		if(C.armor_type != /datum/armor/clothing_under/rank_security)
			C.armor_type = /datum/armor/clothing_under/rank_security
			used = TRUE

		if(used)
			user.visible_message("<span class = 'notice'>[user] reinforces [C] with [src].</span>", \
			"<span class = 'notice'>You reinforce [C] with [src], making it as protective as a durathread jumpsuit.</span>")
			C.name = "durathread [C.name]"
			qdel(src)
			return
		else
			to_chat(user, "<span class = 'notice'>You don't need to reinforce [C] any further.")
			return
	else
		return

/obj/item/armorkit/blueshield
	name = "aegis armor kit"
	desc = "A nanotrasen armoring kit with armored plates and some nanoglue, for reinforcing outerwear."
	icon = 'zov_modular_arkstation/modules/clothing-update/icons/obj/armor_kits.dmi'
	w_class = WEIGHT_CLASS_SMALL
	icon_state = "blueshield_armor_kit" // I'm so sorry I butchered the sprite, Toriate.

/obj/item/armorkit/blueshield/afterattack(obj/item/target, mob/user, proximity_flag, click_parameters)
	// yeah have fun making subtypes and modifying the afterattack if you want to make variants
	// idiot
	// I have no idea what you are talking about.
	var/used = FALSE

	if(!(isobj(target) && target.slot_flags & ITEM_SLOT_OCLOTHING))
		return

	var/obj/item/clothing/C = target

	if(C.armor_type != /datum/armor/suit_armor/blueshield)
		C.armor_type = /datum/armor/suit_armor/blueshield
		used = TRUE

	if(used)
		C.allowed = GLOB.security_vest_allowed
		user.visible_message("<span class = 'notice'>[user] reinforces [C] with [src].</span>", \
		"<span class = 'notice'>You reinforce [C] with [src], making it as protective as a blueshield armored vest.</span>")
		C.name = "aegis [C.name]"
		qdel(src)
		return
	else
		to_chat(user, "<span class = 'notice'>You don't need to reinforce [C] any further.")
		return

/obj/item/armorkit/blueshield/helmet
	name = "aegis headgear kit"
	desc = "A nanotrasen armoring kit with armored plates and some nanoglue, for reinforcing hats or other headgear."
	icon = 'zov_modular_arkstation/modules/clothing-update/icons/obj/armor_kits.dmi'
	w_class = WEIGHT_CLASS_SMALL
	icon_state = "blueshield_helmet_kit" // I'm so sorry I butchered the sprite, Toriate. (x2)

/obj/item/armorkit/blueshield/helmet/afterattack(obj/item/target, mob/user, proximity_flag, click_parameters)
	var/used = FALSE

	if(!(isobj(target) && target.slot_flags & ITEM_SLOT_HEAD))
		return

	var/obj/item/clothing/C = target

	if(C.armor_type != /datum/armor/head_helmet/blueshield)
		C.armor_type = /datum/armor/head_helmet/blueshield
		used = TRUE

	if(used)
		user.visible_message("<span class = 'notice'>[user] reinforces [C] with [src].</span>", \
		"<span class = 'notice'>You reinforce [C] with [src], making it as protective as a blueshield helmet.</span>")
		C.name = "aegis [C.name]"
		qdel(src)
		return
	else
		to_chat(user, "<span class = 'notice'>You don't need to reinforce [C] any further.")
		return

/obj/item/armorkit/security
	name = "rampart armor kit"
	desc = "A security armoring kit with flexible armored sheets and some nanoglue, for reinforcing outerwear."
	icon = 'zov_modular_arkstation/modules/clothing-update/icons/obj/armor_kits.dmi'
	w_class = WEIGHT_CLASS_SMALL
	icon_state = "sec_armor_kit" // I'm so sorry I butchered the sprite, Toriate. (x3)

/obj/item/armorkit/security/afterattack(obj/item/target, mob/user, proximity_flag, click_parameters)
	var/used = FALSE

	if(!(isobj(target) && target.slot_flags & ITEM_SLOT_OCLOTHING))
		return

	var/obj/item/clothing/C = target

	if(C.armor_type != /datum/armor/suit_armor)
		C.armor_type = /datum/armor/suit_armor
		used = TRUE

	if(used)
		C.allowed = GLOB.security_vest_allowed
		user.visible_message("<span class = 'notice'>[user] reinforces [C] with [src].</span>", \
		"<span class = 'notice'>You reinforce [C] with [src], making it as protective as a security armored vest.</span>")
		C.name = "rampart [C.name]"
		qdel(src)
		return
	else
		to_chat(user, "<span class = 'notice'>You don't need to reinforce [C] any further.")
		return

/obj/item/armorkit/security/helmet
	name = "rampart headgear kit"
	desc = "A security armoring kit with flexible armored sheets and some nanoglue, for reinforcing hats or other headgear."
	//icon = 'modular_splurt/icons/obj/clothing/reinforcekits.dmi'
	w_class = WEIGHT_CLASS_SMALL
	icon_state = "sec_helmet_kit" // I'm so sorry I butchered the sprite, Toriate. (x4)

/obj/item/armorkit/security/helmet/afterattack(obj/item/target, mob/user, proximity_flag, click_parameters)
	var/used = FALSE

	if(!(isobj(target) && target.slot_flags & ITEM_SLOT_HEAD))
		return

	var/obj/item/clothing/C = target

	if(C.armor_type != /datum/armor/head_helmet)
		C.armor_type = /datum/armor/head_helmet
		used = TRUE

	if(used)
		user.visible_message("<span class = 'notice'>[user] reinforces [C] with [src].</span>", \
		"<span class = 'notice'>You reinforce [C] with [src], making it as protective as a security helmet.</span>")
		C.name = "rampart [C.name]"
		qdel(src)
		return
	else
		to_chat(user, "<span class = 'notice'>You don't need to reinforce [C] any further.")
		return
