/obj/item/storage/backpack/duffelbag/mining_bunny
	name = "Bunny Kit"
	desc = "A mining outfit kit themed around bunnies, they do live in burrows after all..."
	icon_state = "duffel-explorer"
	inhand_icon_state = "duffel-explorer"

/obj/item/storage/backpack/duffelbag/mining_bunny/PopulateContents()
	new /obj/item/clothing/head/playbunnyears/miner(src)
	new /obj/item/clothing/neck/tie/bunnytie/miner(src)
	new /obj/item/clothing/suit/jacket/tailcoat/miner(src)
	new /obj/item/clothing/under/rank/cargo/miner/bunnysuit(src)
	new /obj/item/clothing/shoes/workboots/mining/heeled(src)

/datum/orderable_item/mining/bunny
	item_path = /obj/item/storage/backpack/duffelbag/mining_bunny
	desc = "A mining outfit kit themed around bunnies, they do live in burrows after all..."
	cost_per_order = 500
