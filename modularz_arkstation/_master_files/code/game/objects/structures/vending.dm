/obj/machinery/vending/inteq_vendomat
	name = "\improper InteDrobe"
	desc = "Spend your hard earned credits!"
	// icon = 'modularz_arkstation/_master_files/icons/obj/structures.dmi' // ПЕРЕЕХАЛИ ЧУТЬ НИЖЕ.
	icon_state = "intedrobe"
	product_slogans = "Almost does not stain with blood!;Spend your hard-earned credits!;New deliveries from our customers!"
	vend_reply = "Happy contracting, mercenary!"
	products = list(
		/obj/item/clothing/under/syndicate/inteq = 3,
		/obj/item/clothing/under/syndicate/inteq_skirt = 3,
		/obj/item/clothing/under/syndicate/inteq_eng = 3,
		/obj/item/clothing/under/syndicate/inteq_eng_skirt = 3,
		/obj/item/clothing/under/syndicate/inteq_med = 3,
		/obj/item/clothing/under/syndicate/inteq_med_skirt = 3, //////////////////////////////
		/obj/item/clothing/under/syndicate/inteq_maid = 3,
		/obj/item/clothing/gloves/combat/maid/inteq = 3,
		/obj/item/clothing/head/maid/syndicate/inteq = 3, //////////////////
		/obj/item/clothing/head/helmet/swat/inteq = 2,
		/obj/item/clothing/suit/armor/inteq = 2,
		/obj/item/clothing/shoes/combat = 2,
		/obj/item/clothing/mask/balaclava/breath/inteq = 2,
		/obj/item/clothing/mask/gas/sechailer = 23,
		/obj/item/clothing/suit/hooded/wintercoat/syndicate/inteq = 2,
		/obj/item/clothing/suit/armor/inteq/labcoat = 3,
		/obj/item/clothing/head/soft/inteq = 3,
		/obj/item/clothing/head/soft/inteq_med = 3,
		/obj/item/food/chips/intecookies = 5,
	)
	contraband = list(
		/obj/item/knife/combat = 2,
		/obj/item/clothing/glasses/hud/security/sunglasses/inteq = 2,
		/obj/item/clothing/shoes/combat/coldres = 1,
	)
	premium = list(
		/obj/item/lighter = 5,
		/obj/item/clothing/gloves/combat = 2,
		/obj/item/clothing/head/HoS/inteq_vanguard = 1,
		/obj/item/clothing/suit/armor/inteq/vanguard = 1,
		/obj/item/storage/backpack/duffelbag/syndie/inteq = 4,
	)
	refill_canister = /obj/item/vending_refill/inteq_vendomat
	light_color = COLOR_DARK_ORANGE

/obj/item/vending_refill/inteq_vendomat
	machine_name = "InteDrobe"
