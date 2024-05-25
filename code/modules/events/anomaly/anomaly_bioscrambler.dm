/datum/round_event_control/anomaly/anomaly_bioscrambler
	name = "Anomaly: Bioscrambler"
	typepath = /datum/round_event/anomaly/anomaly_bioscrambler

	min_players = 10
	max_occurrences = 5
	weight = 20
	description = "Эта аномалия заменяет конечности находящихся рядом людей."
	min_wizard_trigger_potency = 0
	max_wizard_trigger_potency = 2

/datum/round_event/anomaly/anomaly_bioscrambler
	start_when = ANOMALY_START_MEDIUM_TIME
	announce_when = ANOMALY_ANNOUNCE_MEDIUM_TIME
	anomaly_path = /obj/effect/anomaly/bioscrambler

/datum/round_event/anomaly/anomaly_bioscrambler/announce(fake)
	if(isnull(impact_area))
		impact_area = placer.findValidArea()
	priority_announce("Биологический limb замены конечностей обнаружен на [ANOMALY_ANNOUNCE_MEDIUM_TEXT] [impact_area.name]. Наденьте биокостюмы или другое защитное снаряжение, чтобы противостоять последствиям. Расчетный период полураспада %9£$T$%F3 года.", "Anomaly Alert", ANNOUNCER_ANOMALIES) //NOVA EDIT CHANGE - ORIGINAL: 	priority_announce("Biologic limb swapping agent detected on [ANOMALY_ANNOUNCE_MEDIUM_TEXT] [impact_area.name]. Wear biosuits or other protective gear to counter the effects. Calculated half-life of %9£$T$%F3 years.", "Anomaly Alert")
