/mob/living/basic/necromorph
	name = "necromorph slasher"
	desc = "Living flesh."
	icon = 'icons/mob/nonhuman-player/alien.dmi'
	icon_state = "slasher"
	icon_living = "slasher"
	icon_dead = "slasher_dead"
	icon_gib = "syndicate_gib"
	gender = NEUTER
	butcher_results = list(/obj/item/food/meat/slab/human = 2,
							/obj/item/stack/sheet/animalhide/human = 1)
	maxHealth = 125
	health = 125
	obj_damage = 60
	melee_damage_lower = 25
	melee_damage_upper = 25
	attack_verb_continuous = "slashes"
	attack_verb_simple = "slash"
	speak_emote = list("hums")
	bubble_icon = "holo"
	combat_mode = TRUE
	attack_sound = 'sound/weapons/bladeslice.ogg'
	attack_vis_effect = ATTACK_EFFECT_SLASH
	faction = list(ROLE_NECROMORPH)
	status_flags = CANPUSH
	unsuitable_heat_damage = 20
	// Going for a dark purple here
	unique_name = TRUE
	gold_core_spawnable = NO_SPAWN
	death_sound = null
	death_message = "falls dead, crumbling into a pile of rotten flesh..."
	ai_controller = /datum/ai_controller/basic_controller/simple_hostile

/obj/projectile/plasma/on_hit(atom/target, blocked = 0, pierce_hit)
	. = ..()
	if(isnecromorph(target))
		var/mob/living/basic/necromorph/M
		M = target
		if(M.stat != DEAD)
			if(prob(20))
				M.gib()
			damage = 40
