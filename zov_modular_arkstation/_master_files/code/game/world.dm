/world/proc/update_status()
	var/new_status = ""
	var/hostedby
	if(config)
		var/server_name = CONFIG_GET(string/servername)
		if (server_name)
			new_status += "<b>[server_name]</b> &#8212; "
		hostedby = CONFIG_GET(string/hostedby)

	new_status += " ("
	new_status += "<a href=\"[CONFIG_GET(string/discord_link)]\">"
	new_status += "Discord"
	new_status += ")\]</a>"
	new_status += "<br>[CONFIG_GET(string/servertagline)]"

	var/players = GLOB.clients.len

	if(SSmapping.config)
		new_status += "<br>Map: <b>[SSmapping.config.map_name]</b>"

	if(SSticker.current_state <= GAME_STATE_PREGAME)
		new_status += "<br>Game Status: <b>In Lobby</b>"
	else
		new_status += "<br>Game Status: <b>Playing</b>"

	if (SSticker.HasRoundStarted())
		var/round_time = world.time - SSticker.round_start_time
		new_status += "Round Time: <b>[round_time > MIDNIGHT_ROLLOVER ? "[round(round_time/MIDNIGHT_ROLLOVER)]:[gameTimestamp(format = "hh:mm")]" : gameTimestamp(format = "hh:mm")]<br>"
	else
		new_status += "Round Time: <b>New Round Starting</b>"
	if (!host && hostedby)
		new_status += "<br>hosted by <b>[hostedby]</b>"
	new_status += "<br>Player[players == 1 ? "": "s"]: <b>[players]</b>"
	new_status += "<br><b>У нас круто!</b>"

	status = new_status
