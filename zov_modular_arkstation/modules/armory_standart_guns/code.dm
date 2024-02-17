/obj/effect/spawner/armory_spawn/shotguns
	guns = list(
		/obj/item/gun/ballistic/shotgun/riot,
		/obj/item/gun/ballistic/shotgun/riot,
		/obj/item/gun/ballistic/shotgun/riot,
	)

/obj/effect/spawner/armory_spawn/mod_lasers_big
	guns = list(
		/obj/item/gun/energy/laser,
		/obj/item/gun/energy/laser,
		/obj/item/gun/energy/laser,
	)

/obj/effect/spawner/armory_spawn/mod_lasers_small
	guns = list(
		/obj/item/gun/energy/e_gun,
		/obj/item/gun/energy/e_gun,
		/obj/item/gun/energy/e_gun,
	)

/obj/structure/closet/ammunitionlocker/useful/PopulateContents()
	new /obj/item/storage/box/rubbershot(src)
	new /obj/item/storage/box/rubbershot(src)
	new /obj/item/storage/box/rubbershot(src)
	new /obj/item/storage/box/rubbershot(src)

/obj/effect/spawner/armory_spawn/smg
	guns = list()
	vertical_guns = TRUE
	new	/obj/item/gun/ballistic/automatic/wt550/no_ammo,
	new	/obj/item/gun/ballistic/automatic/wt550/no_ammo,
	new	/obj/item/gun/ballistic/automatic/wt550/no_ammo,
	new /obj/item/ammo_box/magazine/wt550m9/rubber,
	new /obj/item/ammo_box/magazine/wt550m9/rubber,
	new /obj/item/ammo_box/magazine/wt550m9/rubber,
	new /obj/item/ammo_box/magazine/wt550m9/rubber,
	new /obj/item/ammo_box/magazine/wt550m9/rubber,
	new /obj/item/ammo_box/magazine/wt550m9/rubber,
	new /obj/item/ammo_box/magazine/wt550m9/rubber,
	new /obj/item/ammo_box/magazine/wt550m9/rubber,
	new /obj/item/ammo_box/magazine/wt550m9/rubber,

/obj/structure/closet/secure_closet/armory_kiboko
	name = "lethal ammunition locker"
	req_access = list(ACCESS_ARMORY)
	icon_state = "shotguncase"

/obj/structure/closet/secure_closet/armory_kiboko/PopulateContents()
	new /obj/item/ammo_box/magazine/wt550m9(src)
	new /obj/item/ammo_box/magazine/wt550m9(src)
	new /obj/item/ammo_box/magazine/wt550m9(src)
	new /obj/item/ammo_box/magazine/wt550m9(src)
	new /obj/item/ammo_box/magazine/wt550m9(src)
	new /obj/item/ammo_box/magazine/wt550m9(src)
	new /obj/item/storage/box/lethalshot(src)
	new /obj/item/storage/box/lethalshot(src)
	new /obj/item/storage/box/lethalshot(src)
	new /obj/item/storage/box/lethalshot(src)

/obj/item/gun/ballistic/automatic/wt550/no_ammo
	spawnwithmagazine = FALSE

/obj/item/ammo_box/magazine/wt550m9/rubber
	name = "wt550 magazine (Rubbershot 4.6x30mm)"
	icon_state = "46x30mmt-20"
	base_icon_state = "46x30mmt"
	ammo_type = /obj/item/ammo_casing/c46x30mm/rubber
	max_ammo = 20

/obj/item/ammo_box/magazine/wt550m9/rubber/update_icon_state()
	. = ..()
	icon_state = "[base_icon_state]-[round(ammo_count(), 4)]"

/obj/item/ammo_casing/c46x30mm/rubber
	name = "4.6x30mm bullet casing"
	desc = "A 4.6x30mm bullet casing."
	caliber = CALIBER_46X30MM
	projectile_type = /obj/projectile/bullet/c46x30mm/rubber

/obj/projectile/bullet/c46x30mm/rubber
	name = "4.6x30mm rubber bullet"
	damage = 3
	stamina = 15
