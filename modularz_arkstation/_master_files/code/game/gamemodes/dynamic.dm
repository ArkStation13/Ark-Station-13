/datum/controller/subsystem/dynamic/send_trait_report()
	. = "<b><i>Сообщение Центрального Командования</i></b><hr>"

	var/greenshift = GLOB.dynamic_forced_extended || (threat_level < MIN_MIDROUND_COST && shown_threat < MIN_MIDROUND_COST) // if both shown and real threat are below any ruleset, it's greenshift time
	SSstation.generate_station_goals(greenshift ? INFINITY : CONFIG_GET(number/station_goal_budget))

	if(!length(SSstation.get_station_goals()))
		. = "<hr><b>Отсутствуют приказы на смену.</b><BR>"
	else
		var/list/texts = list("<hr><b> Специальные поручения на Ковчег [station_name()]:</b><BR>")
		for(var/datum/station_goal/station_goal as anything in SSstation.get_station_goals())
			station_goal.on_report()
			texts += station_goal.get_report()

		. += texts.Join("<hr>")
	if(!SSstation.station_traits.len)
		. = "<hr><b>Нет изменений в состоянии текущей смены.</b><BR>"
	else
		var/list/trait_list_strings = list()
		for(var/datum/station_trait/station_trait as anything in SSstation.station_traits)
			if(!station_trait.show_in_report)
				continue
			trait_list_strings += "[station_trait.get_report()]<BR>"
		if(trait_list_strings.len > 0)
			. += "<hr><b>Дополнительная информация:</b><BR>" + trait_list_strings.Join()

	. += "<hr><p style=\"color: grey; text-align: justify;\">Данное сообщение подтверждает, что Куратор ознакомился документами и назначен на должность.\
	Данный документ является собственностью Солнечной Федерации.</p>"

	print_command_report(., "Оповещения Центрального Командования", announce = FALSE)
	priority_announce("Доброй смены экипажу проекта Ковчег [station_name()]. Поступил приказ младшему Куратору, ознакомится с поставленными приказами на начало смены и провести их оценку. Бумага отправлена на вашу коммуникационную консоль. Капитан проекта Ковчег и Глава фракции Red Hawk Обеспечьте безопасную смену!", "Divergency Report", SSstation.announcer.get_rand_report_sound())

/print_command_report(text = "", title = null, announce=TRUE)
	if(!title)
		title = "Зашифрованное [command_name()] Сообщение"

	if(announce)
		priority_announce(
			text = "Приказ поступил и распечатан на всех коммуникационных консолях.",
			title = "Incoming Classified Message",
			sound = SSstation.announcer.get_rand_report_sound(),
			has_important_message = TRUE,
		)

	var/datum/comm_message/message = new
	message.title = title
	message.content = text

	GLOB.communications_controller.send_message(message)
