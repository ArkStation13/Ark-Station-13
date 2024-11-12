/datum/controller/subsystem/statpanels/set_status_tab(client/target)
	if(!global_data)//statbrowser hasnt fired yet and we were called from immediate_send_stat_data()
		return

	target.stat_panel.send_message("update_stat", list(
		"global_data" = global_data,
		"ping_str" = "Пинг: [round(target.lastping, 1)]мс (Среднее: [round(target.avgping, 1)]мс)",
		"other_str" = target.mob?.get_status_tab_items(),
	))

/datum/controller/subsystem/statpanels/proc/check_for_gamemode()
	if(GLOB.dynamic_forced_secret == TRUE)
		return "Secret"
	else if(GLOB.dynamic_forced_extended == TRUE)
		return "Extended"
	else
		return "Dynamic"

/datum/controller/subsystem/statpanels/fire(resumed = FALSE)
	if (!resumed)
		num_fires++
		var/datum/map_config/cached = SSmap_vote.next_map_config
		// var/server_rev = copytext(GLOB.revdata.originmastercommit, 1, 8)
		var/round_real_time = REALTIMEOFDAY - SSticker.real_round_start_time
		var/active_players = get_active_player_count(alive_check = FALSE, afk_check = TRUE, human_check = FALSE) //This is a list of all active players, including players who are dead
		var/observing_players = length(GLOB.current_observers_list) //This is a list of all players that started as an observer-- dead and lobby players are not included.
		global_data = list(
			"ID раунда: [GLOB.round_id ? GLOB.round_id : "Н/Д"]",
			"Игровой режим: [check_for_gamemode()]",
			"Предыдущие режимы: [jointext(SSpersistence.saved_modes, ", ")]", // Because some of us want to know when our favorite mode becomes forced - Flauros
			// "Server Rev: [server_rev ? server_rev : "N/A"]",
			"Текущая станция: [SSmapping.current_map?.map_name || "Подгружаем..."]",
			cached ? "Следующая станция: [cached.map_name]" : null,
			"Подключено: [GLOB.clients.len] | Активно: [active_players] | Наблюдает: [observing_players]",
			"Задержка тиков: [round(SStime_track.time_dilation_current,1)]% (Среднее: [round(SStime_track.time_dilation_avg_fast,1)]% / [round(SStime_track.time_dilation_avg,1)]% / [round(SStime_track.time_dilation_avg_slow,1)]%)",
			" ",
			"Серверное время: [time2text(world.timeofday, "DD-MM-YYYY hh:mm:ss")]",
		)

		if(SSticker.HasRoundStarted())
			global_data += "Время раунда: [time2text(round_real_time, "hh:mm:ss", 0)]"
			global_data += "Станционное время: [station_time_timestamp()]"

		if(SSshuttle.emergency)
			var/ETA = SSshuttle.emergency.getModeStr()
			if(ETA)
				global_data += "Шаттл эвакуации: [ETA] [SSshuttle.emergency.getTimerStr()]"
		src.currentrun = GLOB.clients.Copy()
		mc_data = null

	var/list/currentrun = src.currentrun
	while(length(currentrun))
		var/client/target = currentrun[length(currentrun)]
		currentrun.len--

		if(!target.stat_panel.is_ready())
			continue

		if(target.stat_tab == "Status" && num_fires % status_wait == 0)
			set_status_tab(target)

		if(!target.holder)
			target.stat_panel.send_message("remove_admin_tabs")
		else
			target.stat_panel.send_message("update_split_admin_tabs", !!(target.prefs.toggles & SPLIT_ADMIN_TABS))

			if(!("MC" in target.panel_tabs) || !("Tickets" in target.panel_tabs))
				target.stat_panel.send_message("add_admin_tabs", target.holder.href_token)

			if(target.stat_tab == "MC" && ((num_fires % mc_wait == 0) || target?.prefs.read_preference(/datum/preference/toggle/fast_mc_refresh)))
				set_MC_tab(target)

			if(target.stat_tab == "Tickets" && num_fires % default_wait == 0)
				set_tickets_tab(target)

			if(!length(GLOB.sdql2_queries) && ("SDQL2" in target.panel_tabs))
				target.stat_panel.send_message("remove_sdql2")

			else if(length(GLOB.sdql2_queries) && (target.stat_tab == "SDQL2" || !("SDQL2" in target.panel_tabs)) && num_fires % default_wait == 0)
				set_SDQL2_tab(target)

		if(target.mob)
			var/mob/target_mob = target.mob

			// Handle the action panels of the stat panel

			var/update_actions = FALSE
			// We're on a spell tab, update the tab so we can see cooldowns progressing and such
			if(target.stat_tab in target.spell_tabs)
				update_actions = TRUE
			// We're not on a spell tab per se, but we have cooldown actions, and we've yet to
			// set up our spell tabs at all
			if(!length(target.spell_tabs) && locate(/datum/action/cooldown) in target_mob.actions)
				update_actions = TRUE

			if(update_actions && num_fires % default_wait == 0)
				set_action_tabs(target, target_mob)

		if(MC_TICK_CHECK)
			return

/mob/dead/get_status_tab_items()
	. = ..()
	if(SSticker.HasRoundStarted())
		return
	var/time_remaining = SSticker.GetTimeLeft()
	if(time_remaining > 0)
		. += "Начало раунда: [round(time_remaining/10)] секунд"
	else if(time_remaining == -10)
		. += "Начало раунда: ОТЛОЖЕНО"
	else
		. += "Начало раунда: СКОРО"

	. += "Игроков: [LAZYLEN(GLOB.clients)]"
	if(client.holder)
		. += "Игроков готово: [SSticker.totalPlayersReady]"
		. += "Админов готово: [SSticker.total_admins_ready] / [length(GLOB.admins)]"
