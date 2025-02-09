/* REFACTOR OR DELETE
/obj/item/gun/magic/melee
	name = "melee gun"
	desc = "It's a gun. But Melee."
	icon = 'modularz_arkstation/_testing_branch/ss14_melee/icons/obj/weapons.dmi'
	icon_state = "sabre"
	inhand_icon_state = "sabre"
	worn_icon_state = null
	throwforce = 10
	throw_speed = 3
	throw_range = 5
	force = 10
	max_charges = INFINITE
	recharge_rate = 0
	attack_verb_continuous = list("slashes", "hits", "bashes")
	attack_verb_simple = list("slash", "hit", "bash")
	ammo_type = /obj/item/ammo_casing/shotgun/buckshot/melee

	fire_sound = 'modularz_arkstation/_testing_branch/ss14_melee/sounds/attack1.ogg'
	hitsound = 'modularz_arkstation/_testing_branch/ss14_melee/sounds/hit.ogg'
	vary_fire_sound = TRUE
	fire_sound_volume = 8
	dry_fire_sound = null
	dry_fire_sound_volume = 0
	suppressed = null
	suppressed_sound = null
	suppressed_volume = 0
	clumsy_check = FALSE
	trigger_guard = TRIGGER_GUARD_ALLOW_ALL
	burst_size = 0 //how large a burst is
	fire_delay = 0 //rate of fire for burst firing and semi auto
	firing_burst = 0 //Prevent the weapon from firing again while already firing
	semicd = 0 //cooldown handler
	weapon_weight = WEAPON_LIGHT
	dual_wield_spread = 0 //additional spread when dual wielding
	///Can we hold up our target with this? Default to yes
	can_hold_up = FALSE // NOVA EDIT - DISABLED ORIGINAL: TRUE

	/// Just 'slightly' snowflakey way to modify projectile damage for projectiles fired from this gun.
	projectile_damage_multiplier = 1

	/// Even snowflakier way to modify projectile wounding bonus/potential for projectiles fired from this gun.
	projectile_wound_bonus = 0

	spread = 0 //Spread induced by the gun itself.
	randomspread = 0 //Set to 0 for shotguns. This is used for weapons that don't fire all their bullets at once.

	lefthand_file = 'modularz_arkstation/_testing_branch/ss14_melee/icons/mob/lefthand.dmi'
	righthand_file = 'modularz_arkstation/_testing_branch/ss14_melee/icons/mob/righthand.dmi'

	/// True if a gun dosen't need a pin, mostly used for abstract guns like tentacles and meathooks
	pinless = TRUE

	/// Cooldown for the visible message sent from gun flipping.
	drop_sound = 'modularz_arkstation/_testing_branch/ss14_melee/sounds/drop.ogg'
	pickup_sound = 'modularz_arkstation/_testing_branch/ss14_melee/sounds/pick.ogg'

// /obj/item/gun/magic/melee/do_attack_animation(atom/attacked_atom, visual_effect_icon, mob/living/user, mob/living/attacked_boy)
// 	visual_effect_icon = ATTACK_EFFECT_SLASH
// 	if(attacked_atom == attacked_boy)
// 		visual_effect_icon = ATTACK_EFFECT_SLASH
// 		user.do_attack_animation(attacked_boy)
// 	user.do_attack_animation(attacked_atom)
// 	..()

/obj/item/gun/magic/melee/fire_gun(atom/target, mob/living/user, flag, params)
	user.do_attack_animation(target, used_item = src)
	..()

/obj/item/ammo_casing/shotgun/buckshot/melee
	name = "buckshot shell"
	desc = "A 12 gauge buckshot shell."
	icon_state = "gshell"
	projectile_type = /obj/projectile/bullet/pellet/shotgun_buckshot/melee
	pellets = 3
	variance = 33
	randomspread = 0

/obj/projectile/bullet/pellet/shotgun_buckshot/melee
	name = "slash"
	damage = 5
	wound_bonus = 1
	bare_wound_bonus = 0.4
	wound_falloff_tile = 0 // low damage + additional dropoff will already curb wounding potential anything past point blank
	damage_falloff_tile = 0
	icon_state = "chronobolt"
	embedding = list()
	muzzle_type = /obj/effect/projectile/muzzle/melee
	hitsound = 'modularz_arkstation/_testing_branch/ss14_melee/sounds/hit.ogg'
	speed = 0.3
	spread = 90
	Angle = 6
	range = 1

/obj/effect/projectile/muzzle/melee
	name = "muzzle"
	icon = 'icons/obj/weapons/guns/projectiles_muzzle.dmi'

*/
