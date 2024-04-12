/obj/machinery/meter
	icon = 'zov_modular_arkstation/modules/goon-icons-port/goon-atmos-meter.dmi'

/obj/structure/shipping_container/ntbox
	name = "container"
	desc = "Container with Nanotreisen identification marks."
	icon = 'zov_modular_arkstation/modules/goon-icons-port/goon-crates.dmi'
	icon_state = "ntcrate1"

/obj/structure/shipping_container/ntbox/two
	icon_state = "ntcrate2"

/obj/machinery/dna_scannernew
	icon = 'zov_modular_arkstation/modules/goon-icons-port/goon-cryogenics.dmi'
	icon_state = "scanner"
	base_icon_state = "scanner"

/obj/item/healthanalyzer
	name = "health analyzer"
	icon = 'zov_modular_arkstation/modules/goon-icons-port/goon-devices.dmi'
	icon_state = "health"
	inhand_icon_state = "healthanalyzer"
	worn_icon_state = "healthanalyzer"
	lefthand_file = 'icons/mob/inhands/equipment/medical_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/medical_righthand.dmi'

/obj/item/assembly/igniter
	icon = 'zov_modular_arkstation/modules/goon-icons-port/goon-devices.dmi'
	icon_state = "igniter"
	base_icon_state = "igniter"

/obj/item/assembly/igniter/activate()
	. = ..()
	icon_state = "[base_icon_state]_light"
	sleep(2 SECONDS)
	icon_state = base_icon_state

/obj/item/assembly/signaler
	icon = 'zov_modular_arkstation/modules/goon-icons-port/goon-devices.dmi'
	icon_state = "signaller"

/obj/structure/holosign/big_structure
	name = "hologramm"
	desc = "Giant sctricture."
	icon = 'zov_modular_arkstation/modules/goon-icons-port/goon-golo.dmi'
	icon_state = "structure-relay"

/obj/item/bikehorn
	icon = 'zov_modular_arkstation/modules/goon-icons-port/goon-instruments.dmi'
	icon_state = "bike_horn"

/obj/item/mop
	icon = 'zov_modular_arkstation/modules/goon-icons-port/goon-janitor.dmi'
	icon_state = "mop"

/obj/item/station_charter
	name = "station charter"
	icon = 'icons/obj/scrolls.dmi'
	icon_state = "charter"

/obj/item/clothing/neck/stethoscope
	icon = 'zov_modular_arkstation/modules/goon-icons-port/goon-stethoscope.dmi'
	icon_state = "stethoscope"

/obj/structure/generator_structure
	name = "generator"
	desc = "Massive generator. It is stoped."
	icon = 'zov_modular_arkstation/modules/goon-icons-port/goon-turbine.dmi'
	icon_state = "turbine_main"
	max_integrity = 1000
	bound_width = 96
	bound_height = 160
	density = TRUE
	anchored = TRUE
	layer = ABOVE_ALL_MOB_LAYER
	plane = ABOVE_GAME_PLANE

/obj/structure/generator_structure/work
	desc = "Massive generator. It is works."
	icon_state = "turbine_spin"

/obj/structure/generator_structure/ruined
	desc = "Massive generator. It is broken."
	icon_state = "ruined"

/obj/structure/train_carriage
	name = "train carriage"
	desc = "It carries cargo."
	icon = 'zov_modular_arkstation/modules/goon-icons-port/goon-vagons_stoped.dmi'
	icon_state = "car-platform"
	max_integrity = 1000
	bound_width = 64
	bound_height = 48
	density = TRUE
	anchored = TRUE
	layer = ABOVE_ALL_MOB_LAYER
	plane = ABOVE_GAME_PLANE

/turf/open/indestructible/void
	icon = 'zov_modular_arkstation/modules/goon-icons-port/goon-void.dmi'
	icon_state = "void"
	name = "V̷̙̲̫̙͈͈̠̭̮̗͓̣͉̤̪̘͉͈̤́̓̀̀̿̓͛͒̄̂̈́̎̄̐̄̿̾̈́ȯ̶͙̬͚̙̫̫̯͓̳͈̤͎̗͙͔̫̙̙͚̿̓͒̍̌̒̑̎̅̊̍̇́̿̄i҈͚̯͉͉̜̪̜͈͙͇̠̦̬̟̱̞͎͕̞̈̋̑̒̄̎̀̐̐̐̀̏d̸͕͓̝̰͕͔͚̣̥̙͍̲͍͔̗͔̞͎̔̈́̅̽̀͑͒͌̌̊̇̒̓̂̌̈́̑̔͗̃͆͆͆̚ͅ"
	desc = "W҉̧̘̾̂͠h̵̢̥͔̋͡ä̶̡͇̙̈͝t҉̢̖̪͉͐̾̕ t̸͙͔̭̊͋͜͠h̴̫̅̕͜ĕ̵͔̬̥͆̕͢ F҉̡̥̤̩҇̀͂Ù̸̫̟̈̊͢͠C̴̨͖̀̀͠Ķ̶̰͕҇̿"

/turf/open/indestructible/void/Initialize(mapload)
	. = ..()

	var/static/list/loc_connections = list(
		COMSIG_ATOM_EXITED = PROC_REF(on_exited),
	)
	AddElement(/datum/element/connect_loc, loc_connections)

/turf/open/indestructible/void/proc/on_exited(datum/source, atom/movable/gone)
	SIGNAL_HANDLER

	if(prob(10))
		activate_void(gone)

/turf/open/indestructible/void/proc/activate_void(atom/movable/triggerer)
	var/datum/effect_system/spark_spread/s = new /datum/effect_system/spark_spread
	s.set_up(3, 1, src)
	s.start()

/obj/effect/particle_effect/sparks/void_fissure
	name = "W̐̽͊͆͞h̅̋͠à̽̆̍̕t͌͐̍͠ a҇̃͋̚r̛̎̃ȇ̾̔̒̏͝ y̛͌̀o͐̂̌́͗͠ů̾̄̈̔̕ l̄̽͗̓̕ȏ̔̕ó̾̈́̌̚͝k̄͑̈̔̃͡i͊̿̑͝n̑̿͞g͋̒̈̂̕̚ f̛͗̀̊o͐̿̋͌́͠r̓͌̈̈́͠ here?͒̀̒͡"
	icon = 'zov_modular_arkstation/modules/goon-icons-port/goon-void.dmi'
	icon_state = "fissure"
	light_color = LIGHT_COLOR_LAVENDER

/area/misc/void
	requires_power = FALSE
	has_gravity = STANDARD_GRAVITY
	// static_lighting = FALSE
	// base_lighting_alpha = 255
	name = "V̷O̵I҈̸D҉̴"
	icon_state = "test_room"

/obj/effect/light_emitter/void
	light_color = LIGHT_COLOR_LAVENDER
	set_cap = 1

/obj/structure/goon_computers
	name = "computer"
	desc = "It is modular computer."
	icon = 'zov_modular_arkstation/modules/goon-icons-port/goon-computers.dmi'
	icon_state = "minicomputer_1"
	max_integrity = 1000
	bound_width = 64
	bound_height = 48
	density = TRUE
	anchored = TRUE
	layer = ABOVE_ALL_MOB_LAYER
	plane = ABOVE_GAME_PLANE

/obj/structure/goon_computers/blue
	icon_state = "minicomputer_2"

/obj/structure/goon_computers/green
	icon_state = "minicomputer_3"
