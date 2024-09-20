#define CHOICE_DYNAMIC "Dynamic - Режим с антагонистами"
#define CHOICE_EXTENDED "Extended - Мирный режим"

/datum/vote
	vote_sound = 'modularz_arkstation/modules/dynamic-vote/code/select.ogg'

/datum/vote/gamemode_vote
	name = "Game Mode"
	default_choices = list(
		CHOICE_DYNAMIC,
		CHOICE_EXTENDED,
	)
	default_message = "Голосование за режим игры."

/datum/vote/transfer_vote/toggle_votable()
	return FALSE

/datum/vote/gamemode_vote/is_config_enabled()
	return CONFIG_GET(flag/dynamic_vote)

/datum/vote/gamemode_vote/can_be_initiated(forced)
	. = ..()

	if(!forced)
		return "This vote is currently disabled by the server configuration."

	return VOTE_AVAILABLE

/datum/vote/gamemode_vote/finalize_vote(winning_option)
	if(winning_option == CHOICE_EXTENDED)
		extended_settings()
		to_chat(world, span_ooc_announcement_text("<b>Победил [CHOICE_EXTENDED]! Крутим гайки сервера... Выставляем режим...</b>"))
		return

	if(winning_option == CHOICE_DYNAMIC)
		dynamic_settings()
		GLOB.dynamic_forced_extended = FALSE
		to_chat(world, span_ooc_announcement_text("<b>Победил [CHOICE_DYNAMIC]! Крутим гайки сервера... Выставляем режим...</b>"))
		return

	CRASH("[type] не смог определить что победило в голосовании. (Что получилось: [winning_option || "null"]). Пробуем рандомизировать режим.")

/datum/proc/extended_settings()
	GLOB.dynamic_forced_extended = TRUE
	SSdynamic.threat_level = 0

/datum/proc/dynamic_settings()
	GLOB.dynamic_forced_extended = FALSE

#undef CHOICE_DYNAMIC
#undef CHOICE_EXTENDED
