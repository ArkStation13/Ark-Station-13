/obj/item/knife/hunting
	force = 15
	throwforce = 15

// Melee
/obj/item/Initialize(mapload)
	if(wound_bonus <= 0)
		wound_bonus = 10
	else
		wound_bonus = wound_bonus * 2

	if(bare_wound_bonus <= 0)
		bare_wound_bonus = 10
	else
		bare_wound_bonus = bare_wound_bonus * 2
	..()

// Bullets
/obj/projectile/bullet
	light_system = COMPLEX_LIGHT
	light_range = 1.25
	light_power = 1
	light_color = COLOR_VERY_SOFT_YELLOW
	light_on = TRUE

/obj/projectile/bullet/Initialize(mapload)
	if(wound_bonus <= 0)
		wound_bonus = 5
	else
		wound_bonus = wound_bonus * 2

	if(bare_wound_bonus <= 0)
		bare_wound_bonus = 10
	else
		bare_wound_bonus = bare_wound_bonus * 2
	..()

/datum/embed_data/bullet
	embed_chance=30 // 20
	fall_chance=2
	jostle_chance=0
	ignore_throwspeed_threshold=TRUE
	pain_stam_pct=0.5
	pain_mult=4 // 3
	rip_time=10

// Beams
/obj/projectile/beam/Initialize(mapload)
	if(wound_bonus <= 0)
		wound_bonus = 5
	else
		wound_bonus = wound_bonus * 2

	if(bare_wound_bonus <= 0)
		bare_wound_bonus = 10
	else
		bare_wound_bonus = bare_wound_bonus * 2
	..()

//
