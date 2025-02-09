/obj/item/crowbar/freeman
	name = "blood soaked crowbar"
	desc = "A heavy handed crowbar, it drips with blood."
	icon = 'modular_nova/modules/awaymissions_nova/icons/freeman.dmi'
	icon_state = "crowbar"
	force = 35
	throwforce = 45
	toolspeed = 0.1
	wound_bonus = 10
	hitsound = 'modularz_arkstation/modules/black_mesa/sound/crowbar2.ogg'
	mob_throw_hit_sound = 'modularz_arkstation/modules/black_mesa/sound/crowbar2.ogg'
	force_opens = TRUE

/obj/item/crowbar/freeman/ultimate
	name = "\improper Freeman's crowbar"
	desc = "A weapon wielded by an ancient physicist, the blood of hundreds seeps through this rod of iron and malice."
	force = 45

/obj/item/crowbar/freeman/ultimate/Initialize(mapload)
	. = ..()
	add_filter("rad_glow", 2, list("type" = "outline", "color" = "#fbff1479", "size" = 2))

/obj/item/shield/riot/pointman/hecu
	name = "ballistic shield"
	desc = "A shield fit for those that want to sprint headfirst into the unknown! Cumbersome as hell. Repair with iron."
	icon_state = "ballistic"
	icon = 'modular_nova/modules/awaymissions_nova/icons/ballistic.dmi'
	worn_icon_state = "ballistic_worn"
	worn_icon = 'modular_nova/modules/awaymissions_nova/icons/ballistic.dmi'
	inhand_icon_state = "ballistic"
	lefthand_file = 'modular_nova/modules/awaymissions_nova/icons/ballistic_l.dmi'
	righthand_file = 'modular_nova/modules/awaymissions_nova/icons/ballistic_r.dmi'
	force = 14
	throwforce = 5
	throw_speed = 1
	throw_range = 1
	block_chance = 45
	slot_flags = ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY
	attack_verb_continuous = list("shoves", "bashes")
	attack_verb_simple = list("shove", "bash")
	transparent = TRUE
	max_integrity = 150
	shield_break_leftover = /obj/item/ballistic_broken

/obj/item/ballistic_broken
	name = "broken ballistic shield"
	desc = "An unsalvageable, unrecoverable mess of armor steel and kevlar. Should've maintained it, huh?"
	icon_state = "ballistic_broken"
	icon = 'modular_nova/modules/awaymissions_nova/icons/ballistic.dmi'
	w_class = WEIGHT_CLASS_BULKY

/obj/item/ballistic_broken/Initialize(mapload)
	. = ..()
	var/static/list/slapcraft_recipe_list = list(/datum/crafting_recipe/ballistic_repair)
	AddElement(
		/datum/element/slapcrafting,\
		slapcraft_recipes = slapcraft_recipe_list,\
	)

//broken shield fixing
/datum/crafting_recipe/ballistic_repair
	name = "ballistic shield (repaired)"
	result = /obj/item/shield/riot/pointman/hecu
	reqs = list(/obj/item/ballistic_broken = 1,
				/obj/item/stack/sheet/plasteel = 3,
				/obj/item/stack/sheet/rglass = 3)
	time = 5 SECONDS
	category = CAT_MISC
	tool_behaviors = list(TOOL_WELDER)
