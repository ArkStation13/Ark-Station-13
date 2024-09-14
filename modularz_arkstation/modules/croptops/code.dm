/obj/item/clothing/under/arkstation/croptops
	icon = 'modularz_arkstation/modules/croptops/suit_item.dmi'
	worn_icon = 'modularz_arkstation/modules/croptops/suit_mob.dmi'
	flags_1 = 0
	slot_flags = ITEM_SLOT_OCLOTHING|ITEM_SLOT_ICLOTHING
	body_parts_covered = CHEST|ARMS

/obj/item/clothing/under/arkstation/croptops/main
	name = "cropped hoodie"
	desc = "A cropped hoodie that you can lift up at any time."
	icon_state = "croppedhoodie"

/obj/item/clothing/under/arkstation/croptops/main/examine_more(mob/user)
	. = ..()
	return . += span_yellow("(Alt + Click for reskins).")


/obj/item/clothing/under/arkstation/croptops/main/click_alt(mob/user)
	. = ..()
	var/list/choices = list("Standart","Short","Very Short","Extremely Short")
	var/skin = tgui_input_list(user, "How much should I shorten this hoodie?", "Hoodie variables.", choices)
	switch(skin)
		if(null)
			return 0
		if("Standart")
			icon_state = "croppedhoodie"
			user.update_appearance()
			body_parts_covered = CHEST|ARMS
			update_icon()
		if("Short")
			icon_state = "croppierhoodie"
			user.update_appearance()
			body_parts_covered = CHEST|ARMS
			update_icon()
		if("Very Short")
			icon_state = "highcrophoodie"
			user.update_appearance()
			body_parts_covered = ARMS
			update_icon()
		if("Extremely Short")
			icon_state = "supercroppedhoodie"
			user.update_appearance()
			body_parts_covered = ARMS
			update_icon()


/obj/item/clothing/under
	var/obj/item/clothing/under/arkstation/croptops/attached_crop

/obj/item/clothing/under/attackby(obj/item/hitting_item, mob/living/user)
	. = ..()
	if(istype(hitting_item, /obj/item/clothing/under/arkstation/croptops))
		var/obj/item/clothing/hitting_clothing = hitting_item
		if(attached_crop)
			to_chat(user, span_notice("There's already something placed on suit!"))
			return
		attached_crop = hitting_clothing
		to_chat(user, span_notice("You placed [hitting_clothing.name] on suit!"))
		hitting_clothing.forceMove(src)
		update_appearance()

/obj/item/clothing/under/examine()
	. = ..()
	if(attached_crop)
		. += span_notice("There's [attached_crop.name] placed on the suit.")
		. += span_yellow("(Alt + Right-click to remove it.)")

/obj/item/clothing/under/worn_overlays(mutable_appearance/standing, isinhands)
	. = ..()
	if(!isinhands && attached_crop)
		. += attached_crop.build_worn_icon(default_layer = EARS_LAYER, default_icon_file = 'icons/mob/clothing/under/default.dmi')
	else
		cut_overlays()

/obj/item/clothing/under/click_alt_secondary(mob/user)
	. = ..()
	if(!attached_crop)
		return
	user.put_in_active_hand(attached_crop)
	to_chat(user, span_notice("You removed [attached_crop.name] from suit!"))
	attached_crop = null
	update_appearance()

/obj/item/clothing/under/arkstation/croptops/drivejacket
	name = "drive jacket"
	desc = "There's something inside you. It's hard to explain."
	icon_state = "drivejacket"

/obj/item/clothing/under/arkstation/croptops/olive_civ
	name = "olive jacket"
	desc = "Olive colored jacket."
	icon_state = "altevian-jacket-civ"

/obj/item/clothing/under/arkstation/croptops/grey_civ
	name = "civilian jacket"
	desc = "I can't think of a description."
	icon_state = "altevian-jacket-med"

/obj/item/clothing/suit/hooded/pijama
	name = "blue cat pajamas"
	desc = "Meow!"
	icon = 'modularz_arkstation/modules/croptops/suit_item.dmi'
	worn_icon = 'modularz_arkstation/modules/croptops/suit_mob.dmi'
	icon_state = "siffet"
	hoodtype = /obj/item/clothing/head/hooded/pijama
	body_parts_covered = CHEST|GROIN|LEGS|ARMS

/obj/item/clothing/head/hooded/pijama
	name = "blue cat pajamas hood"
	desc = "Meow!"
	icon = 'modularz_arkstation/modules/croptops/furry_hoods.dmi'
	worn_icon = 'modularz_arkstation/modules/croptops/furry_hoods.dmi'
	icon_state = "siffet"
	flags_inv = null
	flags_cover = null
	cold_protection = HEAD
	min_cold_protection_temperature = HELMET_MIN_TEMP_PROTECT
	heat_protection = HEAD
	max_heat_protection_temperature = HELMET_MAX_TEMP_PROTECT
