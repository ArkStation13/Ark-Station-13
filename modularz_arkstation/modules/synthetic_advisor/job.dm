GLOBAL_LIST_EMPTY(SynthAdvisors)

/datum/job/synthetic_advisor
	title = JOB_SYNTHETIC_ADVISOR
	description = "Вы - Синтетический Советник экипажа Ковчега, произведенный на Новом Вавилоне. Следуйте приказам ИИ, текущим законам, помогайте экипажу советом."
	auto_deadmin_role_flags = DEADMIN_POSITION_SILICON
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	supervisors = "your laws and the AI"
	minimal_player_age = 21
	exp_requirements = 120
	exp_required_type = EXP_TYPE_CREW
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "SYNTH_ADVISOR"
	spawn_type = /mob/living/carbon/human/species/synth

	display_order = JOB_DISPLAY_ORDER_ADVISOR

	species_whitelist = list(SPECIES_SYNTH)

	departments_list = list(
		/datum/job_department/silicon,
		)
	random_spawns_possible = FALSE
	job_flags = JOB_NEW_PLAYER_JOINABLE | JOB_EQUIP_RANK | JOB_CANNOT_OPEN_SLOTS | JOB_CREW_MEMBER | JOB_CREW_MANIFEST | JOB_ANNOUNCE_ARRIVAL

/datum/job/synthetic_advisor/after_spawn(mob/living/spawned, client/player_client)
	. = ..()
	if(issynthetic(spawned))
		var/mob/living/carbon/human/species/synth/advisor = spawned
		advisor.TryConnectToAi()
		advisor.synthbrain = advisor.get_organ_by_type(/obj/item/organ/internal/brain/synth)
		advisor.synthbrain.internal_computer.starting_programs += list(advisor.robotact)

/mob/living/carbon/human/species/synth
	var/mob/living/silicon/ai/connected_ai = null
	var/datum/ai_laws/laws = null
	var/lawupdate = TRUE
	var/datum/computer_file/program/robotact/robotact
	var/obj/item/organ/internal/brain/synth/synthbrain

/mob/living/carbon/human/species/synth/proc/TryConnectToAi()
	set_connected_ai(select_active_ai_with_fewest_borgs(z))
	if(connected_ai)
		lawsync()
		lawupdate = TRUE
		return TRUE
	return FALSE

/mob/living/carbon/human/species/synth/proc/set_connected_ai(new_ai)
	if(connected_ai == new_ai)
		return
	. = connected_ai
	connected_ai = new_ai
	if(.)
		var/mob/living/silicon/ai/old_ai = .
		old_ai.connected_robots -= src
	if(connected_ai)
		connected_ai.connected_robots |= src

/mob/living/carbon/human/species/synth/proc/lawsync()
	laws_sanity_check()
	var/datum/ai_laws/master = connected_ai?.laws
	var/temp
	if(master)
		laws.ion.len = master.ion.len
		for (var/index in 1 to master.ion.len)
			temp = master.ion[index]
			if (length(temp) > 0)
				laws.ion[index] = temp

		laws.hacked.len = master.hacked.len
		for (var/index in 1 to master.hacked.len)
			temp = master.hacked[index]
			if (length(temp) > 0)
				laws.hacked[index] = temp

		if(master.zeroth_borg) //If the AI has a defined law zero specifically for its borgs, give it that one, otherwise give it the same one. --NEO
			temp = master.zeroth_borg
		else
			temp = master.zeroth
		laws.zeroth = temp

		laws.inherent.len = master.inherent.len
		for (var/index in 1 to master.inherent.len)
			temp = master.inherent[index]
			if (length(temp) > 0)
				laws.inherent[index] = temp

		laws.supplied.len = master.supplied.len
		for (var/index in 1 to master.supplied.len)
			temp = master.supplied[index]
			if (length(temp) > 0)
				laws.supplied[index] = temp

		if(robotact)
			var/datum/tgui/active_ui = SStgui.get_open_ui(src, robotact.computer)
			if(active_ui)
				active_ui.send_full_update()

/mob/living/carbon/human/species/synth/proc/laws_sanity_check()
	if(!laws)
		make_laws()

/mob/living/carbon/human/species/synth/proc/make_laws()
	laws = new /datum/ai_laws
	laws.set_laws_config()
	laws.associate(src)

/mob/living/carbon/human/species/synth/proc/is_advisor(mob/living/carbon/human/species/synth/user)
	if(user.job == JOB_SYNTHETIC_ADVISOR)
		return TRUE
	return FALSE

/mob/living/carbon/human/species/synth/verb/check_laws()
	set category = "Drone"
	set name = "Check Laws"

	if(!is_advisor(src))
		return
	to_chat(src, "<b>Current Laws</b>")
	to_chat(src, laws)
