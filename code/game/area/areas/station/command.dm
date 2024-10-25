/area/station/command
	name = "Command"
	icon_state = "command"
	ambientsounds = list(
		'sound/ambience/misc/signal.ogg',
		)
	airlock_wires = /datum/wires/airlock/command
	sound_environment = SOUND_AREA_STANDARD_STATION

/area/station/command/bridge
	name = "\improper Bridge"
	icon_state = "bridge"

/area/station/command/meeting_room
	name = "\improper Heads of Staff Meeting Room"
	icon_state = "meeting"
	sound_environment = SOUND_AREA_MEDIUM_SOFTFLOOR

/area/station/command/meeting_room/council
	name = "\improper Council Chamber"
	icon_state = "meeting"
	sound_environment = SOUND_AREA_MEDIUM_SOFTFLOOR

/area/station/command/corporate_showroom
	name = "\improper Corporate Showroom"
	icon_state = "showroom"
	sound_environment = SOUND_AREA_MEDIUM_SOFTFLOOR

/area/station/command/corporate_suite
	name = "\improper Corporate Guest Suite"
	icon_state = "command"
	sound_environment = SOUND_AREA_WOODFLOOR

/area/station/command/emergency_closet
	name = "\improper Corporate Emergency Closet"
	icon_state = "command"
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/*
* Command Head Areas
*/

/area/station/command/heads_quarters
	icon_state = "heads_quarters"

/area/station/command/heads_quarters/captain
	name = "\improper Ark Commander's Office" // ARK STATION EDIT
	icon_state = "captain"
	sound_environment = SOUND_AREA_WOODFLOOR

/area/station/command/heads_quarters/captain/private
	name = "\improper Ark Commander's Quarters" // ARK STATION EDIT
	icon_state = "captain_private"
	sound_environment = SOUND_AREA_WOODFLOOR

/area/station/command/heads_quarters/ce
	name = "\improper Tech Overseer's Office" // ARK STATION EDIT
	icon_state = "ce_office"

/area/station/command/heads_quarters/cmo
	name = "\improper Medtech Curator's Office" // ARK STATION EDIT
	icon_state = "cmo_office"

/area/station/command/heads_quarters/hop
	name = "\improper Donk Co. Manager's Office" // ARK STATION EDIT
	icon_state = "hop_office"

/area/station/command/heads_quarters/hos
	name = "\improper Head of Red Hawk's Office" // ARK STATION EDIT
	icon_state = "hos_office"

/area/station/command/heads_quarters/rd
	name = "\improper Scientific Director's Office" // ARK STATION EDIT
	icon_state = "rd_office"

/area/station/command/heads_quarters/qm
	name = "\improper Quartermaster's Office"
	icon_state = "qm_office"

/*
* Command - Teleporter
*/

/area/station/command/teleporter
	name = "\improper Teleporter Room"
	icon_state = "teleporter"
	ambience_index = AMBIENCE_ENGI

/area/station/command/gateway
	name = "\improper Gateway"
	icon_state = "gateway"
	ambience_index = AMBIENCE_ENGI

/*
* Command - Misc
*/

/area/station/command/corporate_dock
	name = "\improper Corporate Private Dock"
	icon_state = "command"
	sound_environment = SOUND_AREA_SMALL_SOFTFLOOR
