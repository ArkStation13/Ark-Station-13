// /datum/controller/subsystem/persistence
// 	var/list/saved_modes = list(1,2,3)

/datum/controller/subsystem/persistence/proc/save_gamemode()
	var/json_file = file("data/RecentModes.json")
	var/list/file_data = list()
	saved_modes[3] = saved_modes[2]
	saved_modes[2] = saved_modes[1]
	saved_modes[1] = GLOB.dynamic_forced_extended == TRUE? "Extended" : "Dynamic"
	file_data["data"] = saved_modes
	fdel(json_file)
	WRITE_FILE(json_file, json_encode(file_data))

/datum/controller/subsystem/persistence/proc/load_gamemode()
	var/json_file = file("data/RecentModes.json")
	if(!fexists(json_file))
		return
	var/list/json = json_decode(file2text(json_file))
	if(!json)
		return
	saved_modes = json["data"]

// Combo Check Start
/datum/controller/subsystem/proc/check_combo()
	var/list/roundtypes = list()
	log_world("SSpersistence.saved_modes contents:")
	for(var/mode in SSpersistence.saved_modes)
		log_world("- [mode]: [SSpersistence.saved_modes[mode]]")

	for(var/mode in SSpersistence.saved_modes)
		if(!istext(mode))
			continue
		if(!(mode in roundtypes))
			roundtypes[mode] = 0
		roundtypes[mode]++
		if(roundtypes[mode] >= 3)
			return mode
	return FALSE

// Combo Check End
