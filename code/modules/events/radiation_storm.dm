/datum/round_event_control/radiation_storm
	name = "Radiation Storm"
	typepath = /datum/round_event/radiation_storm
	max_occurrences = 1
	category = EVENT_CATEGORY_SPACE
	description = "На станцию обрушился радиационный шторм, вынудивший экипаж бежать в технические туннели."
	min_wizard_trigger_potency = 3
	max_wizard_trigger_potency = 7

/datum/round_event/radiation_storm


/datum/round_event/radiation_storm/setup()
	start_when = 3
	end_when = start_when + 1
	announce_when = 1

/datum/round_event/radiation_storm/announce(fake)
	priority_announce("Возле станции обнаружен высокий уровень радиации. Технические туннели лучше всего защищать от радиации.", "Anomaly Alert", ANNOUNCER_RADIATION)
	//sound not longer matches the text, but an audible warning is probably good

/datum/round_event/radiation_storm/start()
	SSweather.run_weather(/datum/weather/rad_storm)
