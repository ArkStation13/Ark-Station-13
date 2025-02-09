/obj/item/ammo_casing/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	bounce_away(bounce_angle = rand(0, 360), spread_multiplier = 0.75, still_warm = FALSE, sound_delay = 0)
	return ..()

/obj/item/ammo_casing/bounce_away(bounce_angle, spread_multiplier = 1, pixel_mess = TRUE, still_warm = FALSE, sound_delay = 3)
	// if(!heavy_metal)
	// 	return
	update_appearance()
	var/turf/our_turf = get_turf(src)
	if(!our_turf)
		return
	if(pixel_mess)
		pixel_x = base_pixel_x + rand(-world.icon_size/4, world.icon_size/4)
		pixel_y = base_pixel_y + rand(-world.icon_size/4, world.icon_size/4)
	SpinAnimation(speed = 10, loops = 1)
	if(!isnull(bounce_angle))
		//cool awesome physics this is so sick tbh
		AddComponent(/datum/component/movable_physics, \
			physics_flags = MPHYSICS_QDEL_WHEN_NO_MOVEMENT, \
			angle = bounce_angle, \
			horizontal_velocity = rand(4.5 * 100, 5.5 * 100) * spread_multiplier * 0.01, \
			vertical_velocity = -rand(4 * 100, 4.5 * 100) * spread_multiplier * 0.01, \
			horizontal_friction = rand(0.2 * 100, 0.24 * 100) * spread_multiplier * 0.01, \
			vertical_friction = 10 * spread_multiplier * 0.05, \
			z_floor = 0, \
		)
	if(still_warm && our_turf.bullet_sizzle)
		addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(playsound), src, 'sound/items/tools/welder.ogg', 20, 1), sound_delay) //If the turf is made of water and the shell casing is still hot, make a sizzling sound when it's ejected.
	else if(our_turf.bullet_bounce_sound)
		addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(playsound), src, our_turf.bullet_bounce_sound, 20, 1), sound_delay) //Soft / non-solid turfs that shouldn't make a sound when a shell casing is ejected over them.
