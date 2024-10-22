// SERVICE - MEDICAL BLACK

/obj/machinery/door/airlock/service
	icon = 'modularz_arkstation/modules/new-airlocks/icons/service.dmi'

/obj/structure/door_assembly/door_assembly_service
	icon = 'modularz_arkstation/modules/new-airlocks/icons/service.dmi'

// VIROLOGY - MEDICAL WHITE

/obj/machinery/door/airlock/virology
	icon = 'modularz_arkstation/modules/new-airlocks/icons/virology.dmi'

/obj/structure/door_assembly/door_assembly_viro
	icon = 'modularz_arkstation/modules/new-airlocks/icons/virology.dmi'

// CHURCH - BLACK-WHITE

/obj/machinery/door/airlock/church
	name = "church airlock"
	icon = 'modularz_arkstation/modules/new-airlocks/icons/church.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_church

/obj/machinery/door/airlock/church/glass
	name = "church glass airlock"
	opacity = FALSE
	glass = TRUE

/obj/structure/door_assembly/door_assembly_church
	name = "church airlock assembly"
	icon = 'modularz_arkstation/modules/new-airlocks/icons/church.dmi'
	base_name = "church airlock"
	glass_type = /obj/machinery/door/airlock/church/glass
	airlock_type = /obj/machinery/door/airlock/church

// REFORCED //

/*
	Station Airlocks Regular
*/

/obj/machinery/door/airlock
	icon = 'modularz_arkstation/modules/new-airlocks/airlocks/station/public.dmi'
	overlays_file = 'modularz_arkstation/modules/new-airlocks/airlocks/station/overlays.dmi'

/obj/machinery/door/airlock/command
	icon = 'modularz_arkstation/modules/new-airlocks/airlocks/station/command.dmi'

/obj/machinery/door/airlock/security
	icon = 'modularz_arkstation/modules/new-airlocks/airlocks/station/security.dmi'

/obj/machinery/door/airlock/engineering
	icon = 'modularz_arkstation/modules/new-airlocks/airlocks/station/engineering.dmi'

/obj/machinery/door/airlock/medical
	icon = 'modularz_arkstation/modules/new-airlocks/airlocks/station/medical.dmi'

/obj/machinery/door/airlock/maintenance
	name = "maintenance access"
	icon = 'modularz_arkstation/modules/new-airlocks/airlocks/station/maintenance.dmi'

/obj/machinery/door/airlock/maintenance/external
	name = "external airlock access"
	icon = 'modularz_arkstation/modules/new-airlocks/airlocks/station/maintenanceexternal.dmi'

/obj/machinery/door/airlock/mining
	name = "mining airlock"
	icon = 'modularz_arkstation/modules/new-airlocks/airlocks/station/mining.dmi'

/obj/machinery/door/airlock/atmos
	name = "atmospherics airlock"
	icon = 'modularz_arkstation/modules/new-airlocks/airlocks/station/atmos.dmi'

/obj/machinery/door/airlock/research
	icon = 'modularz_arkstation/modules/new-airlocks/airlocks/station/research.dmi'

/obj/machinery/door/airlock/freezer
	name = "freezer airlock"
	icon = 'modularz_arkstation/modules/new-airlocks/airlocks/station/freezer.dmi'

/obj/machinery/door/airlock/science
	icon = 'modularz_arkstation/modules/new-airlocks/airlocks/station/science.dmi'

/obj/machinery/door/airlock/virology
	icon = 'modularz_arkstation/modules/new-airlocks/airlocks/station/virology.dmi'

/obj/machinery/door/airlock/public
	icon = 'modularz_arkstation/modules/new-airlocks/airlocks/station2/glass.dmi'
	overlays_file = 'modularz_arkstation/modules/new-airlocks/airlocks/station2/overlays.dmi'

/obj/machinery/door/airlock/corporate
	icon = 'modularz_arkstation/modules/new-airlocks/airlocks/station/solgov.dmi'

/obj/machinery/door/airlock/external
	name = "external airlock"
	icon = 'modularz_arkstation/modules/new-airlocks/airlocks/external/external.dmi'
	overlays_file = 'modularz_arkstation/modules/new-airlocks/airlocks/external/overlays.dmi'
	note_overlay_file = 'modularz_arkstation/modules/new-airlocks/airlocks/external/overlays.dmi'

/obj/machinery/door/airlock/centcom
	icon = 'modularz_arkstation/modules/new-airlocks/airlocks/centcom/centcom.dmi'
	overlays_file = 'modularz_arkstation/modules/new-airlocks/airlocks/centcom/overlays.dmi'

/obj/machinery/door/airlock/grunge
	icon = 'modularz_arkstation/modules/new-airlocks/airlocks/centcom/centcom.dmi'
	overlays_file = 'modularz_arkstation/modules/new-airlocks/airlocks/centcom/overlays.dmi'

/obj/machinery/door/airlock/hatch
	name = "airtight hatch"
	icon = 'modularz_arkstation/modules/new-airlocks/airlocks/hatch/centcom.dmi'
	overlays_file = 'modularz_arkstation/modules/new-airlocks/airlocks/hatch/overlays.dmi'
	note_overlay_file = 'modularz_arkstation/modules/new-airlocks/airlocks/hatch/overlays.dmi'

/obj/machinery/door/airlock/maintenance_hatch
	name = "maintenance hatch"
	icon = 'modularz_arkstation/modules/new-airlocks/airlocks/hatch/maintenance.dmi'
	overlays_file = 'modularz_arkstation/modules/new-airlocks/airlocks/hatch/overlays.dmi'
	note_overlay_file = 'modularz_arkstation/modules/new-airlocks/airlocks/hatch/overlays.dmi'

/obj/machinery/door/airlock/shuttle
	icon = 'modularz_arkstation/modules/new-airlocks/airlocks/station/silver.dmi'
	overlays_file = 'modularz_arkstation/modules/new-airlocks/airlocks/station/overlays.dmi'

/obj/machinery/door/airlock/bathroom
	icon = 'modularz_arkstation/modules/new-airlocks/airlocks/station/freezer.dmi'
	overlays_file = 'modularz_arkstation/modules/new-airlocks/airlocks/station/overlays.dmi'

/obj/machinery/door/airlock/titanium
	icon = 'modularz_arkstation/modules/new-airlocks/airlocks/station/silver.dmi'
	overlays_file = 'modularz_arkstation/modules/new-airlocks/airlocks/station/overlays.dmi'

/obj/machinery/door/airlock/silver
	icon = 'modularz_arkstation/modules/new-airlocks/airlocks/station/silver.dmi'
	overlays_file = 'modularz_arkstation/modules/new-airlocks/airlocks/station/overlays.dmi'

/obj/machinery/door/airlock/plasma
	icon = 'modularz_arkstation/modules/new-airlocks/airlocks/station/plasma.dmi'
	overlays_file = 'modularz_arkstation/modules/new-airlocks/airlocks/station/overlays.dmi'

/obj/machinery/door/airlock/gold
	icon = 'modularz_arkstation/modules/new-airlocks/airlocks/station/gold.dmi'
	overlays_file = 'modularz_arkstation/modules/new-airlocks/airlocks/station/overlays.dmi'

/obj/machinery/door/airlock/diamond
	icon = 'modularz_arkstation/modules/new-airlocks/airlocks/station/diamond.dmi'
	overlays_file = 'modularz_arkstation/modules/new-airlocks/airlocks/station/overlays.dmi'

/obj/machinery/door/airlock/bananium
	icon = 'modularz_arkstation/modules/new-airlocks/airlocks/station/bananium.dmi'
	overlays_file = 'modularz_arkstation/modules/new-airlocks/airlocks/station/overlays.dmi'

/obj/machinery/door/airlock/uranium
	icon = 'modularz_arkstation/modules/new-airlocks/airlocks/station/uranium.dmi'
	overlays_file = 'modularz_arkstation/modules/new-airlocks/airlocks/station/overlays.dmi'

/obj/machinery/door/airlock/wood
	icon = 'modularz_arkstation/modules/new-airlocks/airlocks/station/wood.dmi'
	overlays_file = 'modularz_arkstation/modules/new-airlocks/airlocks/station/overlays.dmi'

/obj/machinery/door/airlock/sandstone
	icon = 'modularz_arkstation/modules/new-airlocks/airlocks/station/sandstone.dmi'
	overlays_file = 'modularz_arkstation/modules/new-airlocks/airlocks/station/overlays.dmi'

/obj/machinery/door/airlock/survival_pod
	icon = 'modularz_arkstation/modules/new-airlocks/airlocks/station/base_airlock.dmi'
	overlays_file = 'modularz_arkstation/modules/new-airlocks/airlocks/station2/overlays.dmi'

////
/obj/machinery/door/airlock/proc/airlock_dir_change(mob/user, obj/item/wrench, new_dir, time = 20)
	if(wrench.tool_behaviour != TOOL_WRENCH)
		return CANT_UNFASTEN
	if(time)
		to_chat(user, span_notice("You begin changing [src]'s direction..."))
	if(!wrench.use_tool(src, user, time))
		return FAILED_UNFASTEN
	wrench.play_tool_sound(src, 50)
	setDir(new_dir)

////
/obj/machinery/door/poddoor/Initialize(mapload)
	. = ..()
	update_dir()

/obj/machinery/door/poddoor/proc/find_list_object_in_dir(search_dir)
	var/turf/adjacent_turf = get_step(src, search_dir)
	var/obj/item = null

	if(istype(adjacent_turf, /turf/closed/wall))
		return adjacent_turf

	for(item in adjacent_turf)
		if(istype(item, /obj/machinery/door/poddoor) || istype(item, /obj/structure/window/fulltile) || istype(item, /obj/structure/window/reinforced/fulltile) || istype(item, /obj/machinery/door/airlock) || istype(item, /obj/structure/window/reinforced/plasma/fulltile) || istype(item, /obj/structure/window/plasma/fulltile))
			return item

	return null

/obj/machinery/door/poddoor/proc/update_dir()
	var/left_turf = null
	var/right_turf = null
	var/top_turf = null
	var/bottom_turf = null
	switch(dir)
		if(NORTH)
			left_turf = find_list_object_in_dir(WEST)
			right_turf = find_list_object_in_dir(EAST)
			top_turf = find_list_object_in_dir(NORTH)
			bottom_turf = find_list_object_in_dir(SOUTH)

		if(EAST)
			left_turf = find_list_object_in_dir(NORTH)
			right_turf = find_list_object_in_dir(SOUTH)
			top_turf = find_list_object_in_dir(EAST)
			bottom_turf = find_list_object_in_dir(WEST)

		if(SOUTH)
			left_turf = find_list_object_in_dir(EAST)
			right_turf = find_list_object_in_dir(WEST)
			top_turf = find_list_object_in_dir(SOUTH)
			bottom_turf = find_list_object_in_dir(NORTH)

		if(WEST)
			left_turf = find_list_object_in_dir(SOUTH)
			right_turf = find_list_object_in_dir(NORTH)
			top_turf = find_list_object_in_dir(WEST)
			bottom_turf = find_list_object_in_dir(EAST)

	if(left_turf || right_turf)
		setDir(2)

	if(top_turf || bottom_turf)
		setDir(4)


/////////////////////////////////////////////////
/obj/machinery/door/airlock/Initialize(mapload)
	. = ..()
	update_dir()

/obj/machinery/door/airlock/proc/find_list_object_in_dir(search_dir)
	var/turf/adjacent_turf = get_step(src, search_dir)
	var/obj/item = null

	if(istype(adjacent_turf, /turf/closed/wall))
		return adjacent_turf

	for(item in adjacent_turf)
		if(istype(item, /obj/machinery/door/airlock) || istype(item, /obj/structure/window/fulltile) || istype(item, /obj/structure/window/reinforced/fulltile) || istype(item, /obj/structure/window/reinforced/plasma/fulltile) || istype(item, /obj/structure/window/plasma/fulltile))
			return item

	return null

/obj/machinery/door/airlock/proc/update_dir()
	var/left_turf = null
	var/right_turf = null
	var/top_turf = null
	var/bottom_turf = null
	switch(dir)
		if(NORTH)
			left_turf = find_list_object_in_dir(WEST)
			right_turf = find_list_object_in_dir(EAST)
			top_turf = find_list_object_in_dir(NORTH)
			bottom_turf = find_list_object_in_dir(SOUTH)

		if(EAST)
			left_turf = find_list_object_in_dir(NORTH)
			right_turf = find_list_object_in_dir(SOUTH)
			top_turf = find_list_object_in_dir(EAST)
			bottom_turf = find_list_object_in_dir(WEST)

		if(SOUTH)
			left_turf = find_list_object_in_dir(EAST)
			right_turf = find_list_object_in_dir(WEST)
			top_turf = find_list_object_in_dir(SOUTH)
			bottom_turf = find_list_object_in_dir(NORTH)

		if(WEST)
			left_turf = find_list_object_in_dir(SOUTH)
			right_turf = find_list_object_in_dir(NORTH)
			top_turf = find_list_object_in_dir(WEST)
			bottom_turf = find_list_object_in_dir(EAST)

	if(left_turf || right_turf)
		setDir(2)

	if(top_turf || bottom_turf)
		setDir(4)
