/// Helper macro to check if the passed mob has jukebox sound preference enabled
// #define HAS_JUKEBOX_PREF(mob) (!QDELETED(mob) && !isnull(mob.client) && mob.client.prefs.read_preference(/datum/preference/toggle/sound_jukebox))

// /obj/machinery/jukebox
// 	name = "jukebox"
// 	desc = "A classic music player."
// 	icon = 'icons/obj/machines/music.dmi'
// 	icon_state = "jukebox"
// 	verb_say = "states"
// 	density = TRUE
// 	// req_access = list(ACCESS_BAR)
// 	/// Whether we're actively playing music
// 	var/active = FALSE
// 	/// List of weakrefs to mobs listening to the current song
// 	var/list/datum/weakref/rangers = list()
// 	/// World.time when the current song will stop playing, but also a cooldown between activations
// 	var/stop = 0
// 	/// List of /datum/tracks we can play
// 	var/list/songs = list()
// 	/// Current song selected
// 	var/datum/track/selection = null
// 	/// Volume of the songs played
// 	var/volume = 100

// /obj/machinery/jukebox/disco
// 	name = "radiant dance machine mark IV"
// 	desc = "The first three prototypes were discontinued after mass casualty incidents."
// 	icon = 'icons/obj/machines/music.dmi'
// 	icon_state = "disco"
// 	anchored = FALSE
// 	var/list/spotlights = list()
// 	var/list/sparkles = list()

/obj/machinery/jukebox/disco/indestructible
	name = "radiant dance machine mark V"
	desc = "Now redesigned with data gathered from the extensive disco and plasma research."
	anchored = TRUE
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	obj_flags = CAN_BE_HIT | NO_DECONSTRUCTION

/obj/machinery/jukebox/Initialize(mapload)
	. = ..()
	songs = SSjukeboxes.songs
	if(length(songs))
		selection = pick(songs)

/obj/machinery/jukebox/Destroy()
	dance_over()
	selection = null
	songs.Cut()
	return ..()

/obj/machinery/jukebox/attackby(obj/item/O, mob/user, params)
	if(!active && !(obj_flags & NO_DECONSTRUCTION))
		if(O.tool_behaviour == TOOL_WRENCH)
			if(!anchored && !isinspace())
				to_chat(user,span_notice("You secure [src] to the floor."))
				set_anchored(TRUE)
			else if(anchored)
				to_chat(user,span_notice("You unsecure and disconnect [src]."))
				set_anchored(FALSE)
			playsound(src, 'sound/items/deconstruct.ogg', 50, TRUE)
			return
	return ..()

/obj/machinery/jukebox/update_icon_state()
	. = ..()
	SSvis_overlays.remove_vis_overlay(src, managed_vis_overlays)
	luminosity = 0

	if(active)
		luminosity = 1
		SSvis_overlays.add_vis_overlay(src, icon, "active", layer, plane, dir, alpha)
		SSvis_overlays.add_vis_overlay(src, icon, "active", 0, EMISSIVE_PLANE, dir, alpha)

// overridden because the music playing to mobs is handled by the subsystem
/obj/machinery/jukebox/process()
	if(active && world.time >= stop)
		active = FALSE
		update_use_power(IDLE_POWER_USE)
		STOP_PROCESSING(SSobj, src)
		dance_over()
		playsound(src,'sound/machines/terminal_off.ogg',50,TRUE)
		update_appearance(UPDATE_ICON_STATE)
		stop = world.time + 100
