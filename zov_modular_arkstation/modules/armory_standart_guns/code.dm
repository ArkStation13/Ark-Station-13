// SPAWNERS //

/obj/effect/spawner/armory_spawn/shotguns
	guns = list(
		/obj/item/gun/ballistic/shotgun/riot,
		/obj/item/gun/ballistic/shotgun/riot,
		/obj/item/gun/ballistic/shotgun/riot,
		/obj/item/gun/ballistic/shotgun/riot,
	)

/obj/effect/spawner/armory_spawn/mod_lasers_big
	guns = list(
		/obj/item/gun/microfusion/mcr01,
		/obj/item/gun/microfusion/mcr01,
		/obj/item/gun/microfusion/mcr01,
		/obj/item/gun/microfusion/mcr01,
	)

/obj/effect/spawner/armory_spawn/mod_lasers_small
	guns = list(
		/obj/item/gun/energy/e_gun,
		/obj/item/gun/energy/e_gun,
		/obj/item/gun/energy/e_gun,
		/obj/item/gun/energy/e_gun,
	)

/obj/structure/closet/ammunitionlocker/useful
	name = "non-lethal ammunition locker"
	icon_state = "sec"
	icon_door = "sec_wardrobe"

/obj/structure/closet/ammunitionlocker/useful/PopulateContents()
	new /obj/item/storage/box/rubbershot(src)
	new /obj/item/storage/box/rubbershot(src)
	new /obj/item/storage/box/rubbershot(src)
	new /obj/item/storage/box/rubbershot(src)
	new /obj/item/storage/box/rubbershot(src)
	new /obj/item/ammo_box/magazine/wt550m9/rubber(src)
	new /obj/item/ammo_box/magazine/wt550m9/rubber(src)
	new /obj/item/ammo_box/magazine/wt550m9/rubber(src)
	new /obj/item/ammo_box/magazine/wt550m9/rubber(src)
	new /obj/item/ammo_box/magazine/wt550m9/rubber(src)
	new /obj/item/ammo_box/magazine/wt550m9/rubber(src)
	new /obj/item/ammo_box/magazine/wt550m9/rubber(src)
	new /obj/item/ammo_box/magazine/wt550m9/rubber(src)
	new /obj/item/ammo_box/magazine/wt550m9/rubber(src)

/obj/effect/spawner/armory_spawn/smg
	guns = list(
		/obj/item/gun/ballistic/automatic/wt550/ammoless,
		/obj/item/gun/ballistic/automatic/wt550/ammoless,
		/obj/item/gun/ballistic/automatic/wt550/ammoless,
		/obj/item/gun/ballistic/automatic/wt550/ammoless,
	)
	vertical_guns = TRUE

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
	new /obj/item/ammo_box/magazine/wt550m9(src)
	new /obj/item/ammo_box/magazine/wt550m9(src)
	new /obj/item/storage/box/lethalshot(src)
	new /obj/item/storage/box/lethalshot(src)
	new /obj/item/storage/box/lethalshot(src)
	new /obj/item/storage/box/lethalshot(src)
	new /obj/item/storage/box/lethalshot(src)
	new /obj/item/storage/box/ammo_box/microfusion(src)
	new /obj/item/storage/box/ammo_box/microfusion(src)
	new /obj/item/storage/box/ammo_box/microfusion(src)
	new /obj/item/storage/box/ammo_box/microfusion(src)

/obj/item/gun/ballistic/automatic/wt550/ammoless
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
	name = "8mm Usurpator rubber bullet casing"
	desc = "A 8mm rubber bullet casing."
	caliber = CALIBER_46X30MM
	projectile_type = /obj/projectile/bullet/c46x30mm/rubber

/obj/projectile/bullet/c46x30mm/rubber
	name = "8mm rubber bullet"
	damage = 1
	stamina = 15
	wound_bonus = 0
	bare_wound_bonus = 0
	embed_falloff_tile = 0

// IN CARGO //
/datum/supply_pack/security/armory/wt_gun
	name = "WT-550 Guns Crate"
	desc = "Contains three automatic WT-550 guns. Has no ammo in box!"
	cost = CARGO_CRATE_VALUE * 7
	contains = list(/obj/item/gun/ballistic/automatic/wt550/ammoless = 3)
	crate_name = "WT-550 gun crate"

/datum/supply_pack/security/armory/wt_ammo_lethal
	name = "WT-550 Lethal Ammo Crate"
	desc = "6 magazines with lethal bullets for WT-550."
	cost = CARGO_CRATE_VALUE * 4
	contains = list(/obj/item/ammo_box/magazine/wt550m9 = 6)
	crate_name = "WT-550 lethal ammo crate"

/datum/supply_pack/security/armory/wt_ammo_rubber
	name = "WT-550 Rubber Ammo Crate"
	desc = "6 magazines with rubber bullets for WT-550."
	cost = CARGO_CRATE_VALUE * 3
	contains = list(/obj/item/ammo_box/magazine/wt550m9/rubber = 6)
	crate_name = "WT-550 rubber ammo crate"

/datum/supply_pack/security/armory/riot_shotgun
	name = "Riot Shotguns Crate"
	desc = "Contains three riot shotguns."
	cost = CARGO_CRATE_VALUE * 7
	contains = list(/obj/item/gun/ballistic/shotgun/riot = 3)
	crate_name = "riot shotguns crate"

/datum/supply_pack/security/armory/shotgun_slug
	name = "Shotgun Slug Ammo Crate"
	desc = "3 boxes with slug bullets for shotguns."
	cost = CARGO_CRATE_VALUE * 3
	contains = list(/obj/item/storage/box/slugs = 3)
	crate_name = "shotgun slug ammo crate"

/datum/supply_pack/security/armory/shotgun_rubber
	name = "Shotgun Rubber Ammo Crate"
	desc = "3 boxes with rubber bullets for shotguns."
	cost = CARGO_CRATE_VALUE * 2
	contains = list(/obj/item/storage/box/rubbershot = 3)
	crate_name = "shotgun rubber ammo crate"
