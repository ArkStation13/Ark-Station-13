/obj/item/flashlight/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	. = ..()
	if(!light_on)
		return
	if(light_system == OVERLAY_LIGHT_DIRECTIONAL)
		var/datum/component/overlay_lighting/OL = GetComponent(/datum/component/overlay_lighting)
		if(!OL)
			return
		var/turf/T = get_turf(target)
		if(istype(T, /obj/effect/abstract/light_spot))
			return
		OL.place_directional_light(T)

/obj/effect/abstract/light_spot
	icon = 'modularz_arkstation/modules/dynamic_flashlight/eris_flashlight.dmi'
	icon_state = "medium"
	pixel_x = -16
	pixel_y = -16
	layer = FLY_LAYER
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT

/obj/effect/abstract/directional_lighting
	var/obj/effect/abstract/light_spot/light_spot = new
	var/trans_angle
	var/icon_dist
	plane = ABOVE_GAME_PLANE
	layer = FLY_LAYER
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT

/obj/effect/abstract/directional_lighting/Initialize()
	. = ..()
	vis_contents += light_spot

/obj/effect/abstract/directional_lighting/proc/face_light(atom/movable/source, angle, distance)
	if(!loc)
		return

	if(angle != trans_angle)
		trans_angle = angle
		light_spot.transform = initial(light_spot.transform)
		light_spot.transform = turn(light_spot.transform, angle)

	if(icon_dist != distance)
		icon_dist = distance
		switch(distance)
			if(0)
				light_spot.icon_state = "vclose"
			if(1)
				light_spot.icon_state = "close"
			if(2)
				light_spot.icon_state = "medium"
			if(3 to INFINITY)
				light_spot.icon_state = "far"

/obj/effect/abstract/directional_lighting/Destroy(force)
	if(!force)
		stack_trace("Directional light atom deleted, but not by our component")
		return QDEL_HINT_LETMELIVE

	vis_contents.Cut()
	qdel(light_spot)

	return ..()
