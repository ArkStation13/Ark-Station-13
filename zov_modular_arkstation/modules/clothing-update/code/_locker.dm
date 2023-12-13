// HoS locker and garments
/obj/structure/closet/secure_closet/hos/PopulateContents()
	..()

	new /obj/item/computer_disk/command/hos(src)
	new /obj/item/radio/headset/heads/hos(src)
	new /obj/item/storage/bag/garment/hos(src)
	new /obj/item/storage/lockbox/medal/sec(src)
	new /obj/item/megaphone/sec(src)
	new /obj/item/holosign_creator/security(src)
	new /obj/item/storage/lockbox/loyalty(src)
	new /obj/item/storage/box/flashbangs(src)
	new /obj/item/shield/riot/tele(src)
	new /obj/item/storage/belt/security/full(src)
	new /obj/item/circuitboard/machine/techfab/department/security(src)
	new /obj/item/storage/photo_album/hos(src)

/obj/structure/closet/secure_closet/hos/populate_contents_immediate()
	. = ..()

	// Traitor steal objectives
	new /obj/item/gun/energy/e_gun/hos(src)
	new /obj/item/pinpointer/nuke(src)


/obj/item/storage/bag/garment/hos/PopulateContents()
	new /obj/item/clothing/under/rank/security/head_of_security/skirt(src)
	new /obj/item/clothing/under/rank/security/head_of_security/alt(src)
	new /obj/item/clothing/under/rank/security/head_of_security/alt/skirt(src)
	new /obj/item/clothing/under/rank/security/head_of_security/grey(src)
	new /obj/item/clothing/under/rank/security/head_of_security/parade(src)
	new /obj/item/clothing/under/rank/security/head_of_security/parade/female(src)
	new /obj/item/clothing/suit/armor/hos(src)
	new /obj/item/clothing/suit/armor/hos/hos_formal(src)
	new /obj/item/clothing/suit/armor/hos/trenchcoat/winter(src)
	new /obj/item/clothing/suit/armor/vest/leather(src)
	new /obj/item/clothing/glasses/hud/security/sunglasses/eyepatch(src)
	new /obj/item/clothing/glasses/hud/security/sunglasses/gars/giga(src)
	new /obj/item/clothing/head/hats/hos/cap(src)
	new /obj/item/clothing/mask/gas/sechailer/swat/hos(src)
	new /obj/item/clothing/neck/cloak/hos(src)

///////////////////////////////////////////////////////////////////////////////////
// Warden's locker
/obj/structure/closet/secure_closet/warden/PopulateContents()
	..()
	new /obj/item/dog_bone(src)
	new /obj/item/radio/headset/headset_sec(src)
	new /obj/item/holosign_creator/security(src)
	new /obj/item/storage/bag/garment/warden(src)
	new /obj/item/storage/box/zipties(src)
	new /obj/item/storage/box/flashbangs(src)
	new /obj/item/storage/belt/security/full(src)
	new /obj/item/flashlight/seclite(src)
	new /obj/item/door_remote/head_of_security(src)

/obj/structure/closet/secure_closet/warden/populate_contents_immediate()
	. = ..()

	new	/obj/item/gun/ballistic/shotgun/automatic/combat/compact(src)


//////////////////////////////////////////////////////////////////////////////
// Blueshield locker and garments


/obj/structure/closet/secure_closet/blueshield/New()
	..()
	new /obj/item/storage/briefcase/secure(src)
	new /obj/item/storage/belt/security/full(src)
	new /obj/item/grenade/flashbang(src)
	new /obj/item/assembly/flash/handheld(src)
	new /obj/item/restraints/handcuffs(src)
	new /obj/item/clothing/glasses/hud/security/sunglasses(src)
	new /obj/item/storage/medkit/tactical/blueshield(src)
	new /obj/item/storage/toolbox/guncase/skyrat/carwo_large_case/sindano(src)
	new /obj/item/storage/bag/garment/blueshield(src)
	new /obj/item/mod/control/pre_equipped/blueshield(src)
	new /obj/item/armorkit/blueshield(src)
	new /obj/item/armorkit/blueshield/helmet(src)


/obj/item/storage/bag/garment/blueshield/PopulateContents()
	new /obj/item/clothing/suit/hooded/wintercoat/skyrat/blueshield(src)
	new /obj/item/clothing/head/beret/blueshield(src)
	new /obj/item/clothing/head/beret/blueshield/navy(src)
	new /obj/item/clothing/under/rank/blueshield(src)
	new /obj/item/clothing/under/rank/blueshield/skirt(src)
	new /obj/item/clothing/under/rank/blueshield/turtleneck(src)
	new /obj/item/clothing/under/rank/blueshield/turtleneck/skirt(src)
	new /obj/item/clothing/suit/armor/vest/blueshield(src)
	new /obj/item/clothing/suit/armor/vest/blueshield/jacket(src)
	new /obj/item/clothing/neck/mantle/bsmantle(src)
	new /obj/item/clothing/mask/gas/sechailer/swat/blueshield(src)
