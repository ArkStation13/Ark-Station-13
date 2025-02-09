/datum/loadout_item/glasses/donator
	donator_only = FALSE

/datum/loadout_item/gloves/donator
	donator_only = FALSE

/datum/loadout_item/under/donator
	donator_only = FALSE

/datum/loadout_item/under/jumpsuit/donator
	donator_only = FALSE

/datum/loadout_item/head/donator
	donator_only = FALSE

/datum/loadout_item/suit/donator
	donator_only = FALSE

/datum/loadout_item/mask/donator
	donator_only = FALSE

/datum/loadout_item/shoes/donator
	donator_only = FALSE

/datum/loadout_item/neck/donator
	donator_only = FALSE

/datum/loadout_item/pocket_items/donator
	donator_only = FALSE

/datum/loadout_item/pocket_items/donator
	donator_only = FALSE

/// 3 Items for All Categories
//Head
/datum/loadout_category/head/New()
	. = ..()
	category_info = "(3 allowed)"

/datum/loadout_category/head/handle_duplicate_entires(
	datum/preference_middleware/loadout/manager,
	datum/loadout_item/conflicting_item,
	datum/loadout_item/added_item,
	list/datum/loadout_item/all_loadout_items,
)
	var/list/datum/loadout_item/head/others = list()
	for(var/datum/loadout_item/head/other in all_loadout_items)
		others += other

	if(length(others) >= 3)
		manager.deselect_item(others[1])
	return TRUE

//Glasses
/datum/loadout_category/glasses/New()
	. = ..()
	category_info = "(3 allowed)"

/datum/loadout_category/glasses/handle_duplicate_entires(
	datum/preference_middleware/loadout/manager,
	datum/loadout_item/conflicting_item,
	datum/loadout_item/added_item,
	list/datum/loadout_item/all_loadout_items,
)
	var/list/datum/loadout_item/glasses/others = list()
	for(var/datum/loadout_item/glasses/other in all_loadout_items)
		others += other

	if(length(others) >= 3)
		manager.deselect_item(others[1])
	return TRUE

//Face
/datum/loadout_category/face/New()
	. = ..()
	category_info = "(3 allowed)"

/datum/loadout_category/face/handle_duplicate_entires(
	datum/preference_middleware/loadout/manager,
	datum/loadout_item/conflicting_item,
	datum/loadout_item/added_item,
	list/datum/loadout_item/all_loadout_items,
)
	var/list/datum/loadout_item/mask/others = list()
	for(var/datum/loadout_item/mask/other in all_loadout_items)
		others += other

	if(length(others) >= 3)
		manager.deselect_item(others[1])
	return TRUE

//Ears
/datum/loadout_category/ears/New()
	. = ..()
	category_info = "(3 allowed)"

/datum/loadout_category/ears/handle_duplicate_entires(
	datum/preference_middleware/loadout/manager,
	datum/loadout_item/conflicting_item,
	datum/loadout_item/added_item,
	list/datum/loadout_item/all_loadout_items,
)
	var/list/datum/loadout_item/ears/others = list()
	for(var/datum/loadout_item/ears/other in all_loadout_items)
		others += other

	if(length(others) >= 3)
		manager.deselect_item(others[1])
	return TRUE

//Neck
/datum/loadout_category/neck/New()
	. = ..()
	category_info = "(3 allowed)"

/datum/loadout_category/neck/handle_duplicate_entires(
	datum/preference_middleware/loadout/manager,
	datum/loadout_item/conflicting_item,
	datum/loadout_item/added_item,
	list/datum/loadout_item/all_loadout_items,
)
	var/list/datum/loadout_item/neck/others = list()
	for(var/datum/loadout_item/neck/other in all_loadout_items)
		others += other

	if(length(others) >= 3)
		manager.deselect_item(others[1])
	return TRUE

//Suit
/datum/loadout_category/suit/New()
	. = ..()
	category_info = "(3 allowed)"

/datum/loadout_category/suit/handle_duplicate_entires(
	datum/preference_middleware/loadout/manager,
	datum/loadout_item/conflicting_item,
	datum/loadout_item/added_item,
	list/datum/loadout_item/all_loadout_items,
)
	var/list/datum/loadout_item/suit/others = list()
	for(var/datum/loadout_item/suit/other in all_loadout_items)
		others += other

	if(length(others) >= 3)
		manager.deselect_item(others[1])
	return TRUE

//Undersuit
/datum/loadout_category/undersuit/New()
	. = ..()
	category_info = "(3 allowed)"

/datum/loadout_category/undersuit/handle_duplicate_entires(
	datum/preference_middleware/loadout/manager,
	datum/loadout_item/conflicting_item,
	datum/loadout_item/added_item,
	list/datum/loadout_item/all_loadout_items,
)
	var/list/datum/loadout_item/under/others = list()
	for(var/datum/loadout_item/under/other in all_loadout_items)
		others += other

	if(length(others) >= 3)
		manager.deselect_item(others[1])
	return TRUE

//Accessories
/datum/loadout_category/accessories/New()
	. = ..()
	category_info = "(3 allowed)"

/datum/loadout_category/accessories/handle_duplicate_entires(
	datum/preference_middleware/loadout/manager,
	datum/loadout_item/conflicting_item,
	datum/loadout_item/added_item,
	list/datum/loadout_item/all_loadout_items,
)
	var/list/datum/loadout_item/accessory/others = list()
	for(var/datum/loadout_item/accessory/other in all_loadout_items)
		others += other

	if(length(others) >= 3)
		manager.deselect_item(others[1])
	return TRUE

//Belt
/datum/loadout_category/belt/New()
	. = ..()
	category_info = "(3 allowed)"

/datum/loadout_category/belt/handle_duplicate_entires(
	datum/preference_middleware/loadout/manager,
	datum/loadout_item/conflicting_item,
	datum/loadout_item/added_item,
	list/datum/loadout_item/all_loadout_items,
)
	var/list/datum/loadout_item/belts/others = list()
	for(var/datum/loadout_item/belts/other in all_loadout_items)
		others += other

	if(length(others) >= 3)
		manager.deselect_item(others[1])
	return TRUE

//Hands
/datum/loadout_category/hands/New()
	. = ..()
	category_info = "(3 allowed)"

/datum/loadout_category/hands/handle_duplicate_entires(
	datum/preference_middleware/loadout/manager,
	datum/loadout_item/conflicting_item,
	datum/loadout_item/added_item,
	list/datum/loadout_item/all_loadout_items,
)
	var/list/datum/loadout_item/gloves/others = list()
	for(var/datum/loadout_item/gloves/other in all_loadout_items)
		others += other

	if(length(others) >= 3)
		manager.deselect_item(others[1])
	return TRUE

//Feet
/datum/loadout_category/feet/New()
	. = ..()
	category_info = "(3 allowed)"

/datum/loadout_category/feet/handle_duplicate_entires(
	datum/preference_middleware/loadout/manager,
	datum/loadout_item/conflicting_item,
	datum/loadout_item/added_item,
	list/datum/loadout_item/all_loadout_items,
)
	var/list/datum/loadout_item/shoes/others = list()
	for(var/datum/loadout_item/shoes/other in all_loadout_items)
		others += other

	if(length(others) >= 3)
		manager.deselect_item(others[1])
	return TRUE

//Inhands
/datum/loadout_category/inhands/New()
	. = ..()
	category_info = "(3 allowed)"

/datum/loadout_category/inhands/handle_duplicate_entires(
	datum/preference_middleware/loadout/manager,
	datum/loadout_item/conflicting_item,
	datum/loadout_item/added_item,
	list/datum/loadout_item/all_loadout_items,
)
	var/list/datum/loadout_item/inhand/others = list()
	for(var/datum/loadout_item/inhand/other in all_loadout_items)
		others += other

	if(length(others) >= 3)
		manager.deselect_item(others[1])
	return TRUE
