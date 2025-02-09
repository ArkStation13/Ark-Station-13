//Small sprites
/datum/action/small_sprite
	name = "Toggle Giant Sprite"
	desc = "Others will always see you as giant"
	button_icon_state = "smallqueen"
	background_icon_state = "bg_alien"
	var/small = FALSE
	var/small_icon
	var/small_icon_state
/*
/datum/action/small_sprite/queen
	small_icon = 'icons/mob/alien.dmi'
	small_icon_state = "alienq"

/datum/action/small_sprite/drake
	small_icon = 'icons/mob/lavaland/lavaland_monsters.dmi'
	small_icon_state = "ash_whelp"

/datum/action/small_sprite/megafauna/colossus
	small_icon_state = "Basilisk"

/datum/action/small_sprite/megafauna/bubblegum
	small_icon_state = "goliath2"

/datum/action/small_sprite/megafauna/legion
	small_icon_state = "mega_legion"

/datum/action/small_sprite/Trigger()
	..()
	if(!small)
		var/image/I = image(icon = small_icon, icon_state = small_icon_state, loc = owner)
		I.override = TRUE
		I.pixel_x -= owner.pixel_x
		I.pixel_y -= owner.pixel_y
		owner.add_alt_appearance(/datum/atom_hud/alternate_appearance/basic, "smallsprite", I)
		small = TRUE
	else
		owner.remove_alt_appearance("smallsprite")
		small = FALSE

// MOBS
/mob/living/carbon/alien/humanoid/royal/queen
	var/datum/action/small_sprite/smallsprite = new /datum/action/small_sprite/queen()

/mob/living/carbon/alien/humanoid/royal/queen/Initialize(mapload)
	. = ..()
	smallsprite = new /datum/action/small_sprite/queen()

/mob/living/carbon/alien/humanoid/royal/queen/Destroy()
	QDEL_NULL(small_sprite)
	..()

/mob/living/simple_animal/hostile/megafauna/dragon
	var/datum/action/small_sprite/smallsprite

/mob/living/simple_animal/hostile/megafauna/dragon/Initialize(mapload)
	. = ..()
	smallsprite = new /datum/action/small_sprite/drake()

/mob/living/simple_animal/hostile/megafauna/dragon/Destroy()
	QDEL_NULL(small_sprite)
	..()

/mob/living/simple_animal/hostile/megafauna
	/// If there is a small sprite icon for players controlling the megafauna to use
	var/small_sprite_type

/mob/living/simple_animal/hostile/megafauna/Initialize(mapload)
	. = ..()
	if(small_sprite_type)
		var/datum/action/small_sprite/small_action = new small_sprite_type()
		small_action.Grant(src)

/mob/living/simple_animal/hostile/megafauna/Initialize(mapload)
	QDEL_NULL(small_sprite_type)
	..()
*/
/mob/living
	var/datum/action/sizecode_smallsprite/small_sprite

//Technically the same as /datum/action/small_sprite but for our macro players (I'm one of them)

/datum/action/sizecode_smallsprite
	name = "Toggle Giant Sprite"
	desc = "Others will always see you as giant"
	button_icon = 'icons/hud/screen_gen.dmi'
	button_icon_state = "healthdoll_OVERLAY"
	background_icon_state = "bg_alien"
	var/small = FALSE
	//var/image/small_icon

/datum/action/sizecode_smallsprite/Trigger(trigger_flags)
	if(!owner)
		return

	if(!small)
		var/image/I = image(icon = owner.icon, icon_state = owner.icon_state, loc = owner, layer = owner.layer, pixel_x = owner.pixel_x, pixel_y = owner.pixel_y)
		I.override = TRUE
		I.overlays += owner.overlays
		owner.add_alt_appearance(/datum/atom_hud/alternate_appearance/basic, "smallsprite_sizecode", I)
		//small_icon = I
	else
		owner.remove_alt_appearance("smallsprite_sizecode")

	small = !small
	return TRUE

/*
 * # get_size(mob/living/target)
 * Grabs the size of your critter, works for any living creature even carbons with dna
 * Now, please don't tell me your creature has a dna but it's very snowflakey, then i say you should rewrite your mob
 * instead of touching this file.
*/
/proc/get_size(mob/living/target)
	if(!target)
		CRASH("get_size(NULL) was called")
	if(!istype(target))
		CRASH("get_size() called with an invalid target, only use this for /mob/living!")
	var/datum/dna/has_dna = target.has_dna()
	if(ishuman(target) && has_dna)
		return has_dna.features["body_size"]
//	else
//		return target.gilde_size_multiplier

/*
 * # COMPARE_SIZES(mob/living/user, mob/living/target)
 * Returns how bigger or smaller the target is in comparison to user
 * Example:
 * - user = 2, target = 1, result = 0.5
 * - user = 1, target = 2, result = 2
 * Args:
 * - user = /mob/living
 * - target = /mob/living
*/
