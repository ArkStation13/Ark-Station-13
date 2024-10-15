// IN CARGO //
/datum/supply_pack/goody/sharpener
	name = "Knife Sharpener"
	contains = list(/obj/item/sharpener)
	desc = "Contains one stone for sharpening a knife. DISPOSABLE!"
	cost = CARGO_CRATE_VALUE * 5

// IN VENDING //

/obj/machinery/vending/dinnerware
	premium_ark = list(
		/obj/item/sharpener = 2,
	)
