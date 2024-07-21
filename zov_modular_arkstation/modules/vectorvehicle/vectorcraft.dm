/datum/velocity_vector
	var/vx = 0
	var/vy = 0

/datum/velocity_vector/proc/vec_length()
	return sqrt((vx * vx) + (vy* vy))

/datum/velocity_vector/proc/normalized()
	var/mag_inv = 1/src.vec_length()
	var/datum/velocity_vector/norm_vec = new type
	norm_vec.vx = src.vx * mag_inv
	norm_vec.vy = src.vy * mag_inv
	return norm_vec



/obj/vehicle/sealed/vectorcraft
	name = "all-terrain hovercraft"
	desc = "An all-terrain vehicle built for traversing rough terrain with ease. One of the few old-Earth technologies that are still relevant on most planet-bound outposts."
	icon = 'zov_modular_arkstation/modules/spacepods/icons/pods/raptor.dmi'
	icon_state = "raptor-on"
	animate_movement = 0
	max_integrity = 1000
	var/datum/velocity_vector/velocity
	var/datum/velocity_vector/norm_vec
	var/speed = 1
	var/angle = 0
	var/max_velocity = 10
	var/air_resistance = 0.2
	var/shift = 270
	var/pixel_shift = -32
	var/pixelmovement_x = 0
	var/pixelmovement_y = 0
	var/last_moved_by_player = 0
	var/had_see_turfs = FALSE
	var/mob/living/carbon/human/driver
	var/obj/item/tank/internals/oxygen/gas


/obj/vehicle/sealed/vectorcraft/Initialize(mapload)
	. = ..()
	gas = new(src)
	velocity = new(src)

/obj/vehicle/sealed/vectorcraft/mob_enter(mob/living/M)
	if(!driver)
		driver = M
	START_PROCESSING(SSvectorcraft, src)
	return ..()

/obj/vehicle/sealed/vectorcraft/handle_internal_lifeform(mob/lifeform_inside_me, breath_request)
    if(breath_request <= 0)
        return null

    var/breath_percentage = breath_request / gas.volume
    . = gas.remove_air(gas.air_contents.total_moles() * breath_percentage)

/obj/vehicle/sealed/vectorcraft/mob_exit(mob/living/M, silent = FALSE, randomstep = FALSE)
	if((abs(velocity.vx) + abs(velocity.vy)) > 1)
		return

	. = ..()
	if(!driver)
		return
	if(driver.client)
		driver.client.pixel_x = 0
		driver.client.pixel_y = 0
	driver.pixel_x = 0
	driver.pixel_y = 0
	driver.clear_sight(SEE_TURFS)
	if(M == driver)
		driver = null
	STOP_PROCESSING(SSvectorcraft, src)

/obj/vehicle/sealed/vectorcraft/proc/apply_damage(damage)
    atom_integrity -= damage
    // var/healthratio = ((atom_integrity/max_integrity)/4) + 0.75

    if(atom_integrity <= 0)
        mob_exit(driver)
        var/datum/effect_system/reagents_explosion/e = new()
        var/turf/T = get_turf(src)
        e.set_up(1, T, 1, 3)
        e.start()
        visible_message("The [src] explodes from taking too much damage!")
        qdel(src)
    if(atom_integrity > max_integrity)
        atom_integrity = max_integrity

/obj/vehicle/sealed/vectorcraft/vehicle_move(cached_direction)
	last_moved_by_player = world.realtime
	if(cached_direction == NORTH)
		velocity.vy += cos(angle) * speed
		velocity.vx += sin(angle) * speed
	if(cached_direction == NORTHEAST)
		velocity.vy += cos(angle+45) * speed
		velocity.vx += sin(angle+45)  * speed
		angle += 12
	if(cached_direction == EAST)
		angle += 12
	if(cached_direction == SOUTHEAST)
		velocity.vy += cos(angle+135) * speed
		velocity.vx += sin(angle+135) * speed
		angle += 12
	if(cached_direction == SOUTH)
		velocity.vy += cos(angle+180) * speed
		velocity.vx += sin(angle+180) * speed
	if(cached_direction == SOUTHWEST)
		velocity.vy += cos(angle+225) * speed
		velocity.vx += sin(angle+255) * speed
		angle -= 12
	if(cached_direction == WEST)
		angle -= 12
	if(cached_direction == NORTHWEST)
		velocity.vy += cos(angle+225) * speed
		velocity.vx += sin(angle+255) * speed
		angle -= 12


	if(velocity.vec_length() > max_velocity)
		norm_vec = velocity.normalized()
		velocity.vx = norm_vec.vx * max_velocity
		velocity.vy = norm_vec.vy * max_velocity

	if(angle > 360)
		angle = 0

	var/matrix/M = matrix()
	transform = M.Turn(angle)

/obj/vehicle/sealed/vectorcraft/proc/calc_angle()
	norm_vec = velocity.normalized()
	if(norm_vec.vx > 0.9)
		return WEST
	if(norm_vec.vx < 0.1)
		return EAST
	if(norm_vec.vy < 0.1)
		return EAST
	if(norm_vec.vy < 0.1)
		return EAST

/obj/vehicle/sealed/vectorcraft/proc/bounce()
	velocity.vx = -velocity.vx/2
	velocity.vy = -velocity.vy/2

/obj/vehicle/sealed/vectorcraft/proc/crash_into()
	var/speed = abs(velocity.vx) + abs(velocity.vy)
	apply_damage(speed)
	bounce()

/obj/vehicle/sealed/vectorcraft/Bump(atom/M)
	var/speed = abs(velocity.vx) + abs(velocity.vy)
	if(isliving(M))
		var/mob/living/C = M
		if(!C.anchored)
			var/atom/throw_target = get_edge_target_turf(C, calc_angle())
			C.throw_at(throw_target, 10, 14)
		to_chat(C, "<span class='warning'><b>You are hit by the [src]!</b></span>")
		to_chat(driver, "<span class='warning'><b>You just ran into [C] you crazy lunatic!</b></span>")
		C.adjustBruteLoss(speed/10)
		return ..()
	if(istype(M, /obj/vehicle/sealed/vectorcraft))
		var/obj/vehicle/sealed/vectorcraft/Vc = M
		Vc.apply_damage(speed/5)
		velocity.vx += velocity.vx/2
		velocity.vy += velocity.vy/2
		apply_damage(speed/10)
		bounce()
		return ..()

	if(istype(M, /obj/))
		var/obj/O = M
		if(O.density)
			O.take_damage(speed*2.5)

	return ..()

/obj/vehicle/sealed/vectorcraft/proc/check_obstacle(atom/step)
	var/turf/T = get_offset_target_turf(src, step.x, step.y)
	for(var/atom/A in T.contents)
		Bump(A)
		if(A.density)
			crash_into()
			return FALSE
		if(T.density)
			crash_into()
			return FALSE
	return TRUE

/obj/vehicle/sealed/vectorcraft/process()

	pixelmovement_x += velocity.vx
	pixelmovement_y += velocity.vy
	if(pixelmovement_x > 32)
		var/atom/dist = get_step(src, EAST)
		if(check_obstacle(dist))
			forceMove(dist)
			pixelmovement_x -= 32
	if(pixelmovement_x < 0)
		var/atom/dist = get_step(src, WEST)
		if(check_obstacle(dist))
			forceMove(get_step(src, WEST))
			pixelmovement_x += 32
	if(pixelmovement_y > 32)
		var/atom/dist = get_step(src, NORTH)
		if(check_obstacle(dist))
			forceMove(get_step(src, NORTH))
			pixelmovement_y -= 32
	if(pixelmovement_y < 0)
		var/atom/dist = get_step(src, SOUTH)
		if(check_obstacle(dist))
			forceMove(get_step(src, SOUTH))
			pixelmovement_y += 32

	pixel_x = pixelmovement_x + pixel_shift
	pixel_y = pixelmovement_y + pixel_shift

	driver.client.pixel_x = pixel_x
	driver.client.pixel_y = pixel_y

	if(last_moved_by_player+7 > world.realtime)
		norm_vec = velocity.normalized()
		velocity.vx = min(velocity.vx - norm_vec.vx * air_resistance, 0)
		velocity.vy = min(velocity.vy - norm_vec.vy * air_resistance, 0)

	if(driver.throw_mode || last_moved_by_player+7 < world.realtime)
		velocity.vx *= 0.7
		velocity.vy *= 0.7
