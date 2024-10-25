/obj/effect/overlay/has_gravity(turf/gravity_turf)
	return FALSE

/obj/effect/overlay/vis/steam // Ported // https://github.com/Artea-Station/Artea-Station-Server/pull/567
	plane = GRAVITY_PULSE_PLANE
	alpha = 64
	blend_mode = BLEND_ADD
	var/particle_type = /particles/smoke/steam/vent

/obj/effect/overlay/vis/steam/Initialize(mapload)
	. = ..()
	if(particle_type)
		particles = new particle_type()

/obj/effect/overlay/vis/steam/heavy
	particle_type = /particles/smoke/steam/vent/heavy

// Making Steam Vents using this effects:
// Start
/obj/structure/steam_vent
	plane = FLOOR_PLANE
	layer = ABOVE_OPEN_TURF_LAYER
	/// Fun distortion effect for when the vent is active
	var/obj/effect/overlay/vis/steam/steam = /obj/effect/overlay/vis/steam/heavy

/obj/structure/steam_vent/Destroy()
	. = ..()
	QDEL_NULL(steam)

/obj/structure/steam_vent/update_icon(updates)
	. = ..()

	if(!steam)
		return

	if(vent_active)
		vis_contents |= steam
	else
		vis_contents -= steam

/obj/structure/steam_vent/update_icon_state()
	. = ..()
	icon_state = "steam_vent[vent_active ? "": "_off"]"
// End
