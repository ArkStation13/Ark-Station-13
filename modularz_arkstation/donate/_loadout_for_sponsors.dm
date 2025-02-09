/datum/loadout_category/whitelisted
	category_name = "Whitelisted"
	category_ui_icon = FA_ICON_DONATE
	type_to_generate = /datum/loadout_item/whitelisted
	tab_order = /datum/loadout_category/pocket::tab_order + 1

/datum/loadout_item/whitelisted
	abstract_type = /datum/loadout_item/whitelisted

/datum/loadout_item/whitelisted/pre_equip_item(datum/outfit/outfit, datum/outfit/outfit_important_for_life, mob/living/carbon/human/equipper, visuals_only = FALSE)
	if(initial(outfit_important_for_life.r_hand) && initial(outfit_important_for_life.l_hand))
		if(!visuals_only)
			LAZYADD(outfit.backpack_contents, item_path)
		return TRUE

/datum/loadout_item/whitelisted/insert_path_into_outfit(datum/outfit/outfit, mob/living/carbon/human/equipper, visuals_only = FALSE, override_items = LOADOUT_OVERRIDE_BACKPACK)
	if(outfit.l_hand && !outfit.r_hand)
		outfit.r_hand = item_path
	else
		if(outfit.l_hand)
			LAZYADD(outfit.backpack_contents, outfit.l_hand)
		outfit.l_hand = item_path

/datum/loadout_category/whitelisted/New()
	. = ..()
	category_info = "(3 allowed)"

/datum/loadout_category/whitelisted/handle_duplicate_entires(
	datum/preference_middleware/loadout/manager,
	datum/loadout_item/conflicting_item,
	datum/loadout_item/added_item,
	list/datum/loadout_item/all_loadout_items,
)
	var/list/datum/loadout_item/whitelisted/others = list()
	for(var/datum/loadout_item/whitelisted/other in all_loadout_items)
		others += other

	if(length(others) >= 3)
		manager.deselect_item(others[1])
	return TRUE

///////////////////// LIST /////////////////////

/datum/loadout_item/whitelisted/sneaksuit // lordoftheflie
	name = "Blood-Red Sneaksuit"
	item_path = /obj/item/clothing/under/syndicate/bloodred/no_armor
	ckeywhitelist = list("lordoftheflie")

/datum/loadout_item/whitelisted/ordinarylife_custom // ordinarylife
	name = "Emma T-shirt"
	item_path = /obj/item/clothing/suit/ordinarylife_emma
	ckeywhitelist = list("vulpshiro", "dolbajob", "ordinarylife")

/datum/loadout_item/whitelisted/vulp_couple // dolbajob
	name = "Vulp Couple Plushie"
	item_path = /obj/item/toy/plush/fox/vulp_couple
	ckeywhitelist = list("vulpshiro", "dolbajob", "ordinarylife")

/datum/loadout_item/whitelisted/booba_suit // Kasalerza
	name = "Tailor-Made Suit (Booba Suit)"
	item_path = /obj/item/clothing/under/suit/booba_suit
	ckeywhitelist = list("Kasalerza")

/datum/loadout_item/whitelisted/flaming_haori // romontesque
	name = "Flaming Haori"
	item_path = /obj/item/clothing/neck/flaming_haori
	ckeywhitelist = list("romontesque")

/datum/loadout_item/whitelisted/demi_skirt // Krashly - НУ МОЖНО ЖЕ МНЕ СВОЙ СЛОТ ИМЕТЬ? // No_Terra-Vi-Ja - Автор спрайта.
	name = "Demi's Skirt"
	item_path = /obj/item/clothing/under/arkstation/demi_skirt
	ckeywhitelist = list("Krashly", "No_Terra-Vi-Ja")

/datum/loadout_item/whitelisted/demi_scythe // Krashly - НУ МОЖНО ЖЕ МНЕ СВОЙ СЛОТ ИМЕТЬ? // No_Terra-Vi-Ja - Автор спрайта.
	name = "Demi's Scythe"
	item_path = /obj/item/organ/internal/cyberimp/arm/shard/scythe/demi
	ckeywhitelist = list("Krashly", "No_Terra-Vi-Ja")
