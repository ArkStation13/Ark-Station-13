/obj/effect/abstract/interact
	name = "You shouldn't see this!"
	icon = 'modularz_arkstation/modules/monkestation_addons/interact-particles/interact.dmi'
	icon_state = "interact"
	alpha = 180
	plane = POINT_PLANE
	layer = ABOVE_ALL_MOB_LAYER

/mob/proc/animate_interact(mob/living/target, state)
	set waitfor = FALSE

	var/list/origin_coords = get_hand_pixels()

	if(!origin_coords)
		return

	if(QDELETED(target))
		return

	var/turf/owner_loc = loc
	if(!isturf(owner_loc) || (!isturf(target.loc) && !isturf(target)))
		return

	var/obj/effect/abstract/interact/particle = new(null)

	var/x_offset = target.x - x
	var/y_offset = target.y - y

	particle.icon_state = state
	particle.loc = owner_loc
	particle.pixel_x = origin_coords[1]
	particle.pixel_y = origin_coords[2]
	//A matrix to animate towards. Saves copy pasting var declarations.
	var/matrix/animate_transform = matrix()
	//How long to wait before destroying the particle.
	var/destroy_after = 0.5 SECONDS
	switch(state)
		if(INTERACT_GENERIC, INTERACT_HELP, INTERACT_HARM, INTERACT_GRAB, INTERACT_DISARM)
			particle.alpha = 180
			animate_transform.Scale(0.3, 0.3)
			particle.transform = animate_transform

			animate(particle, transform = matrix(), time = 6, easing = BOUNCE_EASING)
			animate(pixel_x = (x_offset*32) + target.pixel_x, pixel_y = (y_offset*32) + target.pixel_y, time = 2, easing = BOUNCE_EASING, flags = ANIMATION_PARALLEL)

		if(INTERACT_PULL)
			particle.pixel_x = target.pixel_x + (x_offset*32)
			particle.pixel_y = target.pixel_y + (y_offset*32)
			particle.alpha = 200
			particle.transform = transform.Turn(rand(-40, 40))

			animate(particle, pixel_x = origin_coords[1], pixel_y = origin_coords[2], time = 2, easing = LINEAR_EASING)

		if(INTERACT_UNPULL)
			particle.alpha = 200

			animate(particle, pixel_x = target.pixel_x + (x_offset*32), pixel_y = target.pixel_y + (y_offset*32), time = 2, easing = LINEAR_EASING)

	sleep(destroy_after)

	particle.loc = null

///Returns a list of (x,y) coordinates, in pixel offsets.
/mob/proc/get_hand_pixels()
	RETURN_TYPE(/list)
	return list(0, 0)

/mob/living/carbon/get_hand_pixels()
	var/obj/item/bodypart/hand = has_active_hand()
	if(!hand)
		return null
	else
		return hand.get_offset(dir)

/obj/item/bodypart/proc/get_offset(direction)
	return null

/obj/item/bodypart/arm/right/get_offset(direction)
	switch(direction)
		if(NORTH)
			return list(6,-3)
		if(SOUTH)
			return list(-6,-3)
		if(EAST)
			return list(0,-3)
		if(WEST)
			return list(0,-3)

/obj/item/bodypart/arm/left/get_offset(direction)
	switch(direction)
		if(NORTH)
			return list(-6,-3)
		if(SOUTH)
			return list(6,-3)
		if(EAST)
			return list(0,-3)
		if(WEST)
			return list(0,-3)

/mob/living/UnarmedAttack(atom/A, proximity_flag, list/modifiers)
	. = ..()
	if(ismob(A))
		if(right_click_attack_chain(A, modifiers))
			animate_interact(A, INTERACT_DISARM)

		else if(combat_mode)
			animate_interact(A, INTERACT_HARM)

		else
			animate_interact(A, INTERACT_HELP)
	return

/mob/living/start_pulling(atom/movable/AM, state, force, supress_message)
	. = ..()
	animate_interact(AM, INTERACT_PULL)

/mob/living/stop_pulling()
	animate_interact(pulling, INTERACT_UNPULL)
	if(ismob(pulling))
		reset_pull_offsets(pulling)
	..()
	update_pull_movespeed()
	update_pull_hud_icon()
