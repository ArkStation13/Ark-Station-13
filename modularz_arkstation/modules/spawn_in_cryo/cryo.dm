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
	to_chat(sleepyhead, "<span class='boldnotice'>Вы начинаете просыпаться от продолжительного криосна...</span>")
	sleepyhead.SetSleeping(75)

	var/wakeupmessage = span_infoplain("&bull; Криокапсула содрогается, когда пневматические уплотнения, разделяющие вас и реальный мир, издают шипение.\n")
	if(prob(20))
		wakeupmessage += span_infoplain("&bull; Чувство тошноты и голода приветствуют вас при пробуждении.\n")
		sleepyhead.adjust_drowsiness(rand(3, 10) SECONDS)

	wakeupmessage += span_alien("&bull; До судного дня осталось... <b>X дней</b>.")
	to_chat(sleepyhead, examine_block(wakeupmessage))
