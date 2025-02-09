/obj/item/clothing/gloves
	var/obj/item/clothing/gloves/ring/attached_ring

/obj/item/clothing/gloves/attackby(obj/item/hitting_item, mob/living/carbon/human/user)
	. = ..()
	if(istype(hitting_item, /obj/item/clothing/gloves/ring))
		var/obj/item/clothing/hitting_clothing = hitting_item
		if(attached_ring)
			to_chat(user, span_notice("There's already something placed on [src.name]!"))
			return
		attached_ring = hitting_clothing
		to_chat(user, span_notice("You placed [hitting_clothing.name] on [src.name]!"))
		hitting_clothing.forceMove(src)
		user.update_worn_gloves()
		overlays |= src
		update_appearance()

/obj/item/clothing/gloves/examine()
	. = ..()
	if(attached_ring)
		. += span_notice("There's [attached_ring.name] placed on the [src.name].")
		. += span_yellow("(Alt + Right-click to remove it.)")

/obj/item/clothing/gloves/worn_overlays(mutable_appearance/standing, isinhands)
	. = ..()
	if(!isinhands && attached_ring)
		. += attached_ring.build_worn_icon(default_layer = HANDS_LAYER, default_icon_file = 'icons/mob/clothing/hands.dmi')
	else
		cut_overlays()

/obj/item/clothing/gloves/click_alt_secondary(mob/living/carbon/human/user)
	. = ..()
	if(!attached_ring)
		return
	if(!user.put_in_active_hand(attached_ring))
		attached_ring.forceMove(user.loc)
	to_chat(user, span_notice("You removed [attached_ring.name] from [src.name]!"))
	attached_ring = null
	user.update_worn_gloves()
	overlays -= src
	update_appearance()
