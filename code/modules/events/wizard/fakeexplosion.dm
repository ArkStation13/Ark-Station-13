/datum/round_event_control/wizard/fake_explosion //Oh no the station is gone!
	name = "Fake Nuclear Explosion"
	weight = 0 //Badmin exclusive now because once it's expected its not funny
	typepath = /datum/round_event/wizard/fake_explosion
	max_occurrences = 1
	earliest_start = 0 MINUTES
	description = "Начинается ролик о ядерном взрыве, чтобы напугать команду."

/datum/round_event/wizard/fake_explosion/start()
	sound_to_playing_players('sound/machines/alarm.ogg')
	addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(play_cinematic), /datum/cinematic/nuke/fake, world), 10 SECONDS)
