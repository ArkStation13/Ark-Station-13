// .223 (M-90gl Carbine)

/obj/projectile/bullet/a223
	name = ".223 bullet"
	damage = 35
	armour_penetration = 30
	wound_bonus = -40

/obj/projectile/bullet/a223/weak //centcom
	damage = 20

/obj/projectile/bullet/a223/phasic
	name = ".223 phasic bullet"
	icon_state = "gaussphase"
	damage = 30
	armour_penetration = 100
	projectile_phasing =  PASSTABLE | PASSGLASS | PASSGRILLE | PASSCLOSEDTURF | PASSMACHINE | PASSSTRUCTURE | PASSDOORS

// .310 Strilka (Sakhno Rifle)

/obj/projectile/bullet/strilka310
	name = ".310 Strilka bullet"
	damage = 60
	armour_penetration = 10
	wound_bonus = -45
	wound_falloff_tile = 0

/obj/projectile/bullet/strilka310/surplus
	name = ".310 Strilka surplus bullet"
	weak_against_armour = TRUE //this is specifically more important for fighting carbons than fighting noncarbons. Against a simple mob, this is still a full force bullet
	armour_penetration = 0

/obj/projectile/bullet/strilka310/enchanted
	name = "enchanted .310 bullet"
	damage = 20
	stamina = 80

// Harpoons (Harpoon Gun)

/obj/projectile/bullet/harpoon
	name = "harpoon"
	icon_state = "gauss"
	damage = 60
	armour_penetration = 50
	wound_bonus = -20
	bare_wound_bonus = 80
	embedding = list(embed_chance=100, fall_chance=3, jostle_chance=4, ignore_throwspeed_threshold=TRUE, pain_stam_pct=0.4, pain_mult=5, jostle_pain_mult=6, rip_time=10)
	wound_falloff_tile = -5
	shrapnel_type = null

// Rebar (Rebar Crossbow)
/obj/projectile/bullet/rebar
	name = "rebar"
	icon_state = "rebar"
	damage = 30
	speed = 0.4
	dismemberment = 1 //because a 1 in 100 chance to just blow someones arm off is enough to be cool but also not enough to be reliable
	armour_penetration = 10
	wound_bonus = -20
	bare_wound_bonus = 20
	embedding = list(embed_chance=60, fall_chance=2, jostle_chance=2, ignore_throwspeed_threshold=TRUE, pain_stam_pct=0.4, pain_mult=3, jostle_pain_mult=2, rip_time=10)
	embed_falloff_tile = -5
	wound_falloff_tile = -2
	shrapnel_type = /obj/item/stack/rods

/obj/projectile/bullet/rebarsyndie
	name = "rebar"
	icon_state = "rebar"
	damage = 35
	speed = 0.4
	dismemberment = 2 //It's a budget sniper rifle.
	armour_penetration = 20 //A bit better versus armor. Gets past anti laser armor or a vest, but doesnt wound proc on sec armor.
	wound_bonus = 10
	bare_wound_bonus = 10
	embedding = list(embed_chance=80, fall_chance=1, jostle_chance=3, ignore_throwspeed_threshold=TRUE, pain_stam_pct=0.4, pain_mult=3, jostle_pain_mult=2, rip_time=14)
	embed_falloff_tile = -3
	shrapnel_type = /obj/item/ammo_casing/rebar/healium

/obj/projectile/bullet/rebar/healium/on_hit(atom/target, blocked = 0, pierce_hit)
	. = ..()
	if(!iscarbon(target))
		return BULLET_ACT_HIT
	var/mob/living/breather = target
	breather.SetSleeping(3 SECONDS)
	breather.adjustFireLoss(-30, updating_health = TRUE, required_bodytype = BODYTYPE_ORGANIC)
	breather.adjustToxLoss(-30, updating_health = TRUE, required_biotype = BODYTYPE_ORGANIC)
	breather.adjustBruteLoss(-30, updating_health = TRUE, required_bodytype = BODYTYPE_ORGANIC)
	breather.adjustOxyLoss(-30, updating_health = TRUE, required_biotype = BODYTYPE_ORGANIC, required_respiration_type = ALL)

	return BULLET_ACT_HIT


/obj/projectile/bullet/rebar/supermatter
	name = "supermatter bolt"
	icon_state = "rebar_supermatter"
	damage = 0
	speed = 0.4
	dismemberment = 0
	damage_type = TOX
	armour_penetration = 100
	shrapnel_type = /obj/item/ammo_casing/rebar/supermatter

/obj/projectile/bullet/rebar/supermatter/on_hit(atom/target, blocked = 0, pierce_hit)
	. = ..()
	if(isliving(target))
		var/mob/living/victim = target
		victim.investigate_log("has been dusted by [src].", INVESTIGATE_DEATHS)
		dust_feedback(target)
		victim.dust()

	else if(!isturf(target)&& !isliving(target))
		dust_feedback(target)
		qdel(target)

	return BULLET_ACT_HIT


/obj/projectile/bullet/rebar/supermatter/proc/dust_feedback(atom/target)
	playsound(get_turf(src), 'sound/effects/supermatter.ogg', 10, TRUE)
	visible_message(span_danger("[target] is hit by [src], turning [target.p_them()] to dust in a brilliant flash of light!"))

/obj/projectile/bullet/paperball
	desc = "Doink!"
	damage = 1 // It's a damn toy.
	range = 10
	shrapnel_type = null
	embedding = null
	name = "paper ball"
	desc = "doink!"
	damage_type = BRUTE
	icon_state = "paperball"
>>>>>>> ed18304e71a... [MIRROR] Fixes crossbow healium bolt sleeping silicons! Oops! [MDB IGNORE] (#3074)
