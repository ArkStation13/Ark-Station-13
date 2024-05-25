/datum/round_event_control/mice_migration
	name = "Mice Migration"
	typepath = /datum/round_event/mice_migration
	weight = 10
	category = EVENT_CATEGORY_ENTITIES
	description = "Прибывает стая мышей и, возможно, даже сам Крысиный король."

/datum/round_event/mice_migration
	var/minimum_mice = 5
	var/maximum_mice = 15

/datum/round_event/mice_migration/announce(fake)
	var/cause = pick("космической зимы", "сокращение бюджета", "Рагнарёка",
		"морозного космоса", "\[REDACTED\]", "изменений климата",
		"плохой удачи")
	var/plural = pick("какое-то число", "орда", "пачка", "рой",
		"a whoop of", "не больше чем [maximum_mice]")
	var/name = pick("грызунов", "мышей", "пищящих",
		"пожирающие провода млекопитающие", "\[REDACTED\]", "паразитов, истощающие энергию")
	var/movement = pick("мигрируют", "роятся", "штампуются", "спускаются")
	var/location = pick("технические туннели", "технические зоны",
		"\[REDACTED\]", "место со всеми этими сочными проводами")

	priority_announce("Из-за [cause], [plural] [name] [movement] \
		в [location].", "Migration Alert",
		'sound/creatures/mousesqueek.ogg')

/datum/round_event/mice_migration/start()
	SSminor_mapping.trigger_migration(rand(minimum_mice, maximum_mice))
