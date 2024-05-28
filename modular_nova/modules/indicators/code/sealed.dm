// /obj/vehicle/sealed // ARK STATION REMOVED
// 	/// Is combat indicator on for this vehicle? Boolean.
// 	var/combat_indicator_vehicle = FALSE
// 	/// When is the next time this vehicle will be able to use flick_emote and put the fluff text in chat?
// 	var/vehicle_next_combat_popup = 0

//Register the signal to the mob and mechs will listen for when CI is toggled, then call the parent proc, then turn on CI if the mob had CI on.
/obj/vehicle/sealed/add_occupant(mob/occupant_entering, control_flags) // ARK STATION REMOVED
	// RegisterSignal(occupant_entering, COMSIG_MOB_CI_TOGGLED, PROC_REF(mob_toggled_ci)) // ARK STATION REMOVED
	. = ..()
	// handle_ci_migration(occupant_entering) // ARK STATION REMOVED

//Unregister the signal then disable CI if the vehicle has no other drivers within it.
/obj/vehicle/sealed/remove_occupant(mob/occupant_exiting) // ARK STATION REMOVED
	// UnregisterSignal(occupant_exiting, COMSIG_MOB_CI_TOGGLED) // ARK STATION REMOVED
	. = ..()
	// disable_ci(occupant_exiting) // ARK STATION REMOVED
