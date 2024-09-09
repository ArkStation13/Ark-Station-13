// SERVICE - MEDICAL BLACK

/obj/machinery/door/airlock/service
	icon = 'zov_modular_arkstation/modules/new-airlocks/icons/service.dmi'

/obj/structure/door_assembly/door_assembly_service
	icon = 'zov_modular_arkstation/modules/new-airlocks/icons/service.dmi'

// VIROLOGY - MEDICAL WHITE

/obj/machinery/door/airlock/virology
	icon = 'zov_modular_arkstation/modules/new-airlocks/icons/virology.dmi'

/obj/structure/door_assembly/door_assembly_viro
	icon = 'zov_modular_arkstation/modules/new-airlocks/icons/virology.dmi'

// CHURCH - BLACK-WHITE

/obj/machinery/door/airlock/church
	name = "church airlock"
	icon = 'zov_modular_arkstation/modules/new-airlocks/icons/church.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_church

/obj/machinery/door/airlock/church/glass
	name = "church glass airlock"
	opacity = FALSE
	glass = TRUE

/obj/structure/door_assembly/door_assembly_church
	name = "church airlock assembly"
	icon = 'zov_modular_arkstation/modules/new-airlocks/icons/church.dmi'
	base_name = "church airlock"
	glass_type = /obj/machinery/door/airlock/church/glass
	airlock_type = /obj/machinery/door/airlock/church

// REFORCED //

/*
	Station Airlocks Regular
*/

/obj/machinery/door/airlock
	icon = 'zov_modular_arkstation/modules/new-airlocks/airlocks/station/public.dmi'
	overlays_file = 'zov_modular_arkstation/modules/new-airlocks/airlocks/station/overlays.dmi'

/obj/machinery/door/airlock/command
	icon = 'zov_modular_arkstation/modules/new-airlocks/airlocks/station/command.dmi'

/obj/machinery/door/airlock/security
	icon = 'zov_modular_arkstation/modules/new-airlocks/airlocks/station/security.dmi'

/obj/machinery/door/airlock/engineering
	icon = 'zov_modular_arkstation/modules/new-airlocks/airlocks/station/engineering.dmi'

/obj/machinery/door/airlock/medical
	icon = 'zov_modular_arkstation/modules/new-airlocks/airlocks/station/medical.dmi'

/obj/machinery/door/airlock/maintenance
	name = "maintenance access"
	icon = 'zov_modular_arkstation/modules/new-airlocks/airlocks/station/maintenance.dmi'

/obj/machinery/door/airlock/maintenance/external
	name = "external airlock access"
	icon = 'zov_modular_arkstation/modules/new-airlocks/airlocks/station/maintenanceexternal.dmi'

/obj/machinery/door/airlock/mining
	name = "mining airlock"
	icon = 'zov_modular_arkstation/modules/new-airlocks/airlocks/station/mining.dmi'

/obj/machinery/door/airlock/atmos
	name = "atmospherics airlock"
	icon = 'zov_modular_arkstation/modules/new-airlocks/airlocks/station/atmos.dmi'

/obj/machinery/door/airlock/research
	icon = 'zov_modular_arkstation/modules/new-airlocks/airlocks/station/research.dmi'

/obj/machinery/door/airlock/freezer
	name = "freezer airlock"
	icon = 'zov_modular_arkstation/modules/new-airlocks/airlocks/station/freezer.dmi'

/obj/machinery/door/airlock/science
	icon = 'zov_modular_arkstation/modules/new-airlocks/airlocks/station/science.dmi'

/obj/machinery/door/airlock/virology
	icon = 'zov_modular_arkstation/modules/new-airlocks/airlocks/station/virology.dmi'

/obj/machinery/door/airlock/public
	icon = 'zov_modular_arkstation/modules/new-airlocks/airlocks/station2/glass.dmi'
	overlays_file = 'zov_modular_arkstation/modules/new-airlocks/airlocks/station2/overlays.dmi'

/obj/machinery/door/airlock/external
	name = "external airlock"
	icon = 'zov_modular_arkstation/modules/new-airlocks/airlocks/external/external.dmi'
	overlays_file = 'zov_modular_arkstation/modules/new-airlocks/airlocks/external/overlays.dmi'
	note_overlay_file = 'zov_modular_arkstation/modules/new-airlocks/airlocks/external/overlays.dmi'

/obj/machinery/door/airlock/centcom
	icon = 'zov_modular_arkstation/modules/new-airlocks/airlocks/centcom/centcom.dmi'
	overlays_file = 'zov_modular_arkstation/modules/new-airlocks/airlocks/centcom/overlays.dmi'

/obj/machinery/door/airlock/grunge
	icon = 'zov_modular_arkstation/modules/new-airlocks/airlocks/centcom/centcom.dmi'
	overlays_file = 'zov_modular_arkstation/modules/new-airlocks/airlocks/centcom/overlays.dmi'

/obj/machinery/door/airlock/vault
	name = "vault door"
	icon = 'zov_modular_arkstation/modules/new-airlocks/airlocks/vault/vault.dmi'
	overlays_file = 'zov_modular_arkstation/modules/new-airlocks/airlocks/vault/overlays.dmi'

/obj/machinery/door/airlock/hatch
	name = "airtight hatch"
	icon = 'zov_modular_arkstation/modules/new-airlocks/airlocks/hatch/centcom.dmi'
	overlays_file = 'zov_modular_arkstation/modules/new-airlocks/airlocks/hatch/overlays.dmi'
	note_overlay_file = 'zov_modular_arkstation/modules/new-airlocks/airlocks/hatch/overlays.dmi'

/obj/machinery/door/airlock/maintenance_hatch
	name = "maintenance hatch"
	icon = 'zov_modular_arkstation/modules/new-airlocks/airlocks/hatch/maintenance.dmi'
	overlays_file = 'zov_modular_arkstation/modules/new-airlocks/airlocks/hatch/overlays.dmi'
	note_overlay_file = 'zov_modular_arkstation/modules/new-airlocks/airlocks/hatch/overlays.dmi'

/obj/machinery/door/airlock/highsecurity
	name = "high tech security airlock"
	icon = 'zov_modular_arkstation/modules/new-airlocks/airlocks/highsec/highsec.dmi'
	overlays_file = 'zov_modular_arkstation/modules/new-airlocks/airlocks/highsec/overlays.dmi'

/obj/machinery/door/airlock/shuttle
	name = "shuttle airlock"
	icon = 'zov_modular_arkstation/modules/new-airlocks/airlocks/shuttle/shuttle.dmi'
	overlays_file = 'zov_modular_arkstation/modules/new-airlocks/airlocks/shuttle/old_overlays.dmi'

/obj/machinery/door/airlock/abductor
	name = "alien airlock"
	desc = "With humanity's current technological level, it could take years to hack this advanced airlock... or maybe we should give a screwdriver a try?"
	icon = 'zov_modular_arkstation/modules/new-airlocks/airlocks/abductor/abductor_airlock.dmi'
	overlays_file = 'zov_modular_arkstation/modules/new-airlocks/airlocks/abductor/overlays.dmi'
	note_overlay_file = 'zov_modular_arkstation/modules/new-airlocks/airlocks/external/overlays.dmi'

/obj/machinery/door/airlock/cult
	name = "cult airlock"
	icon = 'zov_modular_arkstation/modules/new-airlocks/airlocks/cult/runed/cult.dmi'
	overlays_file = 'zov_modular_arkstation/modules/new-airlocks/airlocks/cult/runed/overlays.dmi'
