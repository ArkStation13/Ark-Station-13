/datum/supply_pack/vending/church_vend
	name = "Church Vending Refill Crate"
	desc = "Deo volente!"
	cost = CARGO_CRATE_VALUE * 9
	access = ACCESS_CHURCH_GENERAL
	contains = list(/obj/item/vending_refill/wardrobe/chap_wardrobe,
					/obj/item/vending_refill/wardrobe/chap_wardrobe_deacon,
					/obj/item/vending_refill/wardrobe/chap_wardrobe_fiscal,
					)
	crate_name = "\improper Church vending supply crate"
	crate_type = /obj/structure/closet/crate/secure



/// PRIEST
/obj/machinery/vending/wardrobe/chap_wardrobe
	name = "PriestOVend"
	desc = "God wills your purchase."
	icon_state = "chapdrobe"
	product_ads = "Are you being bothered by cultists or pesky revenants? Then come and dress like the holy man!;Clothes for men of the cloth!"
	vend_reply = "Thank you for using the PriestOVend!"
	products = list(
		/obj/item/clothing/accessory/pocketprotector/cosmetology = 1,
		/obj/item/clothing/under/rank/civilian/chaplain = 1,
		/obj/item/clothing/under/rank/civilian/chaplain/skirt = 2,
		/obj/item/clothing/shoes/sneakers/black = 1,
		/obj/item/clothing/shoes/sneakers/white = 1,
		/obj/item/clothing/suit/chaplainsuit/nun = 1,
		/obj/item/clothing/head/chaplain/nun_hood = 1,
		/obj/item/clothing/suit/chaplainsuit/holidaypriest = 1,
		/obj/item/clothing/suit/chaplainsuit/whiterobe = 1,
		/obj/item/clothing/suit/chaplainsuit/priest = 1,
		/obj/item/clothing/neck/cloak/priest = 1,
		/obj/item/clothing/head/chaplain/priest = 1,
		/obj/item/storage/backpack/medieval = 2,
		/obj/item/storage/backpack/satchel/medieval = 2,
		/obj/item/storage/backpack/cultpack = 1,
		/obj/item/storage/fancy/candle_box = 2,
		/obj/item/radio/headset/headset_church = 2,
		/obj/item/clothing/neck/cross = 10,
		/obj/item/clothing/neck/bandagewraps = 3,
	)
	contraband = list(
		/obj/item/toy/plush/ratplush = 1,
		/obj/item/toy/plush/narplush = 1,
	)
	premium = list(
		/obj/item/clothing/head/chaplain/bishopmitre = 1,
		/obj/item/clothing/suit/chaplainsuit/bishoprobe = 1,
	)
	refill_canister = /obj/item/vending_refill/wardrobe/chap_wardrobe
	payment_department = ACCOUNT_CHR

/obj/item/vending_refill/wardrobe/chap_wardrobe
	machine_name = "PriestOVend"



/// DEACON
/obj/machinery/vending/wardrobe/chap_wardrobe_deacon
	name = "DeaconOVend"
	desc = "God wills your purchase."
	icon_state = "deacondrobe"
	product_ads = "Are you being bothered by cultists or pesky revenants? Then come and dress like the holy man!;Clothes for men of the cloth!"
	vend_reply = "Thank you for using the DeaconOVend!"
	products = list(
		/obj/item/clothing/accessory/pocketprotector/cosmetology = 1,
		/obj/item/clothing/under/rank/civilian/chaplain = 4,
		/obj/item/clothing/under/rank/civilian/chaplain/skirt = 4,
		/obj/item/clothing/shoes/sneakers/black = 2,
		/obj/item/clothing/shoes/sneakers/white = 2,
		/obj/item/clothing/shoes/jackboots/black/medieval = 4,
		/obj/item/clothing/gloves/combat/medieval = 4,
		/obj/item/clothing/suit/chaplainsuit/deacon = 4,
		/obj/item/clothing/head/chaplain/deacon = 4,
		/obj/item/storage/backpack/medieval = 2,
		/obj/item/storage/backpack/satchel/medieval = 2,
		/obj/item/storage/fancy/candle_box = 2,
		/obj/item/radio/headset/headset_church = 2,
		/obj/item/clothing/neck/cross = 6,
		/obj/item/clothing/neck/bandagewraps = 2,
	)
	refill_canister = /obj/item/vending_refill/wardrobe/chap_wardrobe_deacon
	payment_department = ACCOUNT_CHR

/obj/item/vending_refill/wardrobe/chap_wardrobe_deacon
	machine_name = "DeaconOVend"



/// FISCAL
/obj/machinery/vending/wardrobe/chap_wardrobe_fiscal
	name = "FiscalOVend"
	desc = "God wills your purchase."
	icon_state = "fiscaldrobe"
	product_ads = "Are you being bothered by cultists or pesky revenants? Then come and dress like the holy man!;Clothes for men of the cloth!"
	vend_reply = "Thank you for using the DeaconOVend!"
	products = list(
		/obj/item/clothing/accessory/pocketprotector/cosmetology = 1,
		/obj/item/clothing/under/rank/civilian/chaplain = 2,
		/obj/item/clothing/under/rank/civilian/chaplain/skirt = 2,
		/obj/item/clothing/under/syndicate/combat = 2,
		/obj/item/clothing/shoes/jackboots/black/medieval = 4,
		/obj/item/clothing/gloves/combat/medieval = 4,
		/obj/item/storage/backpack/medieval = 2,
		/obj/item/storage/backpack/satchel/medieval = 2,
		/obj/item/storage/fancy/candle_box = 2,
		/obj/item/radio/headset/headset_church = 2,
		/obj/item/clothing/neck/cross = 6,
		/obj/item/clothing/neck/bandagewraps = 2,
	)
	premium = list(
		/obj/item/clothing/suit/armor/riot/knight/inquisitor = 1,
		/obj/item/clothing/suit/armor/riot/knight/inquisitor/plate = 1,
		/obj/item/clothing/suit/armor/riot/knight/inquisitor/half_plate = 1,
		/obj/item/clothing/suit/armor/riot/knight/inquisitor/chainmail = 1,
		/obj/item/clothing/head/helmet/toggleable/inquisitor = 1,
		/obj/item/clothing/head/helmet/toggleable/inquisitor/hounskull = 1,
		/obj/item/clothing/head/helmet/toggleable/inquisitor/sallet = 1,
		/obj/item/clothing/shoes/combat/medieval_steel = 2,
		/obj/item/clothing/gloves/combat/medieval/steel = 2,
		/obj/item/clothing/mask/medieval = 2,
		/obj/item/clothing/neck/medieval_chainmail = 2,
	)
	refill_canister = /obj/item/vending_refill/wardrobe/chap_wardrobe_fiscal
	payment_department = ACCOUNT_CHR

/obj/item/vending_refill/wardrobe/chap_wardrobe_fiscal
	machine_name = "FiscalOVend"
