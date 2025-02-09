/obj/item/food/shaurma
	name = "shaurma"
	desc = "Vegetables and meat in pita bread, seasoned with sauce."
	icon = 'modularz_arkstation/modules/new-food/shaurma.dmi'
	icon_state = "shaurma"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/consumable/nutriment/protein = 4,
		/datum/reagent/consumable/nutriment/vitamin = 2,
	)
	tastes = list("pita" = 2, "meat" = 3, "vegetables" = 2, "sauce" = 1, "intestinal infection" = 1)
	foodtypes = JUNKFOOD
	w_class = WEIGHT_CLASS_SMALL
	venue_value = FOOD_PRICE_NORMAL
	crafting_complexity = FOOD_COMPLEXITY_2

/datum/crafting_recipe/food/shaurma
	name ="Shaurma"
	reqs = list(
		/obj/item/food/tortilla = 1,
		/obj/item/food/grown/tomato = 1,
		/obj/item/food/grown/cucumber = 1,
		/obj/item/food/meat/slab/chicken = 1
	)
	result = /obj/item/food/shaurma
	category = CAT_SANDWICH
