/obj/item/clothing/under/arkstation/croptops
	icon = 'zov_modular_arkstation/modules/croptops/suit_item.dmi'
	worn_icon = 'zov_modular_arkstation/modules/croptops/suit_mob.dmi'

/obj/item/clothing/under/arkstation/croptops/main
	name = "cropped hoodie"
	desc = "A cropped hoodie that you can lift up at any time."
	icon_state = "croppedhoodie"

/obj/item/clothing/under/arkstation/croptops/main/examine_more(mob/user)
	. = ..()
	return . + span_yellow("(Alt + Click for reskins).")


/obj/item/clothing/under/arkstation/croptops/main/AltClick(mob/user)
	. = ..()
	var/list/choices = list("Standart","Short","Very Short","Extremely Short")
	var/skin = tgui_input_list(user, "How much should I shorten this hoodie?", "Hoodie variables.", choices)
	switch(skin)
		if(null)
			return 0
		if("Standart")
			icon_state = "croppedhoodie"
			user.update_appearance()
			update_icon()
		if("Short")
			icon_state = "croppierhoodie"
			user.update_appearance()
			update_icon()
		if("Very Short")
			icon_state = "highcrophoodie"
			user.update_appearance()
			update_icon()
		if("Extremely Short")
			icon_state = "supercroppedhoodie"
			user.update_appearance()
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

/obj/item/clothing/under/alt_click_secondary(mob/user)
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

/obj/item/clothing/under/arkstation/hooded // Делаем грязь.
	name = "hooded undersuit"
	actions_types = list(/datum/action/item_action/toogle_hood)
	icon = 'zov_modular_arkstation/modules/croptops/suit_item.dmi'
	worn_icon = 'zov_modular_arkstation/modules/croptops/suit_mob.dmi'
	var/is_hood_toogled = FALSE

/datum/action/item_action/toogle_hood
	name = "Toogle Hood"

/obj/item/clothing/under/arkstation/hooded/verb/toogle_hood()
	set category = "Object"
	set name = "Toogle Hood"
	set src in usr
	if(!isliving(usr))
		return
	if(!can_use(usr))
		return

	if(is_hood_toogled == TRUE)
		icon_state = base_icon_state
		to_chat(usr, span_info("You took off your hood."))
		is_hood_toogled = FALSE
		update_icon()

	if(is_hood_toogled == FALSE)
		icon_state = base_icon_state + "_t"
		to_chat(usr, span_info("You take on your hood."))
		is_hood_toogled = TRUE
		update_icon()

/obj/item/clothing/under/arkstation/hooded/ui_action_click(mob/user, action)
	if(istype(action, /datum/action/item_action/toogle_hood))
		toogle_hood()

/obj/item/clothing/under/arkstation/hooded/Initialize(mapload)
	. = ..()

/obj/item/clothing/under/arkstation/hooded/siffet
	name = "blue cat pajamas"
	desc = "Stinky!"
	icon_state = "siffet"
	base_icon_state = "siffet"
