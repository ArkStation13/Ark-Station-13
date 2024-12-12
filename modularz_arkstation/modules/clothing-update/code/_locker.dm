// HoS garment
/obj/item/storage/bag/garment/hos/PopulateContents()
	..()
	new /obj/item/clothing/suit/armor/hos/hos_formal/nova(src)
	new /obj/item/clothing/mask/gas/sechailer/swat/hos(src)

// Warden's locker
/obj/structure/closet/secure_closet/warden/populate_contents_immediate()
	..()
	new	/obj/item/gun/ballistic/shotgun/automatic/combat/compact(src)

// Blueshield's locker and garment
/obj/structure/closet/secure_closet/blueshield/New()
	..()
	new /obj/item/armorkit/suit/blueshield(src)
	new /obj/item/armorkit/helmet/blueshield(src)

/obj/item/storage/bag/garment/blueshield/PopulateContents()
	..()
	new /obj/item/clothing/mask/gas/sechailer/swat/blueshield(src)
