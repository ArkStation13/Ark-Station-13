/datum/round_event_control/communications_blackout
	name = "Communications Blackout"
	typepath = /datum/round_event/communications_blackout
	weight = 30
	category = EVENT_CATEGORY_ENGINEERING
	description = "Сильно ослабляет все телекоммуникационные машины, блокируя на некоторое время всю связь."
	min_wizard_trigger_potency = 0
	max_wizard_trigger_potency = 3

/datum/round_event/communications_blackout
	announce_when = 1

/datum/round_event/communications_blackout/announce(fake)
	var/alert = pick( "Обнаружены ионосферные аномалии. Временный сбой в телекоммуникации неизбежен. Пожалуйста, свяжитесь с ваши*%fj00)`5vc-BZZT",
		"Обнаружены ионосферные аномалии. Временный сбой связи*3mga;b4;'1v¬-BZZZT",
		"Обнаружены ионосферные аномалии. Временный телеком#MCi46:5.;@63-BZZZZT",
		"Ионосферные аномалии dete'fZ\\kg5_0-BZZZZZT",
		"Ионосферн:%£ MCayj^j<.3-BZZZZZZT",
		"#4nd%;f4y6,>£%-BZZZZZZZT",
	)

	for(var/mob/living/silicon/ai/A in GLOB.ai_list) //AIs are always aware of communication blackouts.
		to_chat(A, "<br>[span_warning("<b>[alert]</b>")]<br>")

	if(prob(30) || fake) //most of the time, we don't want an announcement, so as to allow AIs to fake blackouts.
		priority_announce(alert, "Anomaly Alert", sound = ANNOUNCER_COMMSBLACKOUT) //NOVA EDIT CHANGE - ORIGINAL: priority_announce(alert, "Anomaly Alert")


/datum/round_event/communications_blackout/start()
	for(var/obj/machinery/telecomms/T in GLOB.telecomms_list)
		T.emp_act(EMP_HEAVY)
