GLOBAL_LIST_EMPTY(valid_for_spawn_cryopods)

/obj/machinery/cryopod
	var/can_human_spawn_here = TRUE // ARK STATION ADDITION

/obj/machinery/cryopod/prison
	can_human_spawn_here = FALSE // ARK STATION ADDITION

/atom/proc/join_player_here(mob/M)
	// By default, just place the mob on the same turf as the marker or whatever.
	M.forceMove(get_turf(src))

/obj/machinery/cryopod/join_player_here(mob/M)
	. = ..()
	close_machine(M, TRUE, TRUE)

/obj/machinery/cryopod/proc/apply_effects_to_mob(mob/living/carbon/sleepyhead)
	to_chat(sleepyhead, "<span class='boldnotice'>You begin to wake from cryosleep...</span>")
	sleepyhead.SetSleeping(75)

	var/wakeupmessage = "The cryopod shudders as the pneumatic seals separating you and the waking world let out a hiss."
	if(prob(60))
		wakeupmessage += " A sickly feeling along with the pangs of hunger greet you upon your awakening."
		sleepyhead.adjust_drowsiness(rand(3, 10) SECONDS)
	to_chat(sleepyhead, span_danger(examine_block(wakeupmessage)))
