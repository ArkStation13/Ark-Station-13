/obj/machinery/light
	brightness = 7 // 7.5
	nightshift_brightness = 6
	bulb_colour = LIGHT_COLOR_TUNGSTEN
	nightshift_light_color = LIGHT_COLOR_TUNGSTEN
	icon = 'modularz_arkstation/modules/light-change/lighting.dmi'
	overlay_icon = 'modularz_arkstation/modules/light-change/lighting.dmi'

/obj/structure/light_construct
	icon = 'modularz_arkstation/modules/light-change/lighting.dmi'

/obj/item/light
	icon = 'modularz_arkstation/modules/light-change/lighting.dmi'

/obj/item/wallframe/light_fixture
	icon = 'modularz_arkstation/modules/light-change/lighting.dmi'

/obj/machinery/light/dim
	bulb_colour = LIGHT_COLOR_TUNGSTEN

/obj/machinery/light/small
	bulb_colour = LIGHT_COLOR_TUNGSTEN

/obj/machinery/light/warm
	bulb_colour = LIGHT_COLOR_TUNGSTEN

#define MAPPING_DIRECTIONAL_HELPERS_LIGHT(path, offset) ##path/directional/north {\
    dir = NORTH; \
    pixel_y = 32; \
} \
##path/directional/south {\
    dir = SOUTH; \
    pixel_y = -32; \
} \
##path/directional/east {\
    dir = EAST; \
    pixel_x = 32; \
} \
##path/directional/west {\
    dir = WEST; \
    pixel_x = -32; \
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


// -------- Bulb lights
MAPPING_DIRECTIONAL_HELPERS_LIGHT(/obj/machinery/light/small, 0)

// ---- Bulb construct
MAPPING_DIRECTIONAL_HELPERS_LIGHT(/obj/structure/light_construct/small, 0)

// ---- Bulb frames
MAPPING_DIRECTIONAL_HELPERS_LIGHT(/obj/machinery/light/small/built, 0)

// ---- Broken bulbs
MAPPING_DIRECTIONAL_HELPERS_LIGHT(/obj/machinery/light/small/broken, 0)

// ---- Red bulbs
MAPPING_DIRECTIONAL_HELPERS_LIGHT(/obj/machinery/light/small/dim, 0)

MAPPING_DIRECTIONAL_HELPERS_LIGHT(/obj/machinery/light/small/red, 0)

// ---- Red dim bulbs
MAPPING_DIRECTIONAL_HELPERS_LIGHT(/obj/machinery/light/small/red/dim, 0)

// ---- Blacklight bulbs
MAPPING_DIRECTIONAL_HELPERS_LIGHT(/obj/machinery/light/small/blacklight, 0)

#undef MAPPING_DIRECTIONAL_HELPERS_LIGHT
