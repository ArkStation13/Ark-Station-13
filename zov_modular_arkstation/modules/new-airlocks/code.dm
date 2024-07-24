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
