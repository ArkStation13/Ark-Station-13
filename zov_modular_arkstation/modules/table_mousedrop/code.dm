/obj/structure/table/MouseDrop_T(obj/item/O, mob/living/user, params)
	var/list/modifiers = params2list(params)
	if(ismob(O))
		return ..()

	else if(isturf(O.loc) && isitem(O))
		var/obj/item/I = O
		if(I.anchored)
			return

	if(iscarbon(user))
		var/mob/living/carbon/new_user = user
		if(!new_user.get_active_hand())
			return

	if(istype(O, /obj/item/storage))
		var/obj/item/storage/I = O
		if(I.storage_type && I == /datum/storage)
			I.storage_type.dump_content_at(drop_location(), user)
			return

	if(O.forceMove(drop_location()))
		if(!LAZYACCESS(modifiers, ICON_X) || !LAZYACCESS(modifiers, ICON_Y))
			return
		O.pixel_x = clamp(text2num(LAZYACCESS(modifiers, ICON_X)) - 16, -(world.icon_size/2), world.icon_size/2)
		O.pixel_y = clamp(text2num(LAZYACCESS(modifiers, ICON_Y)) - 16, -(world.icon_size/2), world.icon_size/2)
		O.add_fingerprint(user)
		AfterPutItemOnTable(O, user)
		return TRUE
	return ..()
