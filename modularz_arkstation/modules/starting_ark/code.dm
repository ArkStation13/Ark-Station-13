/datum/controller/subsystem/shuttle/autoEnd() // Конечная нахуй.
	priority_announce("Unknown entities are breaking through the barriers of the Solar System. The Ark plan has been executed. Ark personnel remain calm, Bluespace engines are conducting pre-launch diagnostics. 3 MINUTES until readiness. Have a safe flight into the future.", null, ANNOUNCER_KLAXON, "Priority", color_override = "green")
	log_game("Round end vote passed. Roundend has been auto-called.")
	message_admins("Round end vote passed. Roundend has been auto-called.")
	emergency_no_escape = TRUE
	endvote_passed = TRUE
	SSevents.can_fire = FALSE

	// Последствия.
	addtimer(CALLBACK(src, PROC_REF(ark_goes_first)), 1 MINUTES)
	set_starlight("#88b487", 1.5, 1.5)

/datum/controller/subsystem/shuttle/proc/ark_goes_first()
	addtimer(CALLBACK(src, PROC_REF(ark_goes_second)), 2 MINUTES)
	priority_announce("Border worlds destroyed. 2 minutes to launch.", null, null, "Priority", color_override = "blue")
	sound_to_playing_players('modularz_arkstation/modules/starting_ark/siren.ogg')
	set_starlight("#a0df9f", 3, 3)

/datum/controller/subsystem/shuttle/proc/ark_goes_second()
	addtimer(CALLBACK(src, PROC_REF(ark_goes_third)), 10 SECONDS)
	priority_announce("Contact with Terra lost. Launch in 10 seconds.", null, null, "Priority", color_override = "red")
	set_starlight("#7fe07e", 6, 6)
	sound_to_playing_players('sound/effects/magic/lightning_chargeup.ogg')
	sound_to_playing_players('modular_nova/modules/alerts/sound/misc/delta_countdown.ogg')
	sleep(8 SECONDS)
	priority_announce("3... 2... 1...", null, null, "Priority", color_override = "red")
	sound_to_playing_players('sound/effects/explosion/explosioncreak2.ogg')
	for(var/mob/living/carbon/human/humans in GLOB.mob_list)
		for(var/turf/human_turfs in GLOB.station_turfs)
			if(humans.loc == human_turfs)
				humans.adjustStaminaLoss(30)
				humans.Paralyze(10)
				shake_camera(humans, 2, 3)
	sleep(2 SECONDS)
	sound_to_playing_players('sound/effects/magic/lightningbolt.ogg')

/datum/controller/subsystem/shuttle/proc/ark_goes_third()
	play_cinematic(/datum/cinematic/nuke/fake, world, CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(ending_helper)))
	set_starlight("#88b487", 1.5, 1.5)
