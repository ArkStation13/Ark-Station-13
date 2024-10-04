#define SCYTHE_WEAK 0

/obj/item/organ/internal/cyberimp/arm/shard/scythe/demi
	name = "\improper Demi's Shard"
	desc = "This shard seems to be directly linked to some sinister entity. It might be your god! It also gives you a really horrible rash when you hold onto it for too long."
	items_to_create = list(/obj/item/vorpalscythe/demi)
	extend_sound = 'sound/effects/magic/cosmic_energy.ogg'
	retract_sound = 'sound/effects/magic/cosmic_expansion.ogg'

/obj/item/organ/internal/cyberimp/arm/shard/scythe/demi/Retract()
	if(!active_item || (active_item in src))
		return FALSE
	active_item.resistance_flags = active_item::resistance_flags
	if(owner)
		owner.visible_message(
			span_notice("[owner] retracts [active_item] back into [owner.p_their()] [zone == BODY_ZONE_R_ARM ? "right" : "left"] arm."),
			span_notice("[active_item] snaps back into your [zone == BODY_ZONE_R_ARM ? "right" : "left"] arm."),
			span_hear("you hear a magical sound."),
		)

		owner.transferItemToLoc(active_item, src, TRUE)
	else
		active_item.forceMove(src)

	UnregisterSignal(active_item, COMSIG_ITEM_ATTACK_SELF)
	UnregisterSignal(active_item, COMSIG_ITEM_ATTACK_SELF_SECONDARY)
	active_item = null
	playsound(get_turf(owner), retract_sound, 50, TRUE)
	return TRUE

/obj/item/vorpalscythe/demi
	name = "\improper Demi's Scythe"
	desc = "I stole this scythe from Death."
	icon = 'modularz_arkstation/donate/icons/krashly/scythe/obj.dmi'
	icon_state = "vorpalscythe"
	inhand_icon_state = "vorpalscythe"
	worn_icon_state = null
	lefthand_file = 'icons/mob/inhands/64x64_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/64x64_righthand.dmi'
	hitsound = 'sound/items/weapons/zipline_hit.ogg'
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	w_class = WEIGHT_CLASS_GIGANTIC
	force = 5
	armour_penetration = 0
	reach = 1
	slot_flags = null
	sharpness = SHARP_EDGED
	attack_verb_continuous = list("chops", "slices", "cuts", "reaps")
	attack_verb_simple = list("chop", "slice", "cut", "reap")
	wound_bonus = 0
	bare_wound_bonus = 0

/obj/item/vorpalscythe/demi/examine(mob/user)
	. = ..()
	. += span_notice("[src] seems to have quite a bit of reach. You might be able to hit things from further away.")

/obj/item/vorpalscythe/demi/Initialize(mapload)
	. = ..()

/obj/item/vorpalscythe/demi/attack(mob/living/target, mob/living/user, params)
	return ..()

//Borrows some amputation shear code, but much more specific
/obj/item/vorpalscythe/demi/attack_secondary(mob/living/victim, mob/living/user, params)
	return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN

/obj/item/vorpalscythe/demi/scythe_empowerment(potential_empowerment = SCYTHE_WEAK)
	return

/obj/item/vorpalscythe/demi/scythe_empowerment_end()
	return

/obj/item/vorpalscythe/demi/on_cult_rune_removed(obj/effect/target, mob/living/user)
	return

#undef SCYTHE_WEAK
