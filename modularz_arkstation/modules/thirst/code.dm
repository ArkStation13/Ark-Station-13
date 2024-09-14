#define THIRST_STATE_FAT 2
#define THIRST_STATE_FULL 1
#define THIRST_STATE_FINE 0
#define THIRST_STATE_HUNGRY -1
#define THIRST_STATE_STARVING -2
#define MOOD_CATEGORY_WATER "thirst"

/mob
	var/water_level = THIRST_LEVEL_START_MIN
	var/in_thirst_update  = FALSE

/atom/movable/screen/thirst
	name = "thirst"
	icon_state = "hungerbar"
	base_icon_state = "hungerbar"
	screen_loc = ui_thirst
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	/// What state of thirst are we in?
	VAR_PRIVATE/state = THIRST_STATE_FINE
	/// What food icon do we show by the bar
	var/food_icon = 'icons/obj/drinks/mixed_drinks.dmi'
	/// What food icon state do we show by the bar
	var/food_icon_state = "four_bit"
	/// The image shown by the bar.
	VAR_PRIVATE/image/food_image

/atom/movable/screen/thirst/Initialize(mapload, datum/hud/hud_owner)
	. = ..()
	var/mob/living/thirst = hud_owner?.mymob
	if(!istype(thirst))
		return

	if(!ishuman(thirst) || CONFIG_GET(flag/disable_human_mood))
		screen_loc = ui_mood // Slot in where mood normally is if mood is disabled

	food_image = image(icon = food_icon, icon_state = food_icon_state, pixel_x = -5)
	food_image.plane = plane
	food_image.appearance_flags |= KEEP_APART // To be unaffected by filters applied to src
	food_image.add_filter("simple_outline", 2, outline_filter(1, COLOR_BLACK, OUTLINE_SHARP))
	underlays += food_image // To be below filters applied to src

	SetInvisibility(INVISIBILITY_ABSTRACT, name) // Start invisible, update later
	update_appearance()

/atom/movable/screen/thirst/proc/update_thirst_state()
	var/mob/living/thirst = hud?.mymob
	if(!istype(thirst))
		return

	if(HAS_TRAIT(thirst, TRAIT_NOTHIRST) || !thirst.get_organ_slot(ORGAN_SLOT_STOMACH))
		state = THIRST_STATE_FINE
		return

	switch(thirst.water_level)
		if(THIRST_LEVEL_THRESHOLD to INFINITY)
			state = THIRST_STATE_FAT
		if(THIRST_LEVEL_QUENCHED to THIRST_LEVEL_VERY_QUENCHED)
			state = THIRST_STATE_FULL
		if(THIRST_LEVEL_THIRSTY to THIRST_LEVEL_BIT_THIRSTY)
			state = THIRST_STATE_HUNGRY
		if(0 to THIRST_LEVEL_PARCHED)
			state = THIRST_STATE_STARVING

/atom/movable/screen/thirst/update_appearance(updates)
	var/old_state = state
	update_thirst_state() // Do this before we call all the other update procs
	. = ..()
	if(state == old_state) // Let's not be wasteful
		return
	if(state == THIRST_STATE_FINE)
		SetInvisibility(INVISIBILITY_ABSTRACT, name)
		return

	else if(invisibility)
		RemoveInvisibility(name)

	if(state == THIRST_STATE_STARVING)
		if(!get_filter("thirst_outline"))
			add_filter("thirst_outline", 1, list("type" = "outline", "color" = "#FF0033", "alpha" = 0, "size" = 2))
			animate(get_filter("thirst_outline"), alpha = 200, time = 1.5 SECONDS, loop = -1)
			animate(alpha = 0, time = 1.5 SECONDS)

	else if(get_filter("thirst_outline"))
		remove_filter("thirst_outline")

	// Update color of the food
	underlays -= food_image
	food_image.color = state == THIRST_STATE_FAT ? COLOR_DARK : null
	underlays += food_image

/atom/movable/screen/thirst/update_icon_state()
	. = ..()
	icon_state = "[base_icon_state][state]"

#undef THIRST_STATE_FAT
#undef THIRST_STATE_FULL
#undef THIRST_STATE_FINE
#undef THIRST_STATE_HUNGRY
#undef THIRST_STATE_STARVING

/datum/reagent
	var/hydration = 0 //does this hydrate your thirst?

/datum/reagent/consumable/cum
	hydration = 2 * REAGENTS_METABOLISM //thats one way to stay hydrated...

/datum/reagent/consumable/femcum
	hydration = 1 * REAGENTS_METABOLISM //thats one way to stay hydrated...

/datum/reagent/consumable
	hydration = 1 * REAGENTS_METABOLISM //Just so "etc" drinks don't give nothing

/datum/reagent/consumable/orangejuice
	hydration = 4 * REAGENTS_METABOLISM

/datum/reagent/consumable/tomatojuice
	hydration = 4 * REAGENTS_METABOLISM

/datum/reagent/consumable/limejuice
	hydration = 3 * REAGENTS_METABOLISM

/datum/reagent/consumable/carrotjuice
	hydration = 4 * REAGENTS_METABOLISM

/datum/reagent/consumable/berryjuice
	hydration = 4 * REAGENTS_METABOLISM

/datum/reagent/consumable/applejuice
	hydration = 4 * REAGENTS_METABOLISM

/datum/reagent/consumable/poisonberryjuice
	hydration = 2 * REAGENTS_METABOLISM

/datum/reagent/consumable/watermelonjuice
	hydration = 4 * REAGENTS_METABOLISM

/datum/reagent/consumable/lemonjuice
	hydration = 4 * REAGENTS_METABOLISM

/datum/reagent/consumable/banana
	hydration = 4 * REAGENTS_METABOLISM

/datum/reagent/consumable/grapejuice
	hydration = 2 * REAGENTS_METABOLISM

/datum/reagent/consumable/milk
	hydration = 2 * REAGENTS_METABOLISM

/datum/reagent/consumable/soymilk
	hydration = 2 * REAGENTS_METABOLISM

/datum/reagent/consumable/cream
	hydration = 2 * REAGENTS_METABOLISM

/datum/reagent/consumable/coffee
	hydration = 2 * REAGENTS_METABOLISM

/datum/reagent/consumable/tea
	hydration = 2 * REAGENTS_METABOLISM

/datum/reagent/consumable/lemonade
	hydration = 4 * REAGENTS_METABOLISM

/datum/reagent/consumable/tea/arnold_palmer
	hydration = 4 * REAGENTS_METABOLISM

/datum/reagent/consumable/icecoffee
	hydration = 2 * REAGENTS_METABOLISM

/datum/reagent/consumable/icetea
	hydration = 2 * REAGENTS_METABOLISM

/datum/reagent/consumable/space_cola
	hydration = 2 * REAGENTS_METABOLISM

/datum/reagent/consumable/nuka_cola
	hydration = 2 * REAGENTS_METABOLISM

/datum/reagent/consumable/dr_gibb
	hydration = 2 * REAGENTS_METABOLISM

/datum/reagent/consumable/space_up
	hydration = 5 * REAGENTS_METABOLISM

/datum/reagent/consumable/lemon_lime
	hydration = 2 * REAGENTS_METABOLISM

/datum/reagent/consumable/pwr_game
	hydration = 2 * REAGENTS_METABOLISM

/datum/reagent/consumable/shamblers
	hydration = 2 * REAGENTS_METABOLISM

/datum/reagent/consumable/grey_bull
	hydration = 2 * REAGENTS_METABOLISM

/datum/reagent/consumable/sodawater
	hydration = 4 * REAGENTS_METABOLISM

/datum/reagent/consumable/tonic
	hydration = 4 * REAGENTS_METABOLISM

/datum/reagent/consumable/ice
	hydration = 5 * REAGENTS_METABOLISM //ice is water dummy, just as good.

/datum/reagent/consumable/soy_latte
	hydration = 2 * REAGENTS_METABOLISM

/datum/reagent/consumable/cafe_latte
	hydration = 2 * REAGENTS_METABOLISM

/datum/reagent/consumable/doctor_delight
	hydration = 2 * REAGENTS_METABOLISM

/datum/reagent/consumable/pumpkin_latte
	hydration = 2 * REAGENTS_METABOLISM

/datum/reagent/consumable/gibbfloats
	hydration = 3 * REAGENTS_METABOLISM

/datum/reagent/consumable/pumpkinjuice
	hydration = 2 * REAGENTS_METABOLISM

/datum/reagent/consumable/triple_citrus
	hydration = 2 * REAGENTS_METABOLISM

/datum/reagent/consumable/grape_soda
	hydration = 2 * REAGENTS_METABOLISM

/datum/reagent/consumable/milk/chocolate_milk
	hydration = 2 * REAGENTS_METABOLISM

/datum/reagent/consumable/grenadine
	hydration = 1 * REAGENTS_METABOLISM

/datum/reagent/consumable/parsnipjuice
	hydration = 1 * REAGENTS_METABOLISM

/datum/reagent/consumable/pineapplejuice
	hydration = 2 * REAGENTS_METABOLISM

/datum/reagent/consumable/peachjuice
	hydration = 2 * REAGENTS_METABOLISM

/datum/reagent/consumable/cream_soda
	hydration = 2 * REAGENTS_METABOLISM

/datum/reagent/consumable/pinkmilk
	hydration = 3 * REAGENTS_METABOLISM

/datum/reagent/consumable/pinktea
	hydration = 2 * REAGENTS_METABOLISM

/datum/reagent/consumable/monkey_energy
	hydration = 1 * REAGENTS_METABOLISM

/datum/reagent/consumable/bungojuice
	hydration = 1 * REAGENTS_METABOLISM

/datum/reagent/consumable/prunomix
	hydration = 3 * REAGENTS_METABOLISM

/datum/reagent/consumable/ethanol
	hydration = 1 * REAGENTS_METABOLISM

/datum/reagent/water
	hydration = 5 * REAGENTS_METABOLISM

/datum/reagent/water/metabolize_reagent(mob/living/carbon/M)
	. = ..()
	M.adjust_thirst(hydration)

/obj/item/organ/internal/stomach/proc/handle_thirst(mob/living/carbon/human/H, seconds_per_tick, times_fired)
	if(HAS_TRAIT(H, TRAIT_NOTHIRST))
		return
	H.adjust_thirst(-THIRST_FACTOR)

/datum/reagent/consumable/metabolize_reagent(mob/living/carbon/M)
	. = ..()
	M.adjust_thirst(hydration)

/// Don't blame me if they have negative thirst, admeme.
// /proc/get_thirst(mob/living/user)
// 	if(!istype(user))
// 		return
// 	. = user.water_level
// 	for(var/datum/reagent/water in LAZYCOPY(user?.reagents.reagent_list))
// 		. += water.hydration

// 	. = min(., THIRST_LEVEL_THRESHOLD)

//nutrition
/datum/mood_event/quenched
	description = "<span class='nicegreen'>I'm quenched!</span>\n"
	mood_change = 6

/datum/mood_event/thirsty
	description = "<span class='warning'>I'm getting a bit thirsty.</span>\n"
	mood_change = -8

/datum/mood_event/dehydrated
	description = "<span class='boldwarning'>I'm dehydrated!</span>\n"
	mood_change = -15

/datum/mood/proc/HandleThirst()
	if(HAS_TRAIT(mob_parent, TRAIT_NOTHIRST))
		return FALSE //no mood events for thirst
	if(mob_parent.water_level >= THIRST_LEVEL_THRESHOLD)
		mob_parent.set_thirst(clamp(mob_parent.water_level, 0, THIRST_LEVEL_THRESHOLD))
		mob_parent.water_level = 380
	switch(mob_parent.water_level)
		if(THIRST_LEVEL_QUENCHED to INFINITY)
			add_mood_event(MOOD_CATEGORY_WATER, /datum/mood_event/quenched)
		if(THIRST_LEVEL_THIRSTY to THIRST_LEVEL_QUENCHED)
			clear_mood_event(MOOD_CATEGORY_WATER)
		if(THIRST_LEVEL_PARCHED to THIRST_LEVEL_THIRSTY)
			add_mood_event(MOOD_CATEGORY_WATER, /datum/mood_event/thirsty)
		if(0 to THIRST_LEVEL_PARCHED)
			add_mood_event(MOOD_CATEGORY_WATER, /datum/mood_event/dehydrated)
	return TRUE

/mob/proc/adjust_thirst(change, max = THIRST_LEVEL_THRESHOLD)
	if(HAS_TRAIT(src, TRAIT_NOTHIRST))
		return
	water_level = clamp(water_level + change, 0, max)
	if (!in_thirst_update)  // check update
		in_thirst_update = TRUE
		hud_used?.thirst?.update_appearance()
		in_thirst_update = FALSE

/mob/living/adjust_thirst(change, max)
	. = ..()
	if (!in_thirst_update)  // check update
		in_thirst_update = TRUE
		mob_mood?.HandleThirst()
		in_thirst_update = FALSE

/mob/proc/set_thirst(change)
	if(HAS_TRAIT(src, TRAIT_NOTHIRST))
		return
	water_level = max(0, change)
	if (!in_thirst_update)  // check update
		in_thirst_update = TRUE
		hud_used?.thirst?.update_appearance()
		in_thirst_update = FALSE

/mob/living/set_thirst(change, max)
	. = ..()
	if (!in_thirst_update)  // check update
		in_thirst_update = TRUE
		mob_mood?.HandleThirst()
		in_thirst_update = FALSE

#undef MOOD_CATEGORY_WATER
