/obj/item/gun/energy/event_horizon
	name = "\improper Event Horizon anti-existential beam rifle"
	desc = "The deranged minds of Nanotrasen, in their great hubris and spite, have birthed forth the definitive conclusion to the arms race. Weaponized black holes, and a platform to deliver them.\
		To look upon this existential maleficence is to know that the pursuit of profit has consigned all life to this pathetic conclusion; the destruction of reality itself."
	icon = 'icons/obj/weapons/guns/energy.dmi'
	icon_state = "esniper"
	inhand_icon_state = null
	worn_icon_state = null
	fire_sound = 'sound/weapons/beam_sniper.ogg'
	slot_flags = ITEM_SLOT_BACK
	force = 20 //This is maybe the sanest part of this weapon.
	custom_materials = null
	recoil = 2
	ammo_x_offset = 3
	ammo_y_offset = 3
	modifystate = FALSE
	charge_sections = 1
	weapon_weight = WEAPON_HEAVY
	w_class = WEIGHT_CLASS_BULKY
	ammo_type = list(/obj/item/ammo_casing/energy/event_horizon)
	selfcharge = TRUE
	self_charge_amount = STANDARD_ENERGY_GUN_SELF_CHARGE_RATE * 10

/obj/item/gun/energy/event_horizon/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/scope, range_modifier = 4)

/obj/item/gun/energy/event_horizon/process_fire(atom/target, mob/living/user, message, params, zone_override, bonus_spread)

	if(!HAS_TRAIT(user, TRAIT_USER_SCOPED))
		balloon_alert(user, "must be scoped!")
		return
<<<<<<< HEAD
	INVOKE_ASYNC(src, PROC_REF(start_aiming), params)
	RegisterSignal(source, COMSIG_CLIENT_MOUSEDRAG, PROC_REF(on_mouse_drag))
	RegisterSignal(source, COMSIG_CLIENT_MOUSEUP, PROC_REF(on_mouse_up))

///Stop aiming and fire the beam if charged enough
/obj/item/gun/energy/beam_rifle/proc/on_mouse_up(client/source, atom/movable/object, location, control, params)
	SIGNAL_HANDLER
	if(!object.IsAutoclickable())
		return
	process_aim(params)
	UnregisterSignal(source, list(COMSIG_CLIENT_MOUSEDRAG, COMSIG_CLIENT_MOUSEUP))
	if(aiming_time_left <= aiming_time_fire_threshold && check_user())
		sync_ammo()
		var/atom/target = source.mouse_object_ref?.resolve()
		if(target)
			INVOKE_ASYNC(src, PROC_REF(afterattack), target, source.mob, FALSE, source.mouseParams, passthrough = TRUE)
	stop_aiming()
	QDEL_LIST(current_tracers)

/obj/item/gun/energy/beam_rifle/afterattack(atom/target, mob/living/user, flag, params, passthrough = FALSE)
	. |= AFTERATTACK_PROCESSED_ITEM
	if(flag) //It's adjacent, is the user, or is on the user's person
		if(target in user.contents) //can't shoot stuff inside us.
			return
		if(!ismob(target) || user.combat_mode) //melee attack
			return
		if(target == user && user.zone_selected != BODY_ZONE_PRECISE_MOUTH) //so we can't shoot ourselves (unless mouth selected)
			return
	if(!passthrough && (aiming_time > aiming_time_fire_threshold))
		return
	if(lastfire > world.time + delay)
		return
	lastfire = world.time
	. = ..()
	stop_aiming()

/obj/item/gun/energy/beam_rifle/proc/sync_ammo()
	for(var/obj/item/ammo_casing/energy/beam_rifle/AC in contents)
		AC.sync_stats()
=======
>>>>>>> 664d1720f62... [MIRROR] Event Horizon Anti-Existential Beam Rifle. The ultimate conclusion to the arms race and the sniper's art. [MDB IGNORE] (#3166)

	. = ..()
	message_admins("[ADMIN_LOOKUPFLW(user)] has fired an anti-existential beam at [ADMIN_VERBOSEJMP(user)].")

/obj/item/ammo_casing/energy/event_horizon
	projectile_type = /obj/projectile/beam/event_horizon
	select_name = "doomsday"
	e_cost = LASER_SHOTS(1, STANDARD_CELL_CHARGE)
	fire_sound = 'sound/weapons/beam_sniper.ogg'

/obj/projectile/beam/event_horizon
	name = "anti-existential beam"
	icon = null
	hitsound = 'sound/effects/explosion3.ogg'
	damage = 100 // Does it matter?
	damage_type = BURN
	armor_flag = ENERGY
	range = 150
	jitter = 20 SECONDS
	hitscan = TRUE
	tracer_type = /obj/effect/projectile/tracer/tracer/beam_rifle

/obj/projectile/beam/event_horizon/on_hit(atom/target, blocked, pierce_hit)
	. = ..()

	// Where we droppin' boys?
	var/turf/rift_loc = get_turf(target)

	// Spawn our temporary rift, then activate it.
	var/obj/reality_tear/temporary/tear = new(rift_loc)
	tear.start_disaster()
	message_admins("[ADMIN_LOOKUPFLW(target)] has been hit by an anti-existential beam at [ADMIN_VERBOSEJMP(rift_loc)], creating a singularity.")
