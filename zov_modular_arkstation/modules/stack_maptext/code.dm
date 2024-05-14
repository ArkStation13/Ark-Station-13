/mob/proc/UnEquip(obj/item/I, force, atom/newloc)
	if(!I)
		return

	if(HAS_TRAIT(I, TRAIT_NODROP) && !force)
		return FALSE //UnEquip() only fails if item has TRAIT_NODROP

	doUnEquip(I)

	if (client)
		client.screen -= I
	I.layer = initial(I.layer)
	I.plane = initial(I.plane)
	if(newloc)
		I.forceMove(newloc)
		I.removed_from_inventory(src)
	I.dropped(src)

	return TRUE

/obj/item/proc/removed_from_inventory(mob/user)
	SHOULD_CALL_PARENT(TRUE)
	SEND_SIGNAL(src, COMSIG_ITEM_REMOVED_INVENTORY, user)

/obj/item/stack/update_overlays()
	. = ..()
	if(isturf(loc))
		return
	var/mutable_appearance/number = mutable_appearance()
	number.maptext = MAPTEXT(amount)
	. += number

/obj/item/stack/equipped(mob/user, slot)
	. = ..()
	update_icon()

/obj/item/stack/removed_from_inventory(mob/user)
	. = ..()
	update_icon()

/obj/item/stack/dropped(mob/user, silent)
	. = ..()
	update_icon()

/obj/item/stack/Initialize(mapload, new_amount, merge, list/mat_override, mat_amt)
	. = ..()
	update_icon()
