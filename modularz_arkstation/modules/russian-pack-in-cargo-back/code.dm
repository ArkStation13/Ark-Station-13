/datum/supply_pack/imports/russian
	name = "Russian Surplus Military Gear Crate"
	desc = "Hello <;~insert appropriate greeting here: 'Comrade'|'Imperalist Scum'|'Quartermaster of Reputable Station'~;>, \
		we have the most modern russian military equipment the black market can offer, for the right price of course. \
		No lock, best price."
	contraband = TRUE
	cost = CARGO_CRATE_VALUE * 12
	contains = list(
		/obj/item/food/rationpack,
		/obj/item/ammo_box/strilka310,
		/obj/item/ammo_box/strilka310/surplus,
		/obj/item/storage/toolbox/ammobox/strilka310,
		/obj/item/storage/toolbox/ammobox/strilka310/surplus,
		/obj/item/storage/toolbox/maint_kit,
		/obj/item/clothing/suit/armor/vest/russian,
		/obj/item/clothing/head/helmet/rus_helmet,
		/obj/item/clothing/shoes/russian,
		/obj/item/clothing/gloves/tackler/combat,
		/obj/item/clothing/under/syndicate/rus_army,
		/obj/item/clothing/under/costume/soviet,
		/obj/item/clothing/mask/russian_balaclava,
		/obj/item/clothing/head/helmet/rus_ushanka,
		/obj/item/clothing/suit/armor/vest/russian_coat,
		/obj/item/storage/toolbox/guncase/soviet = 2,
	)
	discountable = SUPPLY_PACK_RARE_DISCOUNTABLE

/datum/supply_pack/imports/russian/fill(obj/structure/closet/crate/our_crate)
	for(var/items in 1 to 10)
		var/item = pick(contains)
		new item(our_crate)
