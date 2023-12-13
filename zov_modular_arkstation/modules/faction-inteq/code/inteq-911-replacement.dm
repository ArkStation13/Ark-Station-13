#define SOLFED_AMT "amount"
#define SOLFED_VOTES "votes"
#define SOLFED_DECLARED "declared"
#define SOLFED_FINE_AMOUNT -20000

#define EMERGENCY_RESPONSE_POLICE "WOOP WOOP THAT'S THE SOUND OF THE POLICE"
#define EMERGENCY_RESPONSE_ATMOS "DISCO INFERNO"
#define EMERGENCY_RESPONSE_EMT "AAAAAUGH, I'M DYING, I NEEEEEEEEEED A MEDIC BAG"
#define EMERGENCY_RESPONSE_EMAG "AYO THE PIZZA HERE"

GLOBAL_VAR(caller_of_911)
GLOBAL_VAR(call_911_msg)
GLOBAL_VAR(pizza_order)
GLOBAL_VAR_INIT(solfed_tech_charge, -15000)
GLOBAL_LIST_INIT(pizza_names, list(
	"Dixon Buttes",
	"I. C. Weiner",
	"Seymour Butz",
	"I. P. Freely",
	"Pat Myaz",
	"Vye Agra",
	"Harry Balsack",
	"Lee Nover",
	"Maya Buttreeks",
	"Amanda Hugginkiss",
	"Bwight K. Brute", // Github Copilot suggested dwight from the office like 10 times
	"John Nanotrasen",
	"Mike Rotch",
	"Hugh Jass",
	"Oliver Closeoff",
	"Hugh G. Recktion",
	"Phil McCrevis",
	"Willie Lickerbush",
	"Ben Dover",
	"Steve", // REST IN PEACE MAN
	"Avery Goodlay",
	"Anne Fetamine",
	"Amanda Peon",
	"Tara Newhole",
	"Penny Tration",
	"Joe Mama"
))
GLOBAL_LIST_INIT(emergency_responders, list())
GLOBAL_LIST_INIT(solfed_responder_info, list(
	"911_responders" = list(
		SOLFED_AMT = 0,
		SOLFED_VOTES = 0,
		SOLFED_DECLARED = FALSE
	),
	"swat" = list(
		SOLFED_AMT = 0,
		SOLFED_VOTES = 0,
		SOLFED_DECLARED = FALSE
	),
	"national_guard" = list(
		SOLFED_AMT = 0,
		SOLFED_VOTES = 0,
		SOLFED_DECLARED = FALSE
	),
	"dogginos" = list(
		SOLFED_AMT = 0,
		SOLFED_VOTES = 0,
		SOLFED_DECLARED = FALSE
	),
	"dogginos_manager" = list(
		SOLFED_AMT = 0,
		SOLFED_VOTES = 0,
		SOLFED_DECLARED = FALSE
	)
))
GLOBAL_LIST_INIT(call911_do_and_do_not, list(
	EMERGENCY_RESPONSE_EMT = "Парамедиков InteQ следует запрашивать при:\n\
		Большом количестве жертв на станции; невозможность медицинского персонала станции справиться с угрозами; и т.д.\n\
		Парамедиков InteQ НЕ следует запрашивать при:\n\
		Жалобах капитана на то, что он ударился пальцем о тумбочку; двух-трёх погибших на станции; и т.д.\n\
		Желаете запросить поддержку парамедиков InteQ?",
	EMERGENCY_RESPONSE_POLICE = "Наёмников InteQ следует запрашивать при:\n\
		Мятеже Службы Безопасности; Нелояльности СБ командованию, \
		Нарушении Космического закона Командованием или Службой безопасности; невероятных угрозах и жертвах; и т.д.\n\
		Наёмников InteQ НЕ следует запрашивать при:\n\
		Различных корпоративных проволочках, мелких спорах и незначительных угрозах.\n\
		Желаете запросить поддержку наёмников InteQ?",
	EMERGENCY_RESPONSE_ATMOS = "Техников InteQ следует запрашивать при:\n\
		Невероятных повреждениях атмосферных систем станции; крайне крупных пожарах; повреждениях двигателей, при условии, что инженерный отдел станции не справляется. \n\
		Техников InteQ НЕ следует запрашивать при:\n\
		Небольших повреждениях обшивки станции, обыденных поломках и при ситуациях, решаемых инженерным отделом станции.\n\
		За каждого специалиста будет вычтено [abs(GLOB.solfed_tech_charge)] кредитов.\n\
		Желаете запросить поддержку техников InteQ?"
))

/// Internal. Polls ghosts and sends in a team of space cops according to the alert level, accompanied by an announcement.
/obj/machinery/computer/communications/proc/call_911(ordered_team)
	var/team_size
	var/cops_to_send
	var/announcement_message = "sussus amogus"
	var/announcer = "PMC InteQ"
	var/poll_question = "fuck you leatherman"
	var/cell_phone_number = "911"
	var/list_to_use = "911_responders"
	switch(ordered_team)
		if(EMERGENCY_RESPONSE_POLICE)
			team_size = 8
			cops_to_send = /datum/antagonist/ert/request_911/police
			announcement_message = "Экипаж станции [station_name()]. На проводе ЧВК 'InteQ'. Мы получили запрос отряда вооруженных наёмников. Мы высылаем \
				вам лучших бойцов из отряда 'Rose Thorns' для помощи станции.\n\n\
				Если наши наёмники потребуют более серьезной поддержки для выполнения своей работы или для сообщения о ложном вызове, мы за дополнительную плату отправим ещё один отряд на вашу станцию в \
				сумма 20 000 кредитов.\n\n\
				Стенограмма запроса:\n\
				[GLOB.call_911_msg]"
			//announcer = "PMC InteQ"
			poll_question = "The station has called for the InteQ Mercenaries. Will you respond?"
		if(EMERGENCY_RESPONSE_ATMOS)
			team_size = tgui_input_number(usr, "Сколько инженеров требуется для устранения проблемы?", "Каков уровень повреждений?", 3, 3, 1)
			cops_to_send = /datum/antagonist/ert/request_911/atmos
			announcement_message = "Экипаж станции [station_name()]. На проводе ЧВК 'InteQ'. Мы получили уведомление о крупных дырах в обшивке станции, утере воздуха, пожаре, или иной инженерной проблеме. Мы высылаем \
				Отряд обученных инженеров из отряда 'Gamma-8' для помощи станции.\n\n\
				Стенограмма запроса:\n\
				[GLOB.call_911_msg]"
			//announcer = "PMC InteQ"
			poll_question = "The station has called for an InteQ Advanced Engineering Team. Will you respond?"
			cell_phone_number = "911"	//This needs to stay so they can communicate with SWAT
		if(EMERGENCY_RESPONSE_EMT)
			team_size = 8
			cops_to_send = /datum/antagonist/ert/request_911/emt
			announcement_message = "Экипаж станции [station_name()]. На проводе ЧВК 'InteQ'. Мы получили запрос Экстренной Медицинской Помощи. Мы высылаем \
				Наших лучших Полевых Медиков из отряда 'White Bandages' для помощи станции.\n\n\
				If the first responders request that they need heavier support to do their job, or to report a faulty call, we will send them in at additional cost to your station to the \
				tune of $20,000.\n\n\
				Стенограмма запроса:\n\
				[GLOB.call_911_msg]"
			//announcer = "PMC InteQ"
			poll_question = "The station has called for InteQ Medical Support. Will you respond?"
		if(EMERGENCY_RESPONSE_EMAG)
			team_size = 8
			cops_to_send = /datum/antagonist/ert/pizza/false_call
			announcement_message = "Спасибо за заказ в 'Dogginos'!, [GLOB.pizza_order]! Мы высылаем вам экстра-супер-пупер большую партию пиццы для вашей вечеринки \
				прямо сейчас!\n\n\
				Спасибо за то что выбрали опцию 'получи заказ за 50 минут или пицца бесплатно'! Наша пицца будет у порога вашей станции [station_name()] как можно скоро, благодаря \
				нашим сверх-скоростным Варп двигателям, установленным на всех шаттла доставки 'Dogginos'!\n\
				Дистанция до ближайшего 'Dogginos': 70 000 Световых лет."
			announcer = "Dogginos"
			poll_question = "The station has ordered $35,000 in pizza. Will you deliver?"
			cell_phone_number = "Dogginos"
			list_to_use = "dogginos"
	priority_announce(announcement_message, announcer, 'zov_modular_arkstation/modules/faction-inteq/sound/inteq.ogg', has_important_message=TRUE, color_override = "orange")
	var/list/candidates = poll_ghost_candidates(poll_question, "deathsquad")

	if(candidates.len)
		//Pick the (un)lucky players
		var/agents_number = min(team_size, candidates.len)

		var/list/spawnpoints = GLOB.inteqteamspawn
		var/index = 0
		GLOB.solfed_responder_info[list_to_use][SOLFED_AMT] = agents_number
		while(agents_number && candidates.len)
			var/spawn_loc = spawnpoints[index + 1]
			//loop through spawnpoints one at a time
			index = (index + 1) % spawnpoints.len
			var/mob/dead/observer/chosen_candidate = pick(candidates)
			candidates -= chosen_candidate
			if(!chosen_candidate.key)
				continue

			//Spawn the body
			var/mob/living/carbon/human/cop = new(spawn_loc)
			chosen_candidate.client.prefs.safe_transfer_prefs_to(cop, is_antag = TRUE)
			cop.key = chosen_candidate.key

			//Give antag datum
			var/datum/antagonist/ert/request_911/ert_antag = new cops_to_send

			cop.mind.add_antag_datum(ert_antag)
			cop.mind.set_assigned_role(SSjob.GetJobType(ert_antag.ert_job_path))
			SSjob.SendToLateJoin(cop)
			cop.grant_language(/datum/language/common, source = LANGUAGE_SPAWNER)

			if(cops_to_send == /datum/antagonist/ert/request_911/atmos) // charge for atmos techs
				var/datum/bank_account/station_balance = SSeconomy.get_dep_account(ACCOUNT_CAR)
				station_balance?.adjust_money(GLOB.solfed_tech_charge)
			else
				var/obj/item/gangster_cellphone/phone = new() // biggest gang in the city
				phone.gang_id = cell_phone_number
				phone.name = "[cell_phone_number] branded cell phone"
				phone.w_class = WEIGHT_CLASS_SMALL	//They get that COMPACT phone hell yea
				var/phone_equipped = phone.equip_to_best_slot(cop)
				if(!phone_equipped)
					to_chat(cop, "Your [phone.name] has been placed at your feet.")
					phone.forceMove(get_turf(cop))

			//Logging and cleanup
			log_game("[key_name(cop)] has been selected as an [ert_antag.name]")
			if(cops_to_send == /datum/antagonist/ert/request_911/atmos)
				log_game("[abs(GLOB.solfed_tech_charge)] has been charged from the station budget for [key_name(cop)]")
			agents_number--
	GLOB.cops_arrived = TRUE
	return TRUE

/obj/machinery/computer/communications/proc/pre_911_check(mob/user)
	if (!authenticated_as_silicon_or_captain(user))
		return FALSE

	if (GLOB.cops_arrived)
		to_chat(user, span_warning("PMC InteQ has already been called this shift!"))
		playsound(src, 'sound/machines/terminal_prompt_deny.ogg', 50, FALSE)
		return FALSE

	if (!issilicon(user))
		var/obj/item/held_item = user.get_active_held_item()
		var/obj/item/card/id/id_card = held_item?.GetID()
		if (!istype(id_card))
			to_chat(user, span_warning("You need to swipe your ID!"))
			playsound(src, 'sound/machines/terminal_prompt_deny.ogg', 50, FALSE)
			return FALSE
		if (!(ACCESS_CAPTAIN in id_card.access))
			to_chat(user, span_warning("You are not authorized to do this!"))
			playsound(src, 'sound/machines/terminal_prompt_deny.ogg', 50, FALSE)
			return FALSE
	else
		to_chat(user, "The console refuses to let you dial a phone as an AI or Cyborg!")
		return FALSE
	return TRUE

/obj/machinery/computer/communications/proc/calling_911(mob/user, called_group_pretty = "EMTs", called_group = EMERGENCY_RESPONSE_EMT)
	message_admins("[ADMIN_LOOKUPFLW(user)] is considering calling the InteQ [called_group_pretty].")
	var/call_911_msg_are_you_sure = "Are you sure you want to call PMC InteQ? Faulty calls results in a $20,000 fine and a 5 year superjail \
		sentence."
	if(tgui_input_list(user, call_911_msg_are_you_sure, "Call PMC InteQ", list("Yes", "No")) != "Yes")
		return
	message_admins("[ADMIN_LOOKUPFLW(user)] has acknowledged the faulty call consequences.")
	if(tgui_input_list(user, GLOB.call911_do_and_do_not[called_group], "Call [called_group_pretty]", list("Yes", "No")) != "Yes")
		return
	message_admins("[ADMIN_LOOKUPFLW(user)] has read and acknowleged the recommendations for what to call and not call [called_group_pretty] for.")
	var/reason_to_call_911 = stripped_input(user, "What do you wish to call PMC [called_group_pretty] for?", "Call PMC InteQ", null, MAX_MESSAGE_LEN)
	if(!reason_to_call_911)
		to_chat(user, "You decide not to call PMC InteQ.")
		return
	GLOB.cops_arrived = TRUE
	GLOB.call_911_msg = reason_to_call_911
	GLOB.caller_of_911 = user.name
	log_game("[key_name(user)] has called PMC InteQ [called_group_pretty] for the following reason:\n[GLOB.call_911_msg]")
	message_admins("[ADMIN_LOOKUPFLW(user)] has called the PMC InteQ [called_group_pretty] for the following reason:\n[GLOB.call_911_msg]")
	deadchat_broadcast(" has called PMC InteQ [called_group_pretty] for the following reason:\n[GLOB.call_911_msg]", span_name("[user.real_name]"), user, message_type = DEADCHAT_ANNOUNCEMENT)

	call_911(called_group)
	to_chat(user, span_notice("Authorization confirmed. The call has been dispatched to PMC InteQ [called_group_pretty]."))
	playsound(src, 'sound/machines/terminal_prompt_confirm.ogg', 50, FALSE)

/datum/antagonist/ert/request_911
	name = "PMC InteQ Responder"
	antag_hud_name = "hud_spacecop"
	suicide_cry = "FOR ADMIRAL BROWN!!"
	var/department = "Some stupid shit"

/datum/antagonist/ert/request_911/apply_innate_effects(mob/living/mob_override)
	..()
	var/mob/living/M = mob_override || owner.current
	if(M.hud_used)
		var/datum/hud/H = M.hud_used
		var/atom/movable/screen/wanted/giving_wanted_lvl = new /atom/movable/screen/wanted(null, H)
		H.wanted_lvl = giving_wanted_lvl
		H.infodisplay += giving_wanted_lvl
		H.mymob.client.screen += giving_wanted_lvl


/datum/antagonist/ert/request_911/remove_innate_effects(mob/living/mob_override)
	var/mob/living/M = mob_override || owner.current
	if(M.hud_used)
		var/datum/hud/H = M.hud_used
		H.infodisplay -= H.wanted_lvl
		QDEL_NULL(H.wanted_lvl)
	..()

/datum/antagonist/ert/request_911/greet()
	var/missiondesc =  ""
	missiondesc += "<B><font size=5 color=red>You are NOT a Nanotrasen Employee. You work for PMC InteQ as a [role].</font></B>"
	missiondesc += "<BR>You are responding to emergency calls from the station for immediate PMC InteQ [department] assistance!\n"
	missiondesc += "<BR>Use the Cell Phone in your backpack to confer with fellow first responders!\n"
	missiondesc += "<BR><B>The call Transcript is as follows</B>:"
	missiondesc += "<BR> [GLOB.call_911_msg]"
	missiondesc += "<BR><B>Your Mission</B>:"
	missiondesc += "<BR> <B>1.</B> Contact [GLOB.caller_of_911] and assist them in resolving the matter."
	missiondesc += "<BR> <B>2.</B> Protect, ensure, and uphold the rights of your clients on [station_name()]."
	missiondesc += "<BR> <B>3.</B> If you believe yourself to be in danger, unable to do the job assigned to you due to a dangerous situation, \
		or that the phone call was made in error, you can use the Heavy InteQ Team Backup Caller in your backpack to vote on calling a reinforcement team to assist in the situation."
	missiondesc += "<BR> <B>4.</B> When you have finished with your work on the station, use the Beamout Tool in your backpack to beam out yourself \
		along with anyone you are pulling."
	to_chat(owner, missiondesc)
	var/mob/living/greeted_mob = owner.current
	greeted_mob.playsound_local(greeted_mob, 'zov_modular_arkstation/modules/sounds-renewal/sound/antag/raiders.ogg', 100, FALSE, pressure_affected = FALSE, use_reverb = FALSE)

/datum/outfit/request_911/post_equip(mob/living/carbon/human/human_to_equip, visualsOnly = FALSE)
	if(visualsOnly)
		return

	var/obj/item/card/id/ID_to_give = human_to_equip.wear_id
	if(istype(ID_to_give))
		shuffle_inplace(ID_to_give.access) // Shuffle access list to make NTNet passkeys less predictable
		ID_to_give.registered_name = human_to_equip.real_name
		if(human_to_equip.age)
			ID_to_give.registered_age = human_to_equip.age
		ID_to_give.update_label()
		ID_to_give.update_icon()
		human_to_equip.sec_hud_set_ID()

/*
*	POLICE
*/

/datum/antagonist/ert/request_911/police
	name = "Mercenary"
	role = "Private"
	department = "Mercenaries"
	outfit = /datum/outfit/request_911/police

/*
*	ADVANCED ATMOSPHERICS
*/

/datum/antagonist/ert/request_911/atmos
	name = "Engineering Technician"
	role = "Engineering Technician"
	department = "Engineers"
	outfit = /datum/outfit/request_911/atmos


/obj/item/radio/headset/headset_solfed/atmos
	name = "\improper SolFed adv. atmos headset"
	desc = "A headset used by the Solar Federation response teams."
	icon_state = "med_headset"
	keyslot = /obj/item/encryptionkey/headset_solfed/atmos
	radiosound = 'modular_skyrat/modules/radiosound/sound/radio/security.ogg'

/obj/item/encryptionkey/headset_solfed/atmos
	name = "\improper SolFed adv. atmos encryption key"
	icon_state = "cypherkey_medical"
	independent = TRUE
	channels = list(RADIO_CHANNEL_SOLFED = 1, RADIO_CHANNEL_ENGINEERING = 1, RADIO_CHANNEL_COMMAND = 1)
	greyscale_config = /datum/greyscale_config/encryptionkey_medical
	greyscale_colors = "#ebebeb#2b2793"

/*
*	EMT
*/

/datum/antagonist/ert/request_911/emt
	name = "Emergency Medical Technician"
	role = "EMT"
	department = "EMT"
	outfit = /datum/outfit/request_911/emt

/datum/antagonist/ert/request_911/condom_destroyer
	name = "Heavy Mercenary"
	role = "Sergeant"
	department = "Mercenaries"
	outfit = /datum/outfit/request_911/condom_destroyer

/datum/antagonist/ert/request_911/condom_destroyer/greet()
	var/missiondesc =  ""
	missiondesc += "<B><font size=5 color=red>You are NOT a Nanotrasen Employee. You work for PMC InteQ as a [role].</font></B>"
	missiondesc += "<BR>You are here to backup the first responders, as they have reported for your assistance..\n"
	missiondesc += "<BR><B>Your Mission</B>:"
	missiondesc += "<BR> <B>1.</B> Contact the first responders using the Cell Phone in your backpack to figure out the situation."
	missiondesc += "<BR> <B>2.</B> Arrest anyone who interferes the work of the first responders."
	missiondesc += "<BR> <B>3.</B> Use lethal force in the arrest of the interlopers if they will not comply, or the station refuses to comply."
	missiondesc += "<BR> <B>4.</B> If you believe the station is engaging in treason and is firing upon InteQ members, use the \
		Treason Reporter in your backpack to call the Vanguards."
	missiondesc += "<BR> <B>5.</B> When you have finished with your work on the station, use the Beamout Tool in your backpack to beam out yourself \
		along with anyone you are pulling."
	to_chat(owner, missiondesc)
	var/mob/living/greeted_mob = owner.current
	greeted_mob.playsound_local(greeted_mob, 'zov_modular_arkstation/modules/sounds-renewal/sound/antag/raiders.ogg', 100, FALSE, pressure_affected = FALSE, use_reverb = FALSE)

/datum/antagonist/ert/request_911/treason_destroyer
	name = "InteQ Vanguard"
	role = "Vanguard"
	department = "Mercenaries"
	outfit = /datum/outfit/request_911/treason_destroyer

/datum/antagonist/ert/request_911/treason_destroyer/greet()
	var/missiondesc =  ""
	missiondesc += "<B><font size=5 color=red>You are NOT a Nanotrasen Employee. You work for PMC InteQ as a [role].</font></B>"
	missiondesc += "<BR>You are here to assume control of [station_name()] due to the occupants engaging in Treason as reported by our heavy team.\n"
	missiondesc += "<BR><B>Your Mission</B>:"
	missiondesc += "<BR> <B>1.</B> Contact the InteQ teams via your cell phone to get the situation from them."
	missiondesc += "<BR> <B>2.</B> Arrest all suspects involved in the treason attempt."
	missiondesc += "<BR> <B>3.</B> Assume control of the station for PMC InteQ, and initiate evacuation procedures to get non-offending citizens \
		away from the scene."
	missiondesc += "<BR> <B>4.</B> If you need to use lethal force, do so, but only if you must."
	to_chat(owner, missiondesc)
	var/mob/living/greeted_mob = owner.current
	greeted_mob.playsound_local(greeted_mob, 'zov_modular_arkstation/modules/sounds-renewal/sound/antag/raiders.ogg', 100, FALSE, pressure_affected = FALSE, use_reverb = FALSE)

/obj/item/solfed_reporter
	name = "PMC InteQ reporter"
	desc = "Use this in-hand to vote to call PMC InteQ backup. If half your team votes for it, reinforcements will be dispatched."
	icon = 'modular_skyrat/modules/goofsec/icons/reporter.dmi'
	icon_state = "reporter_off"
	w_class = WEIGHT_CLASS_SMALL
	/// Was the reporter turned on?
	var/activated = FALSE
	/// What antagonist should be required to use the reporter?
	var/type_to_check = /datum/antagonist/ert/request_911
	/// What table should we be incrementing votes in and checking against in the solfed responders global?
	var/type_of_callers = "911_responders"
	/// What source should be supplied for the announcement message?
	var/announcement_source = "PMC InteQ"
	/// Should the station be issued a fine when the vote completes?
	var/fine_station = TRUE
	/// What poll message should we show to the ghosts when they are asked to join the squad?
	var/ghost_poll_msg = "example crap"
	/// How many ghosts should we pick from the applicants to become members of the squad?
	var/amount_to_summon = 4
	/// What antagonist type should we give to the ghosts?
	var/type_to_summon = /datum/antagonist/ert/request_911/condom_destroyer
	/// What table should be be incrementing amount in in the solfed responders global?
	var/summoned_type = "swat"
	/// What name and ID should be on the cell phone given to the squad members?
	var/cell_phone_number = "911"
	/// What jobban should we be checking for the ghost polling?
	var/jobban_to_check = ROLE_DEATHSQUAD
	/// What announcement message should be displayed if the vote succeeds?
	var/announcement_message = "Example announcement message"

/obj/item/solfed_reporter/proc/pre_checks(mob/user)
	if(GLOB.solfed_responder_info[type_of_callers][SOLFED_AMT] == 0)
		to_chat(user, span_warning("There are no responders. You likely spawned this in as an admin. Please don't do this."))
		return FALSE
	if(!user.mind.has_antag_datum(type_to_check))
		to_chat(user, span_warning("You don't know how to use this!"))
		return FALSE
	return TRUE

/obj/item/solfed_reporter/proc/questions(mob/user)
	return TRUE

/obj/item/solfed_reporter/attack_self(mob/user, modifiers)
	. = ..()
	if(!pre_checks(user))
		return
	if(!activated && !GLOB.solfed_responder_info[type_of_callers][SOLFED_DECLARED])
		if(!questions(user))
			return
		activated = TRUE
		icon_state = "reporter_on"
		GLOB.solfed_responder_info[type_of_callers][SOLFED_VOTES]++
		var/current_votes = GLOB.solfed_responder_info[type_of_callers][SOLFED_VOTES]
		var/amount_of_responders = GLOB.solfed_responder_info[type_of_callers][SOLFED_AMT]
		to_chat(user, span_warning("You have activated the device. \
		Current Votes: [current_votes]/[amount_of_responders] votes."))
		if(current_votes >= amount_of_responders * 0.5)
			GLOB.solfed_responder_info[type_of_callers][SOLFED_DECLARED] = TRUE
			if(fine_station)
				var/datum/bank_account/station_balance = SSeconomy.get_dep_account(ACCOUNT_CAR)
				station_balance?.adjust_money(SOLFED_FINE_AMOUNT) // paying for the gas to drive all the fuckin' way out to the frontier

			priority_announce(announcement_message, announcement_source, 'zov_modular_arkstation/modules/faction-inteq/sound/inteq.ogg', has_important_message = TRUE, color_override = "orange")
			var/list/candidates = poll_ghost_candidates(ghost_poll_msg, jobban_to_check)

			if(candidates.len)
				//Pick the (un)lucky players
				var/agents_number = min(amount_to_summon, candidates.len)
				GLOB.solfed_responder_info[summoned_type][SOLFED_AMT] = agents_number

				var/list/spawnpoints = GLOB.inteqteamspawn
				var/index = 0
				while(agents_number && candidates.len)
					var/spawn_loc = spawnpoints[index + 1]
					//loop through spawnpoints one at a time
					index = (index + 1) % spawnpoints.len
					var/mob/dead/observer/chosen_candidate = pick(candidates)
					candidates -= chosen_candidate
					if(!chosen_candidate.key)
						continue

					//Spawn the body
					var/mob/living/carbon/human/cop = new(spawn_loc)
					chosen_candidate.client.prefs.safe_transfer_prefs_to(cop, is_antag = TRUE)
					cop.key = chosen_candidate.key

					//Give antag datum
					var/datum/antagonist/ert/request_911/ert_antag = new type_to_summon

					cop.mind.add_antag_datum(ert_antag)
					cop.mind.set_assigned_role(SSjob.GetJobType(ert_antag.ert_job_path))
					SSjob.SendToLateJoin(cop)
					cop.grant_language(/datum/language/common, source = LANGUAGE_SPAWNER)

					var/obj/item/gangster_cellphone/phone = new() // biggest gang in the city
					phone.gang_id = cell_phone_number
					phone.name = "[cell_phone_number] branded cell phone"
					var/phone_equipped = phone.equip_to_best_slot(cop)
					if(!phone_equipped)
						to_chat(cop, "Your [phone.name] has been placed at your feet.")
						phone.forceMove(get_turf(cop))

					//Logging and cleanup
					log_game("[key_name(cop)] has been selected as an [ert_antag.name]")
					agents_number--

/obj/item/solfed_reporter/swat_caller
	name = "PMC InteQ backup caller"
	desc = "Use this in-hand to vote to call PMC InteQ backup. If half your team votes for it, reinforcements will be dispatched."
	type_to_check = /datum/antagonist/ert/request_911
	type_of_callers = "911_responders"
	announcement_source = "PMC InteQ"
	fine_station = TRUE
	ghost_poll_msg = "PMC InteQ members have requested a reinforcements. Do you wish to become a heavy team member?"
	amount_to_summon = 6
	type_to_summon = /datum/antagonist/ert/request_911/condom_destroyer
	summoned_type = "swat"
	announcement_message = "Доброго времени суток, Экипаж. Наш отряд запросил поддержки для выполнения их работы по помощи \
		станции, или в связи с ложным вызовом. Мы выставим счёт в 20 000 кредитов за это, дабы покрыть расходы отправки второго отряда на \
		вашу станцию. Пожалуйста, исполняйте все приказы наёмников ЧВК 'InteQ'."

/obj/item/solfed_reporter/swat_caller/questions(mob/user)
	var/question = "Does the situation require additional backup, involve the station impeding you from doing your job, \
		or involve the station making a fraudulent call and needing an arrest made on the caller?"
	if(tgui_input_list(user, question, "PMC InteQ Backup Caller", list("Yes", "No")) != "Yes")
		to_chat(user, "You decide not to request PMC InteQ backup.")
		return FALSE
	message_admins("[ADMIN_LOOKUPFLW(user)] has voted to summon PMC InteQ backup.")
	return TRUE

/obj/item/solfed_reporter/treason_reporter
	name = "treason reporter"
	desc = "Use this in-hand to vote that the station is engaging in Treason. If half your team votes for it, the Vanguard will handle the situation."
	type_to_check = /datum/antagonist/ert/request_911/condom_destroyer
	type_of_callers = "swat"
	announcement_source = "PMC InteQ"
	fine_station = FALSE
	ghost_poll_msg = "The station has decided to engage in treason. Do you wish to join PMC InteQ Vanguard?"
	amount_to_summon = 12
	type_to_summon = /datum/antagonist/ert/request_911/treason_destroyer
	summoned_type = "national_guard"
	announcement_message = "Crewmembers of the station. You have refused to comply with first responders, and have assaulted them, \
		and they are unable to carry out the wills of PMC InteQ.\n\
		As such, we are charging those responsible with Treason. The penalty of which is death, or no less than twenty-five years in our jails.\n\
		Treason is a serious crime. Our Vanguard forces are en route to your station. They will be assuming direct control of the station, and \
		will be evacuating civilians from the scene.\n\
		Non-offending citizens, prepare for evacuation. Comply with all orders given to you by PMC InteQ members.\n\
		To all those who are engaging in treason, lay down your weapons and surrender. Refusal to comply may be met with lethal force."

/obj/item/solfed_reporter/treason_reporter/questions(mob/user)
	var/list/list_of_questions = list(
		"Treason is the crime of attacking a PMC member. The station previously asked for InteQ help, \
			and owes a huge debt to PMC InteQ despite being owned by Nanotrasen. Did the station engage in this today?",
		"Did station crewmembers assault you or the other PMC teams at the direction of Security and/or Command?",
		"Did station crewmembers actively prevent you or other PMC teams from accomplishing your objectives at the direction of Security and/or Command?",
		"Were you and your fellow members unable to handle the issue on your own?",
		"Are you absolutely sure you wish to declare the station as engaging in Treason? Misuse of this can and will result in \
			administrative action against your account."
	)
	for(var/question in list_of_questions)
		if(tgui_input_list(user, question, "Treason Reporter", list("Yes", "No")) != "Yes")
			to_chat(user, "You decide not to declare the station as treasonous.")
			return FALSE
	message_admins("[ADMIN_LOOKUPFLW(user)] has acknowledged the consequences of a false claim of Treason administratively, \
		and has voted that the station is engaging in Treason.")
	return TRUE

/obj/item/solfed_reporter/pizza_managers
	name = "Dogginos uncompliant customer reporter"
	desc = "Use this in-hand to vote to call for Dogginos Regional Managers if the station refuses to pay for their pizza. \
		If half your delivery squad votes for it, Dogginos Regional Managers will be dispatched."
	type_to_check = /datum/antagonist/ert/pizza/false_call
	type_of_callers = "dogginos"
	announcement_message = "Hey there, custo-mores! Our delivery drivers have reported that you guys are having some issues with payment for your order that \
		you placed at the Dogginos that's the seventh furthest Dogginos in the galaxy from your station, and we want to ensure maximum customer satisfaction and \
		employee satisfaction as well.\n\
		We've gone ahead and sent some some of our finest regional managers to handle the situation.\n\
		We hope you enjoy your pizzas, and that we'll be able to recieve the bill of $35,000 plus the fifteen percent tip for our drivers shortly!"
	announcement_source = "Dogginos"
	fine_station = FALSE
	ghost_poll_msg = "Dogginos is sending regional managers to get the station to pay up the pizza money they owe. Are you ready to do some Customer Relations?"
	amount_to_summon = 8
	type_to_summon = /datum/antagonist/ert/pizza/leader/false_call
	summoned_type = "dogginos_manager"
	cell_phone_number = "Dogginos"

/obj/item/solfed_reporter/pizza_managers/questions(mob/user)
	if(tgui_input_list(user, "Is the station refusing to pay their bill of $35,000, including a fifteen percent tip for delivery drivers?", "Dogginos Uncompliant Customer Reporter", list("Yes", "No")) != "Yes")
		to_chat(user, "You decide not to request management assist you with the delivery.")
		return FALSE
	message_admins("[ADMIN_LOOKUPFLW(user)] has voted to summon Dogginos management to resolve the lack of payment.")
	return TRUE

/datum/antagonist/ert/pizza/false_call
	outfit = /datum/outfit/centcom/ert/pizza/false_call

/datum/antagonist/ert/pizza/false_call/greet()
	var/missiondesc =  ""
	missiondesc += "<B><font size=5 color=red>You are NOT a Nanotrasen Employee. You work for Dogginos as a delivery person.</font></B>"
	missiondesc += "<BR>You are here to deliver some pizzas from Dogginos!\n"
	missiondesc += "<BR>Use the Cell Phone in your backpack to confer with fellow Dogginos employees!\n"
	missiondesc += "<BR><B>Your Mission</B>:"
	missiondesc += "<BR> <B>1.</B> Deliver the pizzas ordered by [GLOB.pizza_order]."
	missiondesc += "<BR> <B>2.</B> Collect the bill, which totals to $35,000 plus a fifteen percent tip for delivery drivers."
	missiondesc += "<BR> <B>3.</B> If they refuse to pay, you may summon the Dogginos Regional Managers to help resolve the issue."
	to_chat(owner, missiondesc)

/datum/antagonist/ert/pizza/leader/false_call/greet()
	var/missiondesc =  ""
	missiondesc += "<B><font size=5 color=red>You are NOT a Nanotrasen Employee. You work for Dogginos as a Regional Manager.</font></B>"
	missiondesc += "<BR>You are here to resolve a dispute with some customers who refuse to pay their bill!\n"
	missiondesc += "<BR>Use the Cell Phone in your backpack to confer with fellow Dogginos employees!\n"
	missiondesc += "<BR><B>Your Mission</B>:"
	missiondesc += "<BR> <B>1.</B> Collect the money owed by [GLOB.pizza_order], which amounts to $35,000 plus a fifteen percent tip for the delivery drivers."
	missiondesc += "<BR> <B>2.</B> Use any means necessary to collect the owed funds. The thousand degree knife in your backpack will help in this task."
	to_chat(owner, missiondesc)

/obj/item/beamout_tool
	name = "beam-out tool" // TODO, find a way to make this into drop pods cuz that's cooler visually
	desc = "Use this to begin the lengthy beam-out  process to return to PMC InteQ quarters. It will bring anyone you are pulling with you."
	icon = 'modular_skyrat/modules/goofsec/icons/reporter.dmi'
	icon_state = "beam_me_up_scotty"
	w_class = WEIGHT_CLASS_SMALL

/obj/item/beamout_tool/attack_self(mob/user, modifiers)
	. = ..()
	if(!user.mind.has_antag_datum(/datum/antagonist/ert))
		to_chat(user, span_warning("You don't understand how to use this device."))
		return
	message_admins("[ADMIN_LOOKUPFLW(user)] has begun to beam-out using their beam-out tool.")
	to_chat(user, "You have begun the beam-out process. Please wait for the beam to reach the station.")
	user.balloon_alert(user, "begun beam-out")
	if(do_after(user, 30 SECONDS))
		to_chat(user, "You have completed the beam-out process and are returning to PMC InteQ quarters.")
		message_admins("[ADMIN_LOOKUPFLW(user)] has beamed themselves out.")
		if(isliving(user))
			var/mob/living/living_user = user
			if(living_user.pulling)
				if(ishuman(living_user.pulling))
					var/mob/living/carbon/human/beamed_human = living_user.pulling
					message_admins("[ADMIN_LOOKUPFLW(user)] has beamed out [ADMIN_LOOKUPFLW(beamed_human)] alongside them.")
				else
					message_admins("[ADMIN_LOOKUPFLW(user)] has beamed out [living_user.pulling] alongside them.")
				var/turf/pulling_turf = get_turf(living_user.pulling)
				playsound(pulling_turf, 'sound/magic/Repulse.ogg', 100, 1)
				var/datum/effect_system/spark_spread/quantum/sparks = new
				sparks.set_up(10, 1, pulling_turf)
				sparks.attach(pulling_turf)
				sparks.start()
				qdel(living_user.pulling)
			var/turf/user_turf = get_turf(living_user)
			playsound(user_turf, 'sound/magic/Repulse.ogg', 100, 1)
			var/datum/effect_system/spark_spread/quantum/sparks = new
			sparks.set_up(10, 1, user_turf)
			sparks.attach(user_turf)
			sparks.start()
			qdel(user)
	else
		user.balloon_alert(user, "beam-out cancelled")

/obj/effect/landmark/inteq_spawn
	name = "InteQteam"
	icon = 'zov_modular_arkstation/modules/faction-inteq/icons/landmark.dmi'
	icon_state = "inteq_spawn"

/obj/effect/landmark/inteq_spawn/Initialize(mapload)
	..()
	GLOB.inteqteamspawn += loc
	return INITIALIZE_HINT_QDEL

#undef EMERGENCY_RESPONSE_POLICE
#undef EMERGENCY_RESPONSE_ATMOS
#undef EMERGENCY_RESPONSE_EMT
#undef EMERGENCY_RESPONSE_EMAG
