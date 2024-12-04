#define CHOICE_DYNAMIC "Dynamic - Режим с антагонистами"
#define CHOICE_EXTENDED "Extended - Мирный режим"

GLOBAL_VAR_INIT(dynamic_forced_secret, FALSE)

/datum/vote
	vote_sound = 'modularz_arkstation/modules/dynamic_vote/code/select.ogg'

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
	return FALSE

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
	GLOB.dynamic_forced_threat_level = 0

/datum/proc/dynamic_settings()
	GLOB.dynamic_forced_extended = FALSE

/datum/proc/secret_settings()
	var/gamemode_rule

	// Проверяем нет ли уже каких-то форсов. К примеру от администрации.
	if(GLOB.dynamic_forced_extended == TRUE)
		return
	if(GLOB.dynamic_forced_roundstart_ruleset.len > 0)
		return

	// Начинаем рулетку смерти.
	if(prob(10))
		// Secret Extended
		GLOB.dynamic_forced_extended = TRUE
		GLOB.dynamic_forced_threat_level = 0
		log_admin("Game has set Forced Extended for round.")
		message_admins("Game has set Forced Extended for round.", 1)
	else if(prob(6))
		// Nuke
		gamemode_rule += /datum/dynamic_ruleset/roundstart/nuclear
		GLOB.dynamic_forced_threat_level = 0
	else if(prob(4))
		// Wiz
		gamemode_rule += /datum/dynamic_ruleset/roundstart/wizard
		GLOB.dynamic_forced_threat_level = 0
	else if(prob(4))
		// Malf
		gamemode_rule += /datum/dynamic_ruleset/roundstart/malf_ai
		GLOB.dynamic_forced_threat_level = 0
	else if(prob(10))
		// Revolution
		gamemode_rule += /datum/dynamic_ruleset/roundstart/revs
		GLOB.dynamic_forced_threat_level = 0
	else if(prob(10))
		// Blood Cult
		gamemode_rule += /datum/dynamic_ruleset/roundstart/bloodcult
		GLOB.dynamic_forced_threat_level = 0
	else if(prob(10))
		// Spies
		gamemode_rule += /datum/dynamic_ruleset/roundstart/spies
		GLOB.dynamic_forced_threat_level = 0
	else if(prob(20))
		// Traitors
		gamemode_rule += /datum/dynamic_ruleset/roundstart/traitor
		GLOB.dynamic_forced_threat_level = 0
	else
		// Random Dynamic
		GLOB.dynamic_forced_threat_level = rand(5, 150)
		log_admin("Game has set [GLOB.dynamic_forced_threat_level] threat for round.")
		message_admins("Game has set [GLOB.dynamic_forced_threat_level] threat for round.", 1)

	if(gamemode_rule)
		GLOB.dynamic_forced_roundstart_ruleset += gamemode_rule
		log_admin("Game has set [gamemode_rule] to be a forced roundstart ruleset.")
		message_admins("Game has set [gamemode_rule] to be a forced roundstart ruleset.", 1)

	GLOB.dynamic_forced_secret = TRUE

#undef CHOICE_DYNAMIC
#undef CHOICE_EXTENDED
