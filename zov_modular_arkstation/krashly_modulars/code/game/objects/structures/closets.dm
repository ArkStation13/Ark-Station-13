/obj/structure/closet/syndicate/inteq
	name = "armory closet"
	desc = "Why is this here?"
	icon = 'zov_modular_arkstation/krashly_modulars/icons/obj/closets.dmi'
	icon_state = "inteq"

/obj/structure/closet/syndicate/inteq/vanguard
	icon_state = "inteq_boss"

/obj/structure/closet/syndicate/inteq/personal
	desc = "It's a personal storage unit for operative gear."

/obj/structure/closet/syndicate/inteq/personal/PopulateContents()
	..()
	new /obj/item/clothing/under/syndicate/inteq(src)
	new /obj/item/clothing/under/syndicate/inteq_skirt(src)
	new /obj/item/clothing/shoes/sneakers/black(src)
	new /obj/item/radio/headset/syndicate(src)
	new /obj/item/ammo_box/magazine/m10mm(src)
	new /obj/item/storage/belt/military/inteq(src)
	new /obj/item/crowbar/red(src)
	new /obj/item/clothing/glasses/night(src)
	new /obj/item/clothing/glasses/hud/security/sunglasses/inteq(src)
	new /obj/item/clothing/under/syndicate/inteq_maid(src)

/obj/machinery/suit_storage_unit/inteq_spacesuit
	suit_type = /obj/item/clothing/suit/space/syndicate/inteq
	mask_type = /obj/item/clothing/head/helmet/space/syndicate/inteq
	storage_type = /obj/item/tank/jetpack/oxygen/harness
