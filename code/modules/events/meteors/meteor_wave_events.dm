// Normal strength

/datum/round_event_control/meteor_wave
	name = "Meteor Wave: Normal"
	typepath = /datum/round_event/meteor_wave
	weight = 4
	min_players = 15
	max_occurrences = 3
	earliest_start = 25 MINUTES
	category = EVENT_CATEGORY_SPACE
	description = "Обычная метеорная волна."
	map_flags = EVENT_SPACE_ONLY

/datum/round_event/meteor_wave
	start_when = 6
	end_when = 66
	announce_when = 1
	var/list/wave_type
	var/wave_name = "normal"

/datum/round_event/meteor_wave/New()
	..()
	if(!wave_type)
		determine_wave_type()

/datum/round_event/meteor_wave/proc/determine_wave_type()
	if(!wave_name)
		wave_name = pick_weight(list(
			"normal" = 50,
			"threatening" = 40,
			"catastrophic" = 10))
	switch(wave_name)
		if("normal")
			wave_type = GLOB.meteors_normal
		if("threatening")
			wave_type = GLOB.meteors_threatening
		if("catastrophic")
			if(check_holidays(HALLOWEEN))
				wave_type = GLOB.meteorsSPOOKY
			else
				wave_type = GLOB.meteors_catastrophic
		if("meaty")
			wave_type = GLOB.meateors
		if("space dust")
			wave_type = GLOB.meteors_dust
		if("halloween")
			wave_type = GLOB.meteorsSPOOKY
		else
			WARNING("Wave name of [wave_name] not recognised.")
			kill()

/datum/round_event/meteor_wave/announce(fake)
	priority_announce("Метеоры были обнаружены на пути к столкновению со станцией.", "Meteor Alert", ANNOUNCER_METEORS)

/datum/round_event/meteor_wave/tick()
	if(ISMULTIPLE(activeFor, 3))
		spawn_meteors(5, wave_type) //meteor list types defined in gamemode/meteor/meteors.dm

/datum/round_event_control/meteor_wave/threatening
	name = "Meteor Wave: Threatening"
	typepath = /datum/round_event/meteor_wave/threatening
	weight = 5
	min_players = 20
	max_occurrences = 3
	earliest_start = 35 MINUTES
	description = "Метеорная волна с более высокой вероятностью появления больших метеоров."

/datum/round_event/meteor_wave/threatening
	wave_name = "threatening"

/datum/round_event_control/meteor_wave/catastrophic
	name = "Meteor Wave: Catastrophic"
	typepath = /datum/round_event/meteor_wave/catastrophic
	weight = 7
	min_players = 25
	max_occurrences = 3
	earliest_start = 45 MINUTES
	description = "Метеорная волна, которая может вызвать метеор класса Тунгуска."

/datum/round_event/meteor_wave/catastrophic
	wave_name = "catastrophic"

/datum/round_event_control/meteor_wave/meaty
	name = "Meteor Wave: Meaty"
	typepath = /datum/round_event/meteor_wave/meaty
	weight = 2
	max_occurrences = 1
	description = "Метеорная волна из мяса."

/datum/round_event/meteor_wave/meaty
	wave_name = "meaty"

/datum/round_event/meteor_wave/meaty/announce(fake)
	priority_announce("На пути столкновения со станцией обнаружены мясистые руды.", "Вот черт, возьми швабру.", ANNOUNCER_METEORS)

/datum/round_event_control/meteor_wave/dust_storm
	name = "Major Space Dust"
	typepath = /datum/round_event/meteor_wave/dust_storm
	weight = 14
	description = "Станцию забросали песком."
	earliest_start = 15 MINUTES
	min_wizard_trigger_potency = 4
	max_wizard_trigger_potency = 7

/datum/round_event/meteor_wave/dust_storm
	announce_chance = 85
	wave_name = "space dust"

/datum/round_event/meteor_wave/dust_storm/announce(fake)
	var/list/reasons = list()

	reasons += "[station_name()] проходит сквозь облако обломков, ожидайте незначительных повреждений \
		к внешней фурнитуре и приспособлениям."

	reasons += "Подразделение супероружия Nanotrasen тестирует новый прототип \
		[pick("поля","проекции","Нова","сверхстолкновенной","реактивной")] \
		[pick("пушки","артиллерии","танка","крейсера","\[REDACTED\]")], \
		ожидается небольшой мусор."

	reasons += "Соседняя станция кидает в вас камни. (Возможно, они \
		устал от ваших сообщений.)"

	reasons += "Орбита [station_name()] проходит через облако остатков астероида \
		горнодобывающей деятельности. Ожидаются незначительные повреждения корпуса."

	reasons += "Большой метеорит, следовавший по курсу на перехват с [station_name()], был снесен. \
		Остаточный мусор может повлиять на внешний вид станции."

	reasons += "[station_name()] попал в особенно трудный участок пространства. \
		Пожалуйста, обратите внимание на любые турбулентности или повреждения от мусора."

	priority_announce(pick(reasons), "Collision Alert")
