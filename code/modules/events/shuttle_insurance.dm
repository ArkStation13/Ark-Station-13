

/datum/round_event_control/shuttle_insurance
	name = "Shuttle Insurance"
	typepath = /datum/round_event/shuttle_insurance
	max_occurrences = 1
	category = EVENT_CATEGORY_BUREAUCRATIC
	description = "Схематичное, но законное предложение по страховке."

/datum/round_event_control/shuttle_insurance/can_spawn_event(players, allow_magic = FALSE)
	. = ..()
	if(!.)
		return .

	if(!SSeconomy.get_dep_account(ACCOUNT_CAR))
		return FALSE //They can't pay?
	if(SSshuttle.shuttle_purchased == SHUTTLEPURCHASE_FORCED)
		return FALSE //don't do it if there's nothing to insure
	if(istype(SSshuttle.emergency, /obj/docking_port/mobile/emergency/shuttle_build))
		return FALSE //this shuttle prevents the catastrophe event from happening making this event effectively useless
	if(EMERGENCY_AT_LEAST_DOCKED)
		return FALSE //catastrophes won't trigger so no point
	return TRUE

/datum/round_event/shuttle_insurance
	var/ship_name = "\"In the Unlikely Event\""
	var/datum/comm_message/insurance_message
	var/insurance_evaluation = 0

/datum/round_event/shuttle_insurance/announce(fake)
	priority_announce("Входящая подпространственная связь. Защищенный канал открыт на всех пультах связи.", "Incoming Message", SSstation.announcer.get_rand_report_sound())

/datum/round_event/shuttle_insurance/setup()
	ship_name = pick(strings(PIRATE_NAMES_FILE, "rogue_names"))
	for(var/shuttle_id in SSmapping.shuttle_templates)
		var/datum/map_template/shuttle/template = SSmapping.shuttle_templates[shuttle_id]
		if(template.name == SSshuttle.emergency.name) //found you slackin
			insurance_evaluation = template.credit_cost/2
			break
	if(!insurance_evaluation)
		insurance_evaluation = 5000 //gee i dunno

/datum/round_event/shuttle_insurance/start()
	insurance_message = new("Shuttle Insurance", "Эй, приятель, это [ship_name]. Не могу не заметить, что вы катаетесь там на диком и сумасшедшем шаттле БЕЗ СТРАХОВКИ! Сумасшедший. А если с ним что-нибудь случится, а?! Мы провели быструю оценку ваших тарифов в этом секторе и предлагаем [insurance_evaluation] для покрытия вашего шаттла в случае какой-либо катастрофы.", list("Purchase Insurance.","Reject Offer."))
	insurance_message.answer_callback = CALLBACK(src, PROC_REF(answered))
	GLOB.communications_controller.send_message(insurance_message, unique = TRUE)

/datum/round_event/shuttle_insurance/proc/answered()
	if(EMERGENCY_AT_LEAST_DOCKED)
		priority_announce("Вы определенно опоздали с покупкой страховки, друзья мои. Наши агенты не работают на месте.",sender_override = ship_name, color_override = "red")
		return
	if(insurance_message && insurance_message.answered == 1)
		var/datum/bank_account/station_balance = SSeconomy.get_dep_account(ACCOUNT_CAR)
		if(!station_balance?.adjust_money(-insurance_evaluation))
			priority_announce("Вы не отправили нам достаточно денег на страховку шаттла. Это, с точки зрения космического непрофессионализма, считается скамом. Мы держим ваши деньги, скаммеры!", sender_override = ship_name, color_override = "red")
			return
		priority_announce("Thank you for purchasing shuttle insurance!", sender_override = ship_name, color_override = "red")
		SSshuttle.shuttle_insurance = TRUE
