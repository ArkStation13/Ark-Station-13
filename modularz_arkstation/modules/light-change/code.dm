/obj/machinery/light
	bulb_colour = "#ffe6cd"
	brightness = 7.5 // 7.5
	bulb_power = 0.6
	nightshift_brightness = 6
	icon = 'modularz_arkstation/modules/light-change/lighting.dmi'
	overlay_icon = 'modularz_arkstation/modules/light-change/lighting.dmi'

	glow_icon_state = "tube"
	exposure_icon_state = "cone"

/obj/structure/light_construct
	icon = 'modularz_arkstation/modules/light-change/lighting.dmi'

/obj/item/light
	icon = 'modularz_arkstation/modules/light-change/lighting.dmi'

/obj/item/wallframe/light_fixture
	icon = 'modularz_arkstation/modules/light-change/lighting.dmi'

/obj/machinery/computer
	exposure_icon_state = "circle"
	glow_icon = 'modularz_arkstation/modules/new-computer-sprites/computer.dmi'
	glow_icon_state = "computer_light_mask"

/obj/machinery/computer/records/security/laptop
	glow_icon_state = "laptop_light_mask"

/obj/machinery/computer/records/medical/laptop
	glow_icon_state = "laptop_light_mask"

/obj/machinery/computer/security/wooden_tv
	glow_icon_state = "tv_light_mask"

/obj/machinery/computer/arcade
	glow_icon_state = "arcade_light_mask"

/obj/machinery/vending
	exposure_icon_state = "circle"
	glow_icon = 'modularz_arkstation/modules/new-vending-sprites/vendomats_dolbajob.dmi'
	glow_icon_state = "generic-light-mask"

/obj/machinery/vending/Initialize(mapload)
	. = ..()
	glow_icon_state = light_mask

/obj/machinery/power/apc
	exposure_icon_state = "circle"
	glow_icon = 'modularz_arkstation/modules/new-wall-machines/power.dmi'
	glow_icon_state = "apc_light_mask"
	light_on_range = 2

/obj/machinery/airalarm
	light_power = 0.8
	light_range = 1.5
	light_color = LIGHT_COLOR_ELECTRIC_GREEN
	exposure_icon_state = "circle"
	glow_icon = 'modularz_arkstation/modules/new-air-alarm/airalarm.dmi'
	glow_icon_state = "alarm-mask"

/obj/machinery/firealarm
	light_power = 0.5
	light_range = 1
	light_color = LIGHT_COLOR_ELECTRIC_GREEN
	exposure_icon_state = "circle"
	glow_icon = 'modularz_arkstation/modules/new-wall-machines/monitors.dmi'
	glow_icon_state = "fire_light_mask"

/obj/item/radio/intercom
	light_power = 0.8
	light_range = 1.5
	light_color = LIGHT_COLOR_ELECTRIC_GREEN
	exposure_icon_state = "circle"
	glow_icon = 'modularz_arkstation/modules/new-wall-machines/radio.dmi'
	glow_icon_state = "intercom_light_mask"

/obj/machinery/light/red
	glow_icon_state = "tube_red"
	bulb_colour = "#FF3232"

/obj/machinery/light/small
	glow_icon_state = "bulb"
	exposure_icon_state = "circle"
	bulb_power = 0.6

/obj/machinery/light/small/red
	glow_icon_state = "bulb_red"

/obj/machinery/light/small/maintenance
	bulb_colour = "#e0a142"
	nightshift_allowed = FALSE
	bulb_power = 0.45
	brightness = 2
	glow_icon_state = "bulb_maint"

/obj/machinery/light/floor
	brightness = 4
	bulb_power = 0.6
	glow_icon_state = "floor"
	exposure_icon_state = "floor"

/obj/machinery/light/dim
	nightshift_allowed = FALSE
	bulb_colour = "#ffd9b3"
	bulb_power = 0.5

/obj/machinery/light/small
	glow_icon_state = "bulb"
	exposure_icon_state = "circle"

/obj/machinery/light/warm
	bulb_colour = "#fae5c1"

#define MAPPING_DIRECTIONAL_HELPERS_LIGHT(path, dop_offset) ##path/directional/north {\
    dir = NORTH; \
    pixel_y = 32 + dop_offset; \
} \
##path/directional/south {\
    dir = SOUTH; \
    pixel_y = -32 - dop_offset; \
} \
##path/directional/east {\
    dir = EAST; \
    pixel_x = 32 + dop_offset; \
} \
##path/directional/west {\
    dir = WEST; \
    pixel_x = -32 - dop_offset; \
}

// -------- Directional presets
// The directions are backwards on the lights we have now
MAPPING_DIRECTIONAL_HELPERS_LIGHT(/obj/machinery/light, 0)

// ---- Broken tube
MAPPING_DIRECTIONAL_HELPERS_LIGHT(/obj/machinery/light/broken, 0)

// ---- Tube construct
MAPPING_DIRECTIONAL_HELPERS_LIGHT(/obj/structure/light_construct, 0)

// ---- Tube frames
MAPPING_DIRECTIONAL_HELPERS_LIGHT(/obj/machinery/light/built, 0)

// ---- No nightlight tubes
MAPPING_DIRECTIONAL_HELPERS_LIGHT(/obj/machinery/light/no_nightlight, 0)

// ---- Warm light tubes
MAPPING_DIRECTIONAL_HELPERS_LIGHT(/obj/machinery/light/warm, 0)

// ---- No nightlight warm light tubes
MAPPING_DIRECTIONAL_HELPERS_LIGHT(/obj/machinery/light/warm/no_nightlight, 0)

// ---- Dim warm light tubes
MAPPING_DIRECTIONAL_HELPERS_LIGHT(/obj/machinery/light/warm/dim, 0)

// ---- Cold light tubes
MAPPING_DIRECTIONAL_HELPERS_LIGHT(/obj/machinery/light/cold, 0)

// ---- No nightlight cold light tubes
MAPPING_DIRECTIONAL_HELPERS_LIGHT(/obj/machinery/light/cold/no_nightlight, 0)

// ---- Dim cold light tubes
MAPPING_DIRECTIONAL_HELPERS_LIGHT(/obj/machinery/light/cold/dim, 0)

// ---- Red tubes
MAPPING_DIRECTIONAL_HELPERS_LIGHT(/obj/machinery/light/red, 0)

// ---- Red dim tubes
MAPPING_DIRECTIONAL_HELPERS_LIGHT(/obj/machinery/light/red/dim, 0)

// ---- Blacklight tubes
MAPPING_DIRECTIONAL_HELPERS_LIGHT(/obj/machinery/light/blacklight, 0)

// ---- Dim tubes
MAPPING_DIRECTIONAL_HELPERS_LIGHT(/obj/machinery/light/dim, 0)

/* __________________________________________________________________ */

// ---- Bulb lights
MAPPING_DIRECTIONAL_HELPERS_LIGHT(/obj/machinery/light/small, -3)

// ---- Bulb construct
MAPPING_DIRECTIONAL_HELPERS_LIGHT(/obj/structure/light_construct/small, -3)

// ---- Bulb frames
MAPPING_DIRECTIONAL_HELPERS_LIGHT(/obj/machinery/light/small/built, -3)

// ---- Broken bulbs
MAPPING_DIRECTIONAL_HELPERS_LIGHT(/obj/machinery/light/small/broken, -3)

// ---- Red bulbs
MAPPING_DIRECTIONAL_HELPERS_LIGHT(/obj/machinery/light/small/dim, -3)

MAPPING_DIRECTIONAL_HELPERS_LIGHT(/obj/machinery/light/small/red, -3)

// ---- Red dim bulbs
MAPPING_DIRECTIONAL_HELPERS_LIGHT(/obj/machinery/light/small/red/dim, -3)

// ---- Blacklight bulbs
MAPPING_DIRECTIONAL_HELPERS_LIGHT(/obj/machinery/light/small/blacklight, -3)

#undef MAPPING_DIRECTIONAL_HELPERS_LIGHT
