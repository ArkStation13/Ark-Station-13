/particles/firing_smoke // Ported from DS13 - 2.0
	icon = 'modularz_arkstation/modules/smoking-guns/96x96.dmi'
	icon_state = "smoke"
	width = 500
	height = 500
	count = 5
	spawning = 15
	lifespan = 0.5 SECONDS
	fade = 2.4 SECONDS
	grow = 0.12
	drift = generator(GEN_CIRCLE, 8, 8)
	scale = 0.1
	spin = generator(GEN_NUM, -20, 20)
	velocity = list(50, 0)
	friction = generator(GEN_NUM, 0.3, 0.6)

/obj/item/gun
	var/smoking_gun = FALSE

/obj/item/gun/ballistic/bow
	smoking_gun = FALSE

/obj/item/gun/ballistic
	smoking_gun = TRUE

/obj/item/gun/shoot_live_shot(mob/living/user, pointblank, atom/pbtarget, message)
	. = ..()
	if(smoking_gun)
		var/x_component = sin(get_angle(user, pbtarget)) * 40
		var/y_component = cos(get_angle(user, pbtarget)) * 40
		var/obj/effect/abstract/particle_holder/gun_smoke = new(get_turf(src), /particles/firing_smoke)
		gun_smoke.particles.velocity = list(x_component, y_component)
		addtimer(VARSET_CALLBACK(gun_smoke.particles, count, 0), 5)
		addtimer(VARSET_CALLBACK(gun_smoke.particles, drift, 0), 3)
		QDEL_IN(gun_smoke, 0.6 SECONDS)
