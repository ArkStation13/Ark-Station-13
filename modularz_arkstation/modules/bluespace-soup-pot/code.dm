// Pot
/obj/item/reagent_containers/cup/soup_pot/bluespace
	name = "bluespace soup pot"
	desc = "A tall bluespace soup pot designed to mix and cook all kinds of soup."
	icon = 'modularz_arkstation/modules/bluespace-soup-pot/kitchen.dmi'
	icon_state = "bspot"
	base_icon_state = "bspot"
	volume = 350
	possible_transfer_amounts = list(10, 20, 50, 100, 200, 300, 320)
	amount_per_transfer_from_this = 50
	reagent_flags = REFILLABLE | DRAINABLE
	custom_materials = list(/datum/material/iron =SMALL_MATERIAL_AMOUNT * 10, /datum/material/silver =SMALL_MATERIAL_AMOUNT*5, /datum/material/gold =SMALL_MATERIAL_AMOUNT*5, /datum/material/bluespace =SMALL_MATERIAL_AMOUNT*1)
	w_class = WEIGHT_CLASS_BULKY
	fill_icon_thresholds = null

// Research
/datum/design/souppot_bluespace
	name = "Bluespace Souppot"
	id = "bluespace_souppot"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SMALL_MATERIAL_AMOUNT * 10, /datum/material/silver =SMALL_MATERIAL_AMOUNT*5, /datum/material/gold =SMALL_MATERIAL_AMOUNT*5, /datum/material/bluespace =SMALL_MATERIAL_AMOUNT*1)
	build_path = /obj/item/reagent_containers/cup/soup_pot/bluespace
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_KITCHEN
	)
	departmental_flags = DEPARTMENT_BITFLAG_SERVICE
