/datum/round_event_control/wizard/tower_of_babel
	name = "Tower of Babel"
	weight = 3
	typepath = /datum/round_event/wizard/tower_of_babel
	max_occurrences = 1
	earliest_start = 0 MINUTES
	description = "Каждый забывает свой текущий язык и получает случайный язык."
	min_wizard_trigger_potency = 5
	max_wizard_trigger_potency = 7

/datum/round_event/wizard/tower_of_babel/start()
	GLOB.tower_of_babel = new /datum/tower_of_babel()

