/* // ARK STATION REMOVED || BLUEMOON WHITELIST
#define WHITELISTFILE "[global.config.directory]/whitelist.txt"

GLOBAL_LIST(whitelist)

/proc/load_whitelist()
	GLOB.whitelist = list()
	for(var/line in world.file2list(WHITELISTFILE))
		if(!line)
			continue
		if(findtextEx(line,"#",1,2))
			continue
		GLOB.whitelist += ckey(line)

	if(!GLOB.whitelist.len)
		GLOB.whitelist = null

/proc/check_whitelist(ckey)
	load_whitelist()
	if(!GLOB.whitelist)
		return FALSE
	. = (ckey in GLOB.whitelist)

#undef WHITELISTFILE
*/ // ARK STATION REMOVED || BLUEMOON WHITELIST

// ARK STATION ADDED BELOW || BLUEMOON WHITELIST
/proc/check_whitelist(key)
	if(!CONFIG_GET(flag/usewhitelist))
		log_world("Whitelist disabled in Configs.")
		log_game("Whitelist disabled in Configs.")
		return TRUE

	if(!SSdbcore.Connect())
		log_world("Failed to connect to database in check_whitelist(). Disabling whitelist for current round.")
		log_game("Failed to connect to database in check_whitelist(). Disabling whitelist for current round.")
		CONFIG_SET(flag/usewhitelist, FALSE)
		return TRUE

	var/datum/db_query/query_get_whitelist = SSdbcore.NewQuery({"
		SELECT id FROM [format_table_name("whitelist")]
		WHERE ckey = :ckey
	"}, list("ckey" = key)
	)

	if(!query_get_whitelist.Execute())
		log_sql("Whitelist check for ckey [key] failed to execute. Rejecting")
		message_admins("Whitelist check for ckey [key] failed to execute. Rejecting")
		qdel(query_get_whitelist)
		return FALSE

	var/allow = query_get_whitelist.NextRow()

	qdel(query_get_whitelist)

	return allow

/datum/tgs_chat_command/whitelist
	name = "whitelist"
	help_text = "whitelist <add <ckey>|remove <ckey>|reload|list>"
	admin_only = TRUE

/datum/tgs_chat_command/whitelist/Run(datum/tgs_chat_user/sender, params)
	. = ""
	if(!CONFIG_GET(flag/usewhitelist))
		. += "The whitelist is not enabled!\nThe command will continue to execute anyway\n"

	var/list/all_params = splittext(params, " ")
	if(length(all_params) < 1)
		. += "Invalid argument"
		return

	switch(all_params[1])
		if("add")
			var/key = ckey(all_params[2])

			var/datum/db_query/query_get_whitelist = SSdbcore.NewQuery({"
				SELECT id FROM [format_table_name("whitelist")]
				WHERE ckey = :ckey
			"}, list("ckey" = key)
			)
			if(!query_get_whitelist.Execute())
				. += "Failed to add ckey `[key]`\n"
				. += query_get_whitelist.ErrorMsg()
				qdel(query_get_whitelist)
				return

			if(query_get_whitelist.NextRow())
				. += "`[key]` is already in whitelist!\n"
				qdel(query_get_whitelist)
				return

			qdel(query_get_whitelist)

			if(length(all_params) < 2)
				. += "Invalid argument"
				return

			var/datum/db_query/query_add_whitelist = SSdbcore.NewQuery({"
				INSERT INTO [format_table_name("whitelist")] (ckey)
				VALUES (:ckey)
			"}, list("ckey" = key))
			if(!query_add_whitelist.Execute())
				. += "Failed to add ckey `[key]`\n"
				. += query_add_whitelist.ErrorMsg()
				qdel(query_add_whitelist)
				return

			qdel(query_add_whitelist)

			. += "`[key]` has been added to the whitelist!\n"
			return

		if("remove")
			if(length(all_params) < 2)
				. += "Invalid argument"
				return

			var/key = ckey(all_params[2])

			var/datum/db_query/query_remove_whitelist = SSdbcore.NewQuery({"
				DELETE FROM [format_table_name("whitelist")]
				WHERE ckey = :ckey
			"}, list("ckey" = key))

			if(!query_remove_whitelist.Execute())
				. += "Failed to remove ckey `[key]`"
				. += query_remove_whitelist.ErrorMsg()
				qdel(query_remove_whitelist)
				return

			qdel(query_remove_whitelist)

			. += "`[key]` has been removed from the whitelist!\n"
			return

		if("list")
			var/datum/db_query/query_get_all_whitelist = SSdbcore.NewQuery("SELECT ckey FROM [format_table_name("whitelist")]")

			if(!query_get_all_whitelist.Execute())
				. += "Failed to get all whitelisted keys\n"
				. += query_get_all_whitelist.ErrorMsg()
				qdel(query_get_all_whitelist)
				return

			while(query_get_all_whitelist.NextRow())
				var/key = query_get_all_whitelist.item[1]
				. += "`[key]`\n"

			qdel(query_get_all_whitelist)
			return

		else
			. += "Unknown command!"
			return
// ARK STATION ADDED || BLUEMOON WHITELIST
