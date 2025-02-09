/datum/vote/transfer_vote
	name = "Autolaunch Ark"
	default_message = "Automatic vote to launch the Ark Ship (End of Round) \
		that cannot be recalled. Don't touch it unless it's not working \
		automatically."

/datum/controller/subsystem/shuttle
	/// Отмена!
	var/ark_round_end_cancell = FALSE

/datum/controller/subsystem/shuttle/autoEnd() // Конечная нахуй.
	priority_announce("Неизвестные сущности прорываются сквозь барьеры Солнечной Системы. План по запуску Ковчега приведён в исполнение. Персоналу Ковчега сохранять спокойствие, двигатели искажения Синего Пространства проводят предстартовую диагностику. 3 МИНУТЫ до готовности. Безопасного полета в будущее.", null, ANNOUNCER_KLAXON, "Terra", color_override = "purple")
	log_game("Round end vote passed. Roundend has been auto-called.")
	message_admins("Round end vote passed. Roundend has been auto-called.")
	emergency_no_escape = TRUE
	endvote_passed = TRUE
	SSevents.can_fire = FALSE

	INVOKE_ASYNC(SSvote, TYPE_PROC_REF(/datum/controller/subsystem/vote, initiate_vote), /datum/vote/map_vote, vote_initiator_name = "Map Rotation", forced = TRUE)

	// Последствия.
	addtimer(CALLBACK(src, PROC_REF(ark_goes_first)), 1 MINUTES)
	set_starlight("#88b487", 1.5, 1.5)

/datum/controller/subsystem/shuttle/proc/ark_goes_first()
	if(ark_round_end_cancell == TRUE)
		return
	addtimer(CALLBACK(src, PROC_REF(ark_goes_second)), 2 MINUTES)
	priority_announce("Пограничные миры Солнечной Системы уничтожены. 2 МИНУТЫ до запуска.", null, null, "Terra", color_override = "blue")
	sound_to_playing_players('modularz_arkstation/modules/starting_ark/siren.ogg', 70)
	set_starlight("#a0df9f", 3, 3)

/datum/controller/subsystem/shuttle/proc/ark_goes_second()
	if(ark_round_end_cancell == TRUE)
		return
	addtimer(CALLBACK(src, PROC_REF(ark_goes_third)), 10 SECONDS)
	priority_announce("Контакт с Террой утерян. Запуск через 10 СЕКУНД.", null, null, "Automatic", color_override = "red")
	set_starlight("#7fe07e", 6, 6)
	sound_to_playing_players('sound/effects/magic/lightning_chargeup.ogg')
	sound_to_playing_players('modular_nova/modules/alerts/sound/misc/delta_countdown.ogg')
	sleep(8 SECONDS)
	priority_announce("3... 2... 1...", null, null, "Automatic", color_override = "red")
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
	if(ark_round_end_cancell == TRUE)
		return
	// play_cinematic(/datum/cinematic/nuke/fake, world, CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(ending_helper)))
	for(var/mob/living/carbon/human/humans in GLOB.mob_list)
		for(var/turf/human_turfs in GLOB.station_turfs)
			if(humans.loc == human_turfs)
				humans.adjustStaminaLoss(30)
				humans.Paralyze(10)
				shake_camera(humans, 2, 3)
				humans.eyes_blink()
	sound_to_playing_players('sound/effects/magic/voidblink.ogg')
	set_starlight("#88b487", 1.5, 1.5)
	sleep(4 SECONDS)
	ending_helper()

// ГАЛЯ, У НАС ОТМЕНА
ADMIN_VERB(arkroundendcancell, R_ADMIN, "Disable/Enable Ark Launch", "Cancel or Enable it on every stage!", ADMIN_CATEGORY_EVENTS)
	SSshuttle.ark_round_end_cancell = !SSshuttle.ark_round_end_cancell
	log_admin("[key_name(usr)] has cancelled/enabled round end.")
	message_admins("[key_name_admin(usr)] has cancelled/enabled round end.")
