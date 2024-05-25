/datum/round_event_control/wizard/ghost //The spook is real
	name = "G-G-G-Ghosts!"
	weight = 3
	typepath = /datum/round_event/wizard/ghost
	max_occurrences = 1
	earliest_start = 0 MINUTES
	description = "Призраки становятся видимыми."
	min_wizard_trigger_potency = 0
	max_wizard_trigger_potency = 7

/datum/round_event/wizard/ghost/start()
	var/msg = span_warning("Вы внезапно чувствуете себя совершенно очевидным...")
	set_observer_default_invisibility(0, msg)


//--//

/datum/round_event_control/wizard/possession //Oh shit
	name = "Possessing G-G-G-Ghosts!"
	weight = 2
	typepath = /datum/round_event/wizard/possession
	max_occurrences = 5
	earliest_start = 0 MINUTES
	description = "Призраки становятся видимыми и обретают силу одержимости.."

/datum/round_event/wizard/possession/start()
	for(var/mob/dead/observer/G in GLOB.player_list)
		add_verb(G, /mob/dead/observer/verb/boo)
		add_verb(G, /mob/dead/observer/verb/possess)
		to_chat(G, "Вы внезапно чувствуете прилив новых жутких сил...")
