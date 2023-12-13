//Melee

/obj/item/claymore/cerberus
	name = "claymore"
	desc = "Чего ты пялишься? Руби врагов!"
	icon = 'zov_modular_arkstation/krashly_modulars/icons/obj/weapons/weapons.dmi'
	icon_state = "siegesword"
	inhand_icon_state = "siegesword"
	lefthand_file = 'zov_modular_arkstation/krashly_modulars/icons/mob/inhands/weapons/lefthand.dmi'
	righthand_file = 'zov_modular_arkstation/krashly_modulars/icons/mob/inhands/weapons/righthand.dmi'
	force = 30

/obj/item/claymore/censor
	name = "silver sword"
	desc = "Серебрянный меч с гравировкой на лезвии и рукояти. Подсохшая кровь на лезвии будоражит ваш рассудок."
	icon = 'zov_modular_arkstation/krashly_modulars/icons/obj/weapons/weapons.dmi'
	icon_state = "silversword"
	inhand_icon_state = "silversword"
	lefthand_file = 'zov_modular_arkstation/krashly_modulars/icons/mob/inhands/weapons/lefthand.dmi'
	righthand_file = 'zov_modular_arkstation/krashly_modulars/icons/mob/inhands/weapons/righthand.dmi'
	force = 35

/obj/item/claymore/baron
	name = "silver sabre"
	desc = "Серебрянная сабля с гравировкой на лезвии и рукояти. Подсохшая кровь на лезвии будоражит ваш рассудок."
	icon = 'zov_modular_arkstation/krashly_modulars/icons/obj/weapons/weapons.dmi'
	icon_state = "sabre"
	inhand_icon_state = "sabre"
	lefthand_file = 'zov_modular_arkstation/krashly_modulars/icons/mob/inhands/weapons/lefthand.dmi'
	righthand_file = 'zov_modular_arkstation/krashly_modulars/icons/mob/inhands/weapons/righthand.dmi'
	force = 40

/obj/item/spear/cerberus
	icon_state = "tribal_spear0"
	icon = 'zov_modular_arkstation/krashly_modulars/icons/obj/weapons/weapons.dmi'
	lefthand_file = 'zov_modular_arkstation/krashly_modulars/icons/mob/inhands/weapons/lefthand.dmi'
	righthand_file = 'zov_modular_arkstation/krashly_modulars/icons/mob/inhands/weapons/righthand.dmi'
	name = "tribal spear"
	force = 25
	icon_prefix = "tribal_spear"

/obj/item/claymore/cerberus/bardiche
	name = "bardiche"
	desc = "A huge stick with a blade at the end. Say it's called an ax? In any case, it cuts people well."
	icon = 'zov_modular_arkstation/krashly_modulars/icons/obj/weapons/weapons.dmi'
	icon_state = "bardiche"
	inhand_icon_state = "bardiche"
	lefthand_file = 'zov_modular_arkstation/krashly_modulars/icons/mob/inhands/weapons/lefthand.dmi'
	righthand_file = 'zov_modular_arkstation/krashly_modulars/icons/mob/inhands/weapons/righthand.dmi'
	force = 35

/obj/item/shield/riot/cerberus
	name = "wooden shield"
	desc = "wooden shield with a small iron insert in the middle. Has a handle to make it easier to hold."
	icon = 'zov_modular_arkstation/krashly_modulars/icons/obj/weapons/weapons.dmi'
	icon_state = "wbuckler"
	inhand_icon_state = "wbuckler"
	lefthand_file = 'zov_modular_arkstation/krashly_modulars/icons/mob/inhands/weapons/lefthand.dmi'
	righthand_file = 'zov_modular_arkstation/krashly_modulars/icons/mob/inhands/weapons/righthand.dmi'

/obj/item/shield/riot/paladin
	name = "paladin shield"
	desc = "steel shield with a with the cross of the Gray Post Christian Church in the middle."
	icon = 'zov_modular_arkstation/krashly_modulars/icons/obj/weapons/weapons.dmi'
	icon_state = "paladin"
	inhand_icon_state = "paladin"
	lefthand_file = 'zov_modular_arkstation/krashly_modulars/icons/mob/inhands/weapons/lefthand.dmi'
	righthand_file = 'zov_modular_arkstation/krashly_modulars/icons/mob/inhands/weapons/righthand.dmi'

/obj/item/gun/energy/taser/bolestrel
	name = "sparq"
	desc = "A weapon that uses small darts that cause your opponent to wallow in agony."
	icon = 'zov_modular_arkstation/krashly_modulars/icons/obj/weapons/weapons.dmi'
	lefthand_file = 'zov_modular_arkstation/krashly_modulars/icons/mob/inhands/weapons/lefthand.dmi'
	righthand_file = 'zov_modular_arkstation/krashly_modulars/icons/mob/inhands/weapons/righthand.dmi'
	icon_state = "sparq"
	inhand_icon_state = "sparq0"
	ammo_type = list(/obj/item/ammo_casing/energy/electrode/bolestrel)

/obj/item/gun/energy/taser/bolestrel/censor
	name = "modernized sparq"
	icon_state = "taser_h"

/obj/item/ammo_casing/energy/electrode/bolestrel
	projectile_type = /obj/projectile/energy/electrode/bolestrel
	select_name = "pain"
	fire_sound = 'zov_modular_arkstation/krashly_modulars/sound/weapons/bowfire.wav'
	e_cost = 50
	harmful = FALSE

/obj/projectile/energy/electrode/bolestrel
	icon = 'zov_modular_arkstation/krashly_modulars/icons/obj/projectiles.dmi'
	icon_state = "cbbolt"
	hitsound = 'zov_modular_arkstation/krashly_modulars/sound/weapons/nebhit.ogg'

//Ballistic

/obj/item/gun/ballistic/automatic/ak12
	name = "\improper AK-12 rifle"
	desc = "Простая в использовании Автоматическая Винтовка. Её придумали ещё столетия назад, а популярна она и по сей день."
	icon = 'zov_modular_arkstation/krashly_modulars/icons/obj/weapons/weapons.dmi'
	icon_state = "ak12"
	lefthand_file = 'zov_modular_arkstation/krashly_modulars/icons/mob/inhands/weapons/lefthand.dmi'
	righthand_file = 'zov_modular_arkstation/krashly_modulars/icons/mob/inhands/weapons/righthand.dmi'
	slot_flags = ITEM_SLOT_BELT | ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY
	accepted_magazine_type = /obj/item/ammo_box/magazine/ak12
	can_suppress = FALSE
	weapon_weight = WEAPON_HEAVY
	burst_size = 3
	fire_delay = 1
	fire_sound = 'zov_modular_arkstation/krashly_modulars/sound/weapons/ak12_fire.ogg'

/obj/item/gun/ballistic/automatic/ak12/update_icon_state()
	. = ..()
	if(magazine)
		icon_state = "ak12"
	else
		icon_state = "ak12_e"

/obj/item/ammo_box/magazine/ak12
	name = "\improper AK-12 magazine"
	desc = "Магазин способный держать 30 патронов калибра 5.56мм."
	icon = 'zov_modular_arkstation/krashly_modulars/icons/obj/weapons/weapons.dmi'
	icon_state = "ak12_mag"
	ammo_type = /obj/item/ammo_casing/a556
	caliber = "a556"
	max_ammo = 30
	multiple_sprites = 2

/obj/item/ammo_box/magazine/ak12/ap
	name = "\improper AK-12 armor-piercing magazine"
	desc = "Магазин способный держать 30 бронепробивающих патронов калибра 5.56мм."
	ammo_type = /obj/item/ammo_casing/a556/ap

/obj/item/ammo_box/magazine/ak12/hp
	name = "\improper AK-12 hollow-point magazine"
	desc = "Магазин способный держать 30 разрывных патронов калибра 5.56мм."
	ammo_type = /obj/item/ammo_casing/a556/hp

/obj/item/gun/ballistic/automatic/ak12/pindicate
	pin = /obj/item/firing_pin/implant/pindicate

//a556

/obj/projectile/bullet/a556
	name = "5.56mm bullet"
	damage = 22
	wound_bonus = 9

/obj/item/ammo_casing/a556
	name = "5.56mm bullet casing"
	desc = "A 5.56mm bullet casing."
	caliber = "a556"
	projectile_type = /obj/projectile/bullet/a556

/obj/item/ammo_box/a556
	name = "ammo box (5.56mm)"
	icon_state = "45box"
	ammo_type = /obj/item/ammo_casing/a556
	max_ammo = 30

/obj/projectile/bullet/a556_ap
	name = "5.56mm armor-piercing bullet"
	damage = 18
	wound_bonus = 6
	armour_penetration = 40

/obj/item/ammo_casing/a556/ap
	name = "5.56mm armor-piercing bullet casing"
	desc = "A 5.56mm armor-piercing bullet casing."
	projectile_type = /obj/projectile/bullet/a556_ap

/obj/item/ammo_box/a556/ap
	name = "ammo box (5.56mm armor-piercing)"
	icon_state = "45box"
	ammo_type = /obj/item/ammo_casing/a556/ap
	max_ammo = 30

/obj/projectile/bullet/a556_hp
	name = "5.56mm hollow-point bullet"
	damage = 26
	wound_bonus = 10
	armour_penetration = -50

/obj/item/ammo_casing/a556/hp
	name = "5.56mm hollow-point bullet casing"
	desc = "A 5.56mm hollow-point bullet casing."
	projectile_type = /obj/projectile/bullet/a556_hp

/obj/item/ammo_box/a556/hp
	name = "ammo box (5.56mm hollow-point)"
	icon_state = "45box"
	ammo_type = /obj/item/ammo_casing/a556/hp
	max_ammo = 30
