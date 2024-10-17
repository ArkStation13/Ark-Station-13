/datum/supply_pack/misc/vanguard_surplus // ARK STATION ADDITION
	name = "Expeditionary Corps Surplus"
	desc = "Contains an assortment of surplus equipment from the now-defunct Vanguard Expeditionary Corps."
	cost = CARGO_CRATE_VALUE * 19
	contains = list(
		/obj/item/storage/box/expeditionary_survival,
		/obj/item/melee/tomahawk,
		/obj/item/storage/backpack/expeditionary_corps,
		/obj/item/clothing/gloves/color/black/expeditionary_corps,
		/obj/item/clothing/head/helmet/expeditionary_corps,
		/obj/item/clothing/suit/armor/vest/expeditionary_corps,
		/obj/item/storage/belt/military/expeditionary_corps,
		/obj/item/clothing/under/rank/expeditionary_corps,
		/obj/item/clothing/shoes/combat/expeditionary_corps,
		/obj/item/modular_computer/pda/expeditionary_corps,
		/obj/item/knife/combat/survival,
	)
	/// How many of the contains to put in the crate
	var/num_contained = 3

/datum/supply_pack/misc/vanguard_surplus/fill(obj/structure/closet/crate/filled_crate) // ARK STATION ADDITION
	var/list/contain_copy = contains.Copy()
	for(var/i in 1 to num_contained)
		var/item = pick_n_take(contain_copy)
		new item(filled_crate)
