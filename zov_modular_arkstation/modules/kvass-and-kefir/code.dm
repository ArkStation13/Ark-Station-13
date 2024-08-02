// KVASS

/obj/structure/reagent_dispensers/beerkeg/kvasstank
	name = "KBAC"
	desc = "A cool refreshing drink with a taste of socialism."
	icon = 'zov_modular_arkstation/modules/kvass-and-kefir/objects.dmi'
	icon_state = "kvasstank"
	reagent_id = /datum/reagent/consumable/ethanol/kvass

/datum/supply_pack/imports/kvasstank
	name = "Kvass tank crate"
	contains = list(/obj/structure/reagent_dispensers/beerkeg/kvasstank)
	crate_name = "Kvass tank crate"
	cost = CARGO_CRATE_VALUE * 25

/datum/export/large/reagent_dispenser/kvass
	unit_name = "kvass tank"
	cost = 20
	contents_cost = 80
	export_types = list(/obj/structure/reagent_dispensers/beerkeg/kvasstank)

/datum/glass_style/drinking_glass/kvass
	required_drink_type = /datum/reagent/consumable/ethanol/kvass
	name = "Kvass"
	desc = "Russian bread-like drink."
	icon_state = "kvass"

/datum/reagent/consumable/ethanol/kvass
	name = "Kvass"
	description = "Drink made from bread. They can get drunk!"
	color = "#3b1f0eff"
	nutriment_factor = 1
	taste_description = "sweety bread"
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	glass_price = DRINK_PRICE_STOCK
	default_container = /obj/item/reagent_containers/cup/glass/drinkingglass/filled/kvass
	boozepwr = 10

/obj/item/reagent_containers/cup/glass/drinkingglass/filled/kvass
	name = "Kvass"
	list_reagents = list(/datum/reagent/consumable/ethanol/kvass = 50)

/datum/chemical_reaction/kvass
	results = list(/datum/reagent/consumable/ethanol/kvass = 3)
	required_reagents = list(/datum/reagent/consumable/ethanol/beer = 1, /datum/reagent/water = 1, /datum/reagent/consumable/sugar = 1)
	reaction_tags = REACTION_TAG_EASY | REACTION_TAG_DRINK

// KEFIR

/datum/reagent/consumable/kefir
	name = "Kefir"
	description = "Sour milk, but better!"
	color = "#dadada"
	nutriment_factor = 1
	taste_description = "sour milk"
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	glass_price = DRINK_PRICE_STOCK
	default_container = /obj/item/reagent_containers/cup/glass/drinkingglass/filled/kefir

/datum/glass_style/drinking_glass/kefir
	required_drink_type = /datum/reagent/consumable/kefir
	name = "Kefir"
	desc = "That's sour milk."
	icon_state = "kefirglass"

/obj/item/reagent_containers/cup/glass/drinkingglass/filled/kefir
	name = "Kefir"
	list_reagents = list(/datum/reagent/consumable/kefir = 50)

/datum/chemical_reaction/kefir
	results = list(/datum/reagent/consumable/kefir = 1)
	required_reagents = list(/datum/reagent/consumable/milk = 2)
	required_temp = 350
	reaction_tags = REACTION_TAG_EASY | REACTION_TAG_DRINK
