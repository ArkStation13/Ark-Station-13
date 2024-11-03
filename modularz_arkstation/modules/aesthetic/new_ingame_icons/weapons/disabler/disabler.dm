/obj/item/gun/energy/disabler
	icon = 'modularz_arkstation/modules/aesthetic/new_ingame_icons/weapons/disabler/disabler.dmi'
	shaded_charge = TRUE
	ammo_type = list(/obj/item/ammo_casing/energy/disabler, /obj/item/ammo_casing/energy/electrode/disabler)

/obj/item/ammo_casing/energy/electrode/disabler
	projectile_type = /obj/projectile/energy/electrode/disabler
	select_name = "stun"
	fire_sound = 'sound/items/weapons/taser3.ogg'
	e_cost = LASER_SHOTS(5, STANDARD_CELL_CHARGE)
	harmful = FALSE
	firing_effect_type = /obj/effect/temp_visual/dir_setting/firing_effect

/obj/projectile/energy/electrode/disabler
	name = "electrode"
	icon_state = "spark"
	color = COLOR_YELLOW
	paralyze = 1 SECONDS
	stutter = 5 SECONDS
	jitter = 20 SECONDS
	hitsound = 'sound/items/weapons/taserhit.ogg'
	range = 4
	tracer_type = /obj/effect/projectile/tracer/stun
	muzzle_type = /obj/effect/projectile/muzzle/stun
	impact_type = /obj/effect/projectile/impact/stun

/obj/projectile/energy/electrode/disabler/on_hit(atom/target, blocked = 0, pierce_hit)
	. = ..()
	if(!ismob(target) || blocked >= 100) //Fully blocked by mob or collided with dense object - burst into sparks!
		do_sparks(1, TRUE, src)
	else if(iscarbon(target))
		var/mob/living/carbon/C = target
		C.adjust_confusion_up_to(5 SECONDS, 15 SECONDS) // NOVA EDIT ADDITION - Electrode jitteriness
		C.add_mood_event("tased", /datum/mood_event/tased)
		SEND_SIGNAL(C, COMSIG_LIVING_MINOR_SHOCK)
		if(HAS_TRAIT(C, TRAIT_HULK))
			C.say(pick(";RAAAAAAAARGH!", ";HNNNNNNNNNGGGGGGH!", ";GWAAAAAAAARRRHHH!", "NNNNNNNNGGGGGGGGHH!", ";AAAAAAARRRGH!" ), forced = "hulk")
		else if(!C.check_stun_immunity(CANKNOCKDOWN))
			addtimer(CALLBACK(C, TYPE_PROC_REF(/mob/living/carbon, do_jitter_animation), 20), 0.5 SECONDS)

// Other
/obj/item/gun/energy/disabler/smoothbore
	icon = 'icons/obj/weapons/guns/energy.dmi'

/obj/item/gun/energy/disabler/smoothbore/prime
	icon = 'icons/obj/weapons/guns/energy.dmi'

/obj/item/gun/energy/disabler/smg
	icon = 'icons/obj/weapons/guns/energy.dmi'
