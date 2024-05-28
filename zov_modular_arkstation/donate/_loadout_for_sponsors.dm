/*
*	LOADOUT ITEM DATUMS FOR WHITELISTED CKEYS
*/

/// Whitelisted items (Moves overrided items to backpack)
GLOBAL_LIST_INIT(loadout_whitelisted, generate_loadout_items(/datum/loadout_item/whitelisted))

/datum/loadout_item/whitelisted
	category = LOADOUT_ITEM_WHITELIST

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
