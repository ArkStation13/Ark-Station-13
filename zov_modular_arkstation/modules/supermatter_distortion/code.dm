/obj/machinery/power/supermatter_crystal
	appearance_flags = PIXEL_SCALE // no tile bound to allow distortion to render outside of direct view
	var/atom/movable/distortion_effect/distort
	var/last_status

/atom/movable/distortion_effect
	name = ""
	plane = GRAVITY_PULSE_PLANE
	// Changing the colour of this based on the parent will cause issues with the displacement effect
	// so we need to ensure that it always has the default colour (clear).
	appearance_flags = PIXEL_SCALE | RESET_COLOR | RESET_ALPHA | RESET_TRANSFORM | NO_CLIENT_COLOR
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	icon = 'zov_modular_arkstation/modules/supermatter_distortion/96x96.dmi'
	icon_state = "SM_base"
	pixel_x = -32
	pixel_y = -32

/obj/machinery/power/supermatter_crystal/Initialize(mapload)
	. = ..()
	distort = new(src)

/obj/machinery/power/supermatter_crystal/Destroy()
	. = ..()
	distort.icon = 'zov_modular_arkstation/modules/supermatter_distortion/32x32.dmi'
	distort.icon_state = "SM_remnant"
	distort.pixel_x = 0
	distort.pixel_y = 0
	distort.forceMove(get_turf(src))
	distort = null
	qdel(distort)
	..()

/obj/machinery/power/supermatter_crystal/process_atmos()
	var/current_status = get_status()
	if(current_status != last_status)
		last_status = current_status
		update_icon(UPDATE_OVERLAYS)
	..()

/obj/machinery/power/supermatter_crystal/proc/get_displacement_icon()
	switch(last_status)
		if(SUPERMATTER_INACTIVE)
			distort.icon = 'zov_modular_arkstation/modules/supermatter_distortion/96x96.dmi'
			distort.icon_state = "SM_base"
			distort.pixel_x = -32
			distort.pixel_y = -32
			light_range = 4
			light_power = 5
			light_color = "#ffe016"
		if(SUPERMATTER_NORMAL, SUPERMATTER_NOTIFY, SUPERMATTER_WARNING)
			distort.icon = 'zov_modular_arkstation/modules/supermatter_distortion/96x96.dmi'
			distort.icon_state = "SM_base_active"
			distort.pixel_x = -32
			distort.pixel_y = -32
			light_range = 4
			light_power = 7
			light_color = "#ffe016"
		if(SUPERMATTER_DANGER)
			distort.icon = 'zov_modular_arkstation/modules/supermatter_distortion/160x160.dmi'
			distort.icon_state = "SM_delam_1"
			distort.pixel_x = -64
			distort.pixel_y = -64
			light_range = 5
			light_power = 10
			light_color = "#ffb516"
		if(SUPERMATTER_EMERGENCY)
			distort.icon = 'zov_modular_arkstation/modules/supermatter_distortion/224x224.dmi'
			distort.icon_state = "SM_delam_2"
			distort.pixel_x = -96
			distort.pixel_y = -96
			light_range = 6
			light_power = 10
			light_color = "#ff9208"
		if(SUPERMATTER_DELAMINATING)
			distort.icon = 'zov_modular_arkstation/modules/supermatter_distortion/288x288.dmi'
			distort.icon_state = "SM_delam_3"
			distort.pixel_x = -128
			distort.pixel_y = -128
			light_range = 7
			light_power = 15
			light_color = "#ff5006"
	return distort

/obj/machinery/power/supermatter_crystal/update_overlays()
	. = ..()
	. += get_displacement_icon()
	if(final_countdown)
		. += "causality_field"
