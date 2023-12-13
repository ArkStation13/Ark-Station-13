//Fuck it we making underwear actual items
/obj/item/clothing/underwear
	name = "Underwear"
	desc = "If you're reading this, something went wrong."
	icon = 'zov_modular_arkstation/modules/new-slots/underwear.dmi' //if someone is willing to make proper inventory sprites that'd be very cash money
	worn_icon = 'zov_modular_arkstation/modules/new-slots/underwear.dmi'
	worn_icon_digi = 'zov_modular_arkstation/modules/new-slots/underwear_digi.dmi'
	body_parts_covered = GROIN
	//slot_flags = ITEM_SLOT_UNDERWEAR
	//armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	w_class = WEIGHT_CLASS_SMALL
	var/under_type = /obj/item/clothing/underwear //i don't know what i'm gonna use this for

/obj/item/clothing/underwear/Move()
	..()
	setDir(SOUTH) //should prevent underwear from facing any direction but south while on the floor, uses same code as pipes, PLEASE, THIS IS A BAD SOLUTION, SOMEONE MAKE ME UNDERWEAR SPRITES ASAP

///Proc to check if undershirt is hidden.
// /mob/living/carbon/human/proc/undershirt_hidden()
// 	for(var/obj/item/I in list(w_uniform, wear_suit))
// 		if(istype(I) && ((I.body_parts_covered & CHEST) || (I.flags_inv & HIDEUNDERWEAR)))
// 			return TRUE
// 	return FALSE

// ///Proc to check if underwear is hidden.
// /mob/living/carbon/human/proc/underwear_hidden()
// 	for(var/obj/item/I in list(w_uniform, wear_suit))
// 		if(istype(I) && ((I.body_parts_covered & GROIN) || (I.flags_inv & HIDEUNDERWEAR)))
// 			return TRUE
// 	return FALSE

// ///Proc to check if socks are hidden.
// /mob/living/carbon/human/proc/socks_hidden()
// 	for(var/obj/item/I in list(shoes, wear_suit))
// 		if(istype(I) && ((I.body_parts_covered & FEET) || (I.flags_inv & HIDEUNDERWEAR)))
// 			return TRUE
// 	return FALSE

// ARK STATION EDIT

// /datum/hud/human/extra_inventory_update(mob/viewer)
// 	if(!mymob)
// 		return
// 	var/mob/living/carbon/human/H = mymob

// 	var/mob/screenmob = viewer || H

// 	if(screenmob.hud_used.extra_shown && screenmob.hud_used.inventory_shown && screenmob.hud_used.hud_shown)
// 		if(H.ears_extra)
// 			H.ears_extra.screen_loc = ui_ears_extra
// 			screenmob.client.screen += H.ears_extra
// 		if(H.w_underwear)
// 			H.w_underwear.screen_loc = ui_boxers
// 			screenmob.client.screen += H.w_underwear
// 		if(H.w_socks)
// 			H.w_socks.screen_loc = ui_socks
// 			screenmob.client.screen += H.w_socks
// 		if(H.w_shirt)
// 			H.w_shirt.screen_loc = ui_shirt
// 			screenmob.client.screen += H.w_shirt
// 		if(H.wrists)
// 			H.wrists.screen_loc = ui_wrists
// 			screenmob.client.screen += H.wrists
// 	else
// 		if(H.ears_extra)
// 			screenmob.client.screen -= H.ears_extra
// 		if(H.w_underwear)
// 			screenmob.client.screen -= H.w_underwear
// 		if(H.w_socks)
// 			screenmob.client.screen -= H.w_socks
// 		if(H.w_shirt)
// 			screenmob.client.screen -= H.w_shirt
// 		if(H.wrists)
// 			screenmob.client.screen -= H.wrists
// //

/atom/movable/screen/human/toggle/extra
	name = "toggle extra"
	icon_state = "toggle_extra"

/atom/movable/screen/human/toggle/extra/Click()

	var/mob/targetmob = usr

	if(isobserver(usr))
		if(ishuman(usr.client.eye) && (usr.client.eye != usr))
			var/mob/M = usr.client.eye
			targetmob = M

	if(usr.hud_used.extra_shown && targetmob.hud_used)
		usr.hud_used.extra_shown = FALSE
		usr.client.screen -= targetmob.hud_used.extra_inventory
	else
		usr.hud_used.extra_shown = TRUE
		usr.client.screen += targetmob.hud_used.extra_inventory

	targetmob.hud_used.extra_inventory_update(usr)
//

/datum/hud
	/// Extra inventory slots visible?
	var/extra_shown = FALSE
	/// Equipped item screens that don't show up even if using the initial toggle
	var/list/extra_inventory = list()

// Used for getting icons for extra inventory slots
GLOBAL_LIST_INIT(modular_ui_styles, list(
	'icons/hud/screen_midnight.dmi' = 'zov_modular_arkstation/modules/new-slots/hud/screen_midnight.dmi',
	'icons/hud/screen_retro.dmi' = 'zov_modular_arkstation/modules/new-slots/hud/screen_retro.dmi',
	'icons/hud/screen_plasmafire.dmi' = 'zov_modular_arkstation/modules/new-slots/hud/screen_plasmafire.dmi',
	'icons/hud/screen_slimecore.dmi' = 'zov_modular_arkstation/modules/new-slots/hud/screen_slimecore.dmi',
	'icons/hud/screen_operative.dmi' = 'zov_modular_arkstation/modules/new-slots/hud/screen_operative.dmi',
	'icons/hud/screen_clockwork.dmi' = 'zov_modular_arkstation/modules/new-slots/hud/screen_clockwork.dmi',
))

// Same as above
/proc/ui_style_modular(ui_style)
	if(isfile(ui_style))
		return GLOB.modular_ui_styles[ui_style] || GLOB.modular_ui_styles[GLOB.modular_ui_styles[1]]
	else
		return GLOB.modular_ui_styles[ui_style] || GLOB.modular_ui_styles[GLOB.modular_ui_styles[1]]

// Called after updating extra inventory
/datum/hud/proc/extra_inventory_update()
	return
