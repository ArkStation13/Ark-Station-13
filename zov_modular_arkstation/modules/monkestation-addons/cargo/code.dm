/datum/supply_pack/costumes_toys/recreation
	name = "Recreational Crate"
	desc = "For the times the Captain calls for mandatory fun."
	cost = CARGO_CRATE_VALUE * 3
	contains = list(/obj/item/toy/basketball = 2,
					/obj/item/melee/skateboard/pro = 2,
					/obj/item/clothing/shoes/sneakers/red = 2)
	crate_type = /obj/structure/closet/crate/large

/datum/supply_pack/costumes_toys/maid
	name = "Classy Sanitation Pack"
	desc = "We are surprised there is a market for these, considering your station's cleanliness record."
	cost = CARGO_CRATE_VALUE * 5
	contains = list(/obj/item/clothing/head/costume/maidheadband = 3,
					/obj/item/clothing/under/costume/maid = 3,
					/obj/item/clothing/accessory/maidapron = 3,
					/obj/item/reagent_containers/spray/cleaner = 2,
					/obj/item/reagent_containers/cup/rag = 2)
	crate_name = "Maid Uniforms"

/datum/supply_pack/engineering/radios
	name = "Telecommunications Starter Pack crate"
	desc = "Contains everything you need to get a basic stationwide radio network established!"
	cost = CARGO_CRATE_VALUE * 1.5
	contraband = TRUE
	contains = list(/obj/item/radio = 10)
	crate_name = "telecommunications starter pack crate"

/datum/supply_pack/engineering/cones
	name = "Engineering hat crate"
	desc = "A complete set of headwear to fit the heads of an entire engineering crew. Includes six cones."
	cost = CARGO_CRATE_VALUE * 1.5
	contains = list(/obj/item/clothing/head/cone = 6)
	crate_name = "engineering hat crate"

// /datum/supply_pack/engineering/vent_kit
// 	name = "Hotspot Vent Kit"
// 	desc = "A pack of 5 vents for hotspots."
// 	cost = CARGO_CRATE_VALUE * 10
// 	contains = list(/obj/item/vent_package = 5)
// 	crate_name = "engineering vent crate"

/datum/supply_pack/engineering/servicefab
	name = "Service Techfab Replacement"
	desc = "You're telling me botany broke it with a lemon?"
	cost = CARGO_CRATE_VALUE * 50
	access = ACCESS_HOP
	contains = list(/obj/item/circuitboard/machine/protolathe/department/service,
					/obj/item/stock_parts/matter_bin/adv = 2,
					/obj/item/stock_parts/servo/nano = 2,
					/obj/item/reagent_containers/cup/beaker = 2,
					/obj/item/stack/sheet/iron/five,
					/obj/item/stack/cable_coil/five)
	crate_name = "Replacement Service Techfab"
	crate_type = /obj/structure/closet/crate/secure/engineering

/datum/supply_pack/engineering/secfab
	name = "Security Techfab Replacement"
	desc = "This is coming out of the donut budget."
	cost = CARGO_CRATE_VALUE * 50
	access = ACCESS_HOS
	contains = list(/obj/item/circuitboard/machine/protolathe/department/security,
					/obj/item/stock_parts/matter_bin/adv = 2,
					/obj/item/stock_parts/servo/nano = 2,
					/obj/item/reagent_containers/cup/beaker = 2,
					/obj/item/stack/sheet/iron/five,
					/obj/item/stack/cable_coil/five
					)
	crate_name = "Replacement Security Techfab"
	crate_type = /obj/structure/closet/crate/secure/engineering

/datum/supply_pack/engineering/cargofab
	name = "Cargo Techfab Replacement"
	desc = "You better not lodge a mosin bullet in this one too."
	cost = CARGO_CRATE_VALUE * 50
	access = ACCESS_QM
	contains = list(/obj/item/circuitboard/machine/protolathe/department/cargo,
					/obj/item/stock_parts/matter_bin/adv = 2,
					/obj/item/stock_parts/servo/nano = 2,
					/obj/item/reagent_containers/cup/beaker = 2,
					/obj/item/stack/sheet/iron/five,
					/obj/item/stack/cable_coil/five)
	crate_name = "Replacement Cargo Techfab"
	crate_type = /obj/structure/closet/crate/secure/engineering

/datum/supply_pack/engineering/medfab
	name = "Medical Techfab Replacement"
	desc = "The chemist you say. Meth you say."
	cost = CARGO_CRATE_VALUE * 50
	access = ACCESS_CMO
	contains = list(/obj/item/circuitboard/machine/protolathe/department/medical,
					/obj/item/stock_parts/matter_bin/adv = 2,
					/obj/item/stock_parts/servo/nano = 2,
					/obj/item/reagent_containers/cup/beaker = 2,
					/obj/item/stack/sheet/iron/five,
					/obj/item/stack/cable_coil/five)
	crate_name = "Replacement Medical Techfab"
	crate_type = /obj/structure/closet/crate/secure/engineering

/datum/supply_pack/engineering/engilathe
	name = "Engineering Protolathe Replacement"
	desc = "You said the atmospherics department melted the last one?"
	cost = CARGO_CRATE_VALUE * 50
	access = ACCESS_CE
	contains = list(/obj/item/circuitboard/machine/protolathe/department/engineering,
					/obj/item/stock_parts/matter_bin/adv = 2,
					/obj/item/stock_parts/servo/nano = 2,
					/obj/item/reagent_containers/cup/beaker = 2,
					/obj/item/stack/sheet/iron/five,
					/obj/item/stack/cable_coil/five)
	crate_name = "Replacement Engineering Protolathe"
	crate_type = /obj/structure/closet/crate/secure/engineering

/datum/supply_pack/engineering/scilathe
	name = "Science Protolathe Replacement"
	desc = "Try not to feed this one into the E.X.P.E.R.I.M.E.N.T.O.R. yeah?"
	cost = CARGO_CRATE_VALUE * 50
	access = ACCESS_RD
	contains = list(/obj/item/circuitboard/machine/protolathe/department/science,
					/obj/item/stock_parts/matter_bin/adv = 2,
					/obj/item/stock_parts/servo/nano = 2,
					/obj/item/reagent_containers/cup/beaker = 2,
					/obj/item/stack/sheet/iron/five,
					/obj/item/stack/cable_coil/five
					)
	crate_name = "Replacement Science Protolathe"
	crate_type = /obj/structure/closet/crate/secure/engineering

/datum/supply_pack/science/xenobio
	name = "Xenobiology Lab Crate"
	desc = "In case a freak accident has rendered the xenobiology lab non-functional! Contains two grey slime extracts, some plasma, and the required circuit boards to get your lab up and running! Requires xenobiology access to open."
	cost = CARGO_CRATE_VALUE * 20
	access = ACCESS_XENOBIOLOGY
	contains = list(/obj/item/slime_extract/grey = 2,
					/obj/item/reagent_containers/syringe/plasma,
					/obj/item/circuitboard/computer/xenobiology,
					/obj/item/circuitboard/machine/monkey_recycler,
					/obj/item/circuitboard/machine/processor/slime)
	crate_name = "xenobiology starter crate"
	crate_type = /obj/structure/closet/crate/secure/science

/datum/supply_pack/science/strange_objects
	name = "Strange Object Crate"
	desc = "We aren't quite sure what these are, but you're dumb enough to buy them anyway!"
	cost = CARGO_CRATE_VALUE * 6
	contains = list(/obj/item/relic = 5)
	crate_name = "strange object crate"

/datum/supply_pack/service/glassware
	name = "Glassware Crate"
	desc = "Printing too much trouble? Buy our bulk glassware package today!"
	cost = CARGO_CRATE_VALUE * 2
	contains = list(/obj/item/storage/box/beakers,
					/obj/item/storage/box/drinkingglasses = 2,
					/obj/item/reagent_containers/cup/glass/shaker,
					/obj/item/reagent_containers/cup/glass/flask = 2)
	crate_name = "glassware crate"

/datum/supply_pack/service/janitor/janicart
	name = "Janicart Crate"
	desc = "You'd better not have wrecked the last one joyriding."
	cost = CARGO_CRATE_VALUE * 4
	contains = list(/obj/vehicle/ridden/janicart,
					/obj/item/key/janitor)
	crate_name = "janicart crate"
	crate_type = /obj/structure/closet/crate/large

/datum/supply_pack/service/birthday
	name = "Birthday Bash Pack"
	desc = "This is for that corgi, isn't it..."
	cost = CARGO_CRATE_VALUE * 15
	contains = list(/obj/item/toy/balloon = 5,
					/obj/item/reagent_containers/spray/chemsprayer/party = 3,
					/obj/item/clothing/head/costume/party = 5,
					/obj/item/food/cake/birthday,
					/obj/item/plate/small = 5)
	crate_name = "Birthday Crate"
