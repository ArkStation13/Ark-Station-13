// /mob/living/compose_message(atom/movable/speaker, datum/language/message_language, raw_message, radio_freq, list/spans, message_mode, face_name = FALSE, atom/movable/source)
// 	. = ..()
// 	if(isliving(speaker))
// 		var/list/hearers = get_hearers_in_range(5, source)
// 		var/turf/T = get_turf(src)
// 		if(T && hearers)
// 			for(hearers in range(5, speaker))
// 				spans += SPAN_SMALL_VOICE

/atom/movable
	/// How loudly we yell
	var/yell_power = 50
	/// last time we yelled
	var/last_yell = 0

/atom/movable/proc/process_yelling(list/already_heard, rendered, atom/movable/speaker, datum/language/message_language, message, list/spans, message_mode, obj/source)
	if(last_yell > (world.time - 10))
		to_chat(src, "<span class='warning'>Your voice doesn't project as far as you try to yell in such quick succession.")		// yeah no, no spamming an expensive floodfill.
		return
	last_yell = world.time
	var/list/overhearing = list()
	var/list/overhearing_text = list()
	overhearing = yelling_wavefill(src, yell_power)
	if(!overhearing.len)
		overhearing_text = "none"
	else
		for(var/mob/M as anything in overhearing)
			overhearing_text += key_name(M)
		overhearing_text = english_list(overhearing_text)
	//log_say("YELL: [ismob(src)? key_name(src) : src] yelled [message] with overhearing mobs [overhearing_text]")
	// overhearing = get_hearers_in_view(35, src) | get_hearers_in_range(5, src)
	overhearing -= already_heard
	if(!overhearing.len)
		return
	// to_chat(world, "DEBUG: overhearing [english_list(overhearing)]")
	for(var/_AM in overhearing)
		var/atom/movable/AM = _AM
		AM.Hear(rendered, speaker, message_language, message, null, spans, message_mode, source)

	return overhearing

/turf/closed
	/// How much we block yelling
	var/yelling_resistance = 10
	/// how much of inbound yelling to dampen
	var/yelling_dampen = 0.5

/turf/proc/get_yelling_resistance(power)
	. = 0
	// don't bother checking fulltile, we don't need accuracy
	var/obj/window = locate(/obj/structure/window) in src
	if(!window)
		window = locate(/obj/machinery/door/window) in src
	if(window)
		. += 4		// windows are minimally resistant
	// if there's more than one someone fucked up as that shouldn't happen
	var/obj/machinery/door/D = locate() in src
	if(D?.density)
		. += D.opacity? 29 : 19			// glass doors are slightly more resistant to screaming

/turf/closed/get_yelling_resistance(power)
	return yelling_resistance + (power * yelling_dampen)

/turf/open/space/get_yelling_resistance(power)
	return INFINITY				// no sound through space for crying out loud
