/obj/structure/flora/ash/fern
	name = "cave fern"
	desc = "A species of fern with highly fibrous leaves."
	icon = 'modularz_arkstation/modules/better_lavaland_generator/ash_flora.dmi'
	icon_state = "cavefern"
	harvested_name = "cave fern stems"
	harvested_desc = "A few cave fern stems, missing their leaves."
	product_types = list(/obj/item/food/grown/ash_flora/fern = 1)
	harvest_amount_high = 4
	harvest_message_low = "You clip a single, suitable leaf."
	harvest_message_med = "You clip a number of leaves, leaving a few unsuitable ones."
	harvest_message_high = "You clip quite a lot of suitable leaves."
	regrowth_time_low = 3000
	regrowth_time_high = 5400
	number_of_variants = 1

/obj/item/food/grown/ash_flora/fern
	name = "fern leaf"
	desc = "A leaf from a cave fern."
	icon = 'modularz_arkstation/modules/better_lavaland_generator/ash_flora.dmi'
	icon_state = "fern"
	seed = /obj/item/seeds/lavaland/fern
	wine_power = 10

/obj/item/seeds/lavaland/fern
	name = "pack of cave fern seeds"
	desc = "These seeds grow into cave ferns."
	icon = 'modularz_arkstation/modules/better_lavaland_generator/growing.dmi'
	plantname = "Cave Fern"
	icon_state = "seed_fern"
	species = "fern"
	growthstages = 2
	product = /obj/item/food/grown/ash_flora/fern
	genes = list(/datum/plant_gene/trait/fire_resistance, /datum/plant_gene/trait/plant_type/weed_hardy)

///
/obj/structure/flora/bush/flowers_yw/hell
	name = "lavablossom"
	desc = "Some red and orange flowers. They appear to be faintly glowing."
	icon = 'modularz_arkstation/modules/better_lavaland_generator/hellflora.dmi'
	light_color = "#aba507"
	light_power = 3
	light_range = 2
	resistance_flags = LAVA_PROOF
	gender = PLURAL

/obj/structure/flora/bush/sparsegrass/hell
	name = "sparse hellish grass"
	desc = "A sparse patch of grass tinted red."
	icon = 'modularz_arkstation/modules/better_lavaland_generator/hellflora.dmi'
	light_range = 2
	light_power = 3
	resistance_flags = LAVA_PROOF
	gender = PLURAL

/obj/structure/flora/bush/sparsegrass/hell/Initialize()
	. = ..()
	icon_state = "sparsegrass_[rand(1, 3)]"
	light_color = pick("#e87800", "#780606")

/obj/structure/flora/bush/fullgrass/hell
	name = "thick hellish grass"
	desc = "A thick patch of grass tinted red."
	icon = 'modularz_arkstation/modules/better_lavaland_generator/hellflora.dmi'
	light_range = 2
	light_power = 3
	resistance_flags = LAVA_PROOF
	gender = PLURAL

/obj/structure/flora/bush/fullgrass/hell/Initialize()
	. = ..()
	icon_state = "fullgrass_[rand(1, 3)]"
	light_color = pick("#e87800", "#780606")


/obj/structure/flora/bush/genericbush/hell
	name = "hellish bush"
	desc = "A small crimson bush."
	icon = 'modularz_arkstation/modules/better_lavaland_generator/hellflora.dmi'
	light_range = 2
	light_power = 2
	resistance_flags = LAVA_PROOF

/obj/structure/flora/bush/genericbush/hell/Initialize()
	. = ..()
	icon_state = "genericbush_[rand(1, 4)]"
	light_color = pick("#e87800", "#780606")

/obj/structure/flora/bush/fernybush/hell
	name = "hellish fern"
	desc = "Some kind of orange fern."
	icon = 'modularz_arkstation/modules/better_lavaland_generator/hellflora.dmi'
	light_range = 2
	light_power = 1
	resistance_flags = LAVA_PROOF

/obj/structure/flora/bush/fernybush/hell/Initialize()
	. = ..()
	icon_state = "fernybush_[rand(1, 3)]"
	light_color = pick("#e87800", "#780606")

/obj/structure/flora/firebush
	name = "flaming bush"
	desc = "A bush being consumed by flames. Maybe it'll rise from its ashes like a phoenix?"
	icon = 'modularz_arkstation/modules/better_lavaland_generator/hellflora.dmi'
	icon_state = "hell_bush"
	density = FALSE
	light_color = "#e08300"
	light_power = 2
	light_range = 3
	resistance_flags = LAVA_PROOF

//
/obj/structure/flora/ash/puce
	name = "Pucestal Growth"
	desc = "A collection of puce colored crystal growths."
	icon = 'modularz_arkstation/modules/better_lavaland_generator/ash_flora.dmi'
	icon_state = "pucetal"
	harvested_name = "Pucestal fragments"
	harvested_desc = "A few pucestal fragments, slowly regrowing."
	product_types = list(/obj/item/food/grown/ash_flora/puce = 1)
	harvest_amount_high = 6
	harvest_message_low = "You work a crystal free."
	harvest_message_med = "You cut a number of crystals free, leaving a few small ones."
	harvest_message_high = "You cut free quite a lot of crystals."
	regrowth_time_low = 10 MINUTES
	regrowth_time_high = 20 MINUTES
	number_of_variants = 1

/obj/item/food/grown/ash_flora/puce
	name = "Pucestal Crystal"
	desc = "A crystal from a pucestal growth."
	icon = 'modularz_arkstation/modules/better_lavaland_generator/ash_flora.dmi'
	icon_state = "puce"
	seed = /obj/item/seeds/lavaland/puce
	wine_power = 0		// It's a crystal

/obj/item/food/grown/ash_flora/puce/Initialize(mapload)
	. = ..()
	var/datum/component/edible/edible = GetComponent(/datum/component/edible)
	if(edible)
		edible.eat_time = 0

/obj/item/seeds/lavaland/puce
	name = "puce cluster"
	desc = "These crystals can be grown into larger crystals."
	plantname = "Pucestal Growth"
	icon = 'modularz_arkstation/modules/better_lavaland_generator/growing.dmi'
	icon_state = "cluster_puce"
	species = "puce"
	growthstages = 3
	product = /obj/item/food/grown/ash_flora/puce
	reagents_add = list(/datum/reagent/medicine/puce_essence = 0.10)

//
/datum/reagent/medicine/puce_essence		// P U C E
	name = "Pucetylline Essence"
	description = "Ground essence of puce crystals."
	reagent_state = SOLID
	color = "#CC8899"
	metabolization_rate = 2.5 * REAGENTS_METABOLISM
	overdose_threshold = 30

/datum/reagent/medicine/puce_essence/on_mob_life(mob/living/carbon/M)
	M.adjustToxLoss(-1*REM, 0)
	for(var/datum/reagent/toxin/R in M.reagents.reagent_list)
		M.reagents.remove_reagent(R.type, 0.25)
	M.add_atom_colour(color, TEMPORARY_COLOUR_PRIORITY)		// Changes color to puce
	..()

/datum/reagent/medicine/puce_essence/expose_atom(atom/A, volume)
	if(!iscarbon(A))
		A.add_atom_colour(color, WASHABLE_COLOUR_PRIORITY)
	..()

/datum/reagent/medicine/puce_essence/on_mob_end_metabolize(mob/living/M)
	. = ..()
	M.remove_atom_colour(TEMPORARY_COLOUR_PRIORITY, color)		// Removes temporary (not permanent) puce

/datum/reagent/medicine/puce_essence/overdose_process(mob/living/M)
	M.add_atom_colour(color, FIXED_COLOUR_PRIORITY)		// Eternal puce

//
/obj/structure/flora/tree/dead/tall/grey
	name = "petrified trunk"
	desc = "An ancient tree was carbonized in fire and ash. Only a skeleton remains."
	icon = 'modularz_arkstation/modules/better_lavaland_generator/tall_trees_dead.dmi'
	icon_state = "tree_1"
	base_icon_state = "tree"
	pixel_x = -16
	resistance_flags = LAVA_PROOF

/obj/structure/flora/tree/dead/hell
	name = "crimson tree"
	desc = "A crimson tree with lava oozing from it, providing a slight glow."
	icon = 'modularz_arkstation/modules/better_lavaland_generator/lavatrees.dmi'
	pixel_x = -16
	light_color = LIGHT_COLOR_BLOOD_MAGIC
	light_range = 2
	light_power = 0.85
	resistance_flags = LAVA_PROOF

//
/obj/structure/flora/tree/dead/barren
	name = "petrified tree"
	desc = "An ancient trunk, mummified by the passage of time. This one still has some purple to it."
	color = "#846996"
	icon = 'modularz_arkstation/modules/better_lavaland_generator/barren_tree.dmi'
	icon_state = "barren_large"

/obj/structure/flora/tree/dead/barren/Initialize()
	. = ..()
	color = pick( "#846996", "#7b4e99", "#924fab")
	icon_state = "barren_large"
