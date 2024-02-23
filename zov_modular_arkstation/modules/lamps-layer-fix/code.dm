/obj/machinery/light/Initialize(mapload)
	. = ..()
	set_layer_by_dir()

/obj/machinery/light/proc/set_layer_by_dir()
	if(dir == NORTH)
		layer = BELOW_MOB_LAYER

/obj/machinery/light/floor/set_layer_by_dir()
	return TRUE

/obj/machinery/light
	brightness = 5.5
	bulb_colour = LIGHT_COLOR_TUNGSTEN
	nightshift_light_color = null

/obj/machinery/light/dim
	brightness = 3
	nightshift_brightness = 2.5
	bulb_colour = LIGHT_COLOR_TUNGSTEN
	bulb_power = 0.8

/obj/machinery/light/small
	brightness = 5
	nightshift_brightness = 4.5
	bulb_colour = LIGHT_COLOR_TUNGSTEN
	bulb_power = 0.9

/obj/machinery/light/cold
	bulb_colour = LIGHT_COLOR_DEFAULT
	nightshift_light_color = null

/obj/machinery/light/warm
	bulb_colour = LIGHT_COLOR_TUNGSTEN
	nightshift_light_color = null

/obj/machinery/light/floor
	brightness = 5.5
	bulb_colour = LIGHT_COLOR_TUNGSTEN
	nightshift_light_color = null
	nightshift_brightness = 4
