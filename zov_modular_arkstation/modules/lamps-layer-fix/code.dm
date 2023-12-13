/obj/machinery/light/Initialize(mapload)
	. = ..()
	set_layer_by_dir()

/obj/machinery/light/proc/set_layer_by_dir()
	if(dir == NORTH)
		layer = BELOW_MOB_LAYER

/obj/machinery/light/floor/set_layer_by_dir()
	return TRUE
