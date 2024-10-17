/obj/machinery/meter
	icon = 'modularz_arkstation/modules/goon-icons-port/goon-atmos-meter.dmi'

/obj/structure/shipping_container/ntbox
	name = "container"
	desc = "Container with Nanotreisen identification marks."
	icon = 'modularz_arkstation/modules/goon-icons-port/goon-crates.dmi'
	icon_state = "ntcrate1"

/obj/structure/shipping_container/ntbox/two
	icon_state = "ntcrate2"

/obj/machinery/dna_scannernew
	icon = 'modularz_arkstation/modules/goon-icons-port/goon-cryogenics.dmi'
	icon_state = "scanner"
	base_icon_state = "scanner"

/obj/item/healthanalyzer
	name = "health analyzer"
	icon = 'modularz_arkstation/modules/goon-icons-port/goon-devices.dmi'
	icon_state = "health"
	inhand_icon_state = "healthanalyzer"
	worn_icon_state = "healthanalyzer"
	lefthand_file = 'icons/mob/inhands/equipment/medical_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/medical_righthand.dmi'

/obj/item/assembly/igniter
	icon = 'modularz_arkstation/modules/goon-icons-port/goon-devices.dmi'
	icon_state = "igniter"
	base_icon_state = "igniter"

/obj/item/assembly/igniter/activate()
	. = ..()
	flick("igniter_light", src)

/obj/item/assembly/signaler
	icon = 'modularz_arkstation/modules/goon-icons-port/goon-devices.dmi'
	icon_state = "signaller"

/obj/structure/big_structure
	name = "hologramm"
	desc = "Giant sctricture."
	icon = 'modularz_arkstation/modules/goon-icons-port/goon-golo.dmi'
	icon_state = "structure-relay"
	density = TRUE
	anchored = TRUE
	layer = ABOVE_ALL_MOB_LAYER
	plane = ABOVE_GAME_PLANE
	bound_height = 160
	bound_width = 160

/obj/item/bikehorn
	icon = 'modularz_arkstation/modules/goon-icons-port/goon-instruments.dmi'
	icon_state = "bike_horn"

/obj/item/mop
	icon = 'modularz_arkstation/modules/goon-icons-port/goon-janitor.dmi'
	icon_state = "mop"

/obj/item/station_charter
	icon = 'modularz_arkstation/modules/goon-icons-port/goon-scrolls.dmi'

/obj/item/frog_contract
	icon = 'modularz_arkstation/modules/goon-icons-port/goon-scrolls.dmi'

/obj/item/teleportation_scroll
	icon = 'modularz_arkstation/modules/goon-icons-port/goon-scrolls.dmi'

/obj/item/book/granter/martial/plasma_fist
	icon = 'modularz_arkstation/modules/goon-icons-port/goon-scrolls.dmi'

/obj/item/book/granter/martial/carp
	icon = 'modularz_arkstation/modules/goon-icons-port/goon-scrolls.dmi'

/obj/item/implant/krav_maga
	icon = 'modularz_arkstation/modules/goon-icons-port/goon-scrolls.dmi'

/obj/item/antag_spawner/contract
	icon = 'modularz_arkstation/modules/goon-icons-port/goon-scrolls.dmi'

/obj/item/book/manual/ancient_parchment
	icon = 'modularz_arkstation/modules/goon-icons-port/goon-scrolls.dmi'

/datum/grand_finale/magic
	icon = 'modularz_arkstation/modules/goon-icons-port/goon-scrolls.dmi'

/obj/item/upgradescroll
	icon = 'modularz_arkstation/modules/goon-icons-port/goon-scrolls.dmi'

/obj/item/paper/holy_writ
	icon = 'modularz_arkstation/modules/goon-icons-port/goon-scrolls.dmi'

/obj/item/sparring_contract
	icon = 'modularz_arkstation/modules/goon-icons-port/goon-scrolls.dmi'

/obj/item/clothing/neck/stethoscope
	icon = 'modularz_arkstation/modules/goon-icons-port/goon-stethoscope.dmi'
	icon_state = "stethoscope"

/obj/structure/generator_structure
	name = "generator"
	desc = "Massive generator. It is stoped."
	icon = 'modularz_arkstation/modules/goon-icons-port/goon-turbine.dmi'
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
	icon = 'modularz_arkstation/modules/goon-icons-port/goon-vagons_stoped.dmi'
	icon_state = "car-platform"
	max_integrity = 1000
	bound_width = 64
	density = TRUE
	anchored = TRUE
	layer = ABOVE_ALL_MOB_LAYER
	plane = ABOVE_GAME_PLANE

/obj/structure/goon_computers
	name = "computer"
	desc = "It is modular computer."
	icon = 'modularz_arkstation/modules/goon-icons-port/goon-computers.dmi'
	icon_state = "minicomputer_1"
	max_integrity = 1000
	density = TRUE
	anchored = TRUE
	layer = ABOVE_ALL_MOB_LAYER
	plane = ABOVE_GAME_PLANE

/obj/structure/goon_computers/blue
	icon_state = "minicomputer_2"

/obj/structure/goon_computers/green
	icon_state = "minicomputer_3"
