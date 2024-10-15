/// Subsystem for controlling anything related to the escape menu
PROCESSING_SUBSYSTEM_DEF(escape_menu)
	name = "Escape Menu"
	flags = SS_NO_INIT
	runlevels = ALL
	wait = 200000 SECONDS // ARK STATION EDIT - КОСТЫЛЬ, НО ПОХУЙ.
