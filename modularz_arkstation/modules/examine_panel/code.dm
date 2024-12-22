/datum/examine_panel/ui_data(mob/user)
	var/list/data = ..()
	var/datum/preferences/preferences = holder.client?.prefs
	var/flavor_text_nsfw = ""
	var/headshot_nsfw = ""
	var/character_ad = ""
	var/emote_length = preferences?.read_preference(/datum/preference/choiced/emote_length)
	var/approach = preferences?.read_preference(/datum/preference/choiced/approach_pref)
	var/furries = preferences?.read_preference(/datum/preference/choiced/furry_pref)
	var/scalies = preferences?.read_preference(/datum/preference/choiced/scalie_pref)
	var/others = preferences?.read_preference(/datum/preference/choiced/other_pref)
	var/demihumans = preferences?.read_preference(/datum/preference/choiced/demihuman_pref)
	var/humans = preferences?.read_preference(/datum/preference/choiced/human_pref)
	var/show_nsfw_flavor_text = preferences?.read_preference(/datum/preference/choiced/show_nsfw_flavor_text)
	if(issilicon(holder) && !(show_nsfw_flavor_text == "Never"))
		flavor_text_nsfw = preferences?.read_preference(/datum/preference/text/flavor_text_nsfw/silicon)
		headshot_nsfw += preferences?.read_preference(/datum/preference/text/headshot/silicon/nsfw)
	if(ishuman(holder))
		var/mob/living/carbon/human/holder_human = holder
		if((show_nsfw_flavor_text == "Always On") || (show_nsfw_flavor_text == "Nude Only" && !(holder_human.w_uniform)))
			flavor_text_nsfw = preferences?.read_preference(/datum/preference/text/flavor_text_nsfw)
			headshot_nsfw += preferences?.read_preference(/datum/preference/text/headshot/nsfw)
	character_ad += "Preferred Emote Length: [emote_length]\n"
	character_ad += "How to Approach: [approach]\n"
	character_ad += "Humans: [humans] | Furries: [furries] | Scalies: [scalies]\n"
	character_ad += "Demihumans: [demihumans] | Other: [others]\n"
	character_ad += "\n"
	character_ad += preferences?.read_preference(/datum/preference/text/character_ad)

	data["character_ad"] = character_ad
	data["flavor_text_nsfw"] = flavor_text_nsfw
	data["headshot_nsfw"] = headshot_nsfw
	return data

//

/datum/preferences
	var/headshot_nsfw = ""
	var/headshot_silicon = ""
	var/headshot_silicon_nsfw = ""

/datum/preference/text/flavor_text_nsfw
	category = PREFERENCE_CATEGORY_NON_CONTEXTUAL
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "flavor_text_nsfw"
	maximum_value_length = MAX_FLAVOR_LEN

//We want to make sure this is empty by default.
/datum/preference/text/flavor_text_nsfw/create_default_value()
	return ""

/datum/preference/text/flavor_text_nsfw/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return FALSE

//This is just a silicon variant of the NSFW flavor text.
/datum/preference/text/flavor_text_nsfw/silicon
	savefile_key = "silicon_flavor_text_nsfw"

//Lets the client choose when their NSFW flavor text is visible on a per-character basis.
/datum/preference/choiced/show_nsfw_flavor_text
	category = PREFERENCE_CATEGORY_NON_CONTEXTUAL
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "show_flavor_text_nsfw"

/datum/preference/choiced/show_nsfw_flavor_text/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return FALSE

//These are our options for when NSFW flavor text is shown. Always On = Always Visible, Nude Only means only when they are not wearing a uniform, and Never means it is never visible.
//These can be changed by clients on the fly.
/datum/preference/choiced/show_nsfw_flavor_text/init_possible_values()
	return GLOB.show_nsfw_flavor_text

/datum/preference/choiced/show_nsfw_flavor_text/create_default_value()
	return "Nude Only"

//NSFW headshot, so we can see those they/them nuts in the NSFW section of the character creator.
//TODO: Move the headshot proc over here so they stop overwriting each other by being a subtype.
/datum/preference/text/headshot/nsfw
	savefile_key = "headshot_nsfw"

/datum/preference/text/headshot/nsfw/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return FALSE

/datum/preference/text/headshot/nsfw/apply_headshot(value)
	if(stored_link[usr.ckey] != value)
		log_game("[usr] has set their NSFW Headshot image to '[value]'.")
	stored_link[usr?.ckey] = value
	usr?.client?.prefs.headshot_nsfw = value

//This is literally just the same as the original headshot pref but for silicons :)
/datum/preference/text/headshot/silicon
	savefile_key = "headshot_silicon"

/datum/preference/text/headshot/silicon/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return FALSE

/datum/preference/text/headshot/silicon/apply_headshot(value)
	if(stored_link[usr.ckey] != value)
		to_chat(usr, span_notice("Please use a relatively SFW image of the head and shoulder area to maintain immersion level. Think of it as a headshot for your ID. Lastly, [span_bold("do not use a real life photo or use any image that is less than serious.")]"))
		log_game("[usr] has set their Silicon Headshot image to '[value]'.")
	stored_link[usr?.ckey] = value
	usr?.client?.prefs.headshot_silicon = value

//Same as the original NSFW headshot pref, but for silicons.
/datum/preference/text/headshot/silicon/nsfw
	savefile_key = "headshot_silicon_nsfw"

/datum/preference/text/headshot/silicon/nsfw/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return FALSE

/datum/preference/text/headshot/silicon/nsfw/apply_headshot(value)
	if(stored_link[usr.ckey] != value)
		log_game("[usr] has set their NSFW Silicon Headshot image to '[value]'.")
	stored_link[usr?.ckey] = value
	usr?.client?.prefs.headshot_silicon_nsfw = value

//OOC notes for Silicons. Overwrites regular OOC notes when you are playing a Silicon character.
//TODO: Make this your regular OOC notes if you don't have Silicon ones. Every time I've tried, for some reason regular OOC notes haven't shown.
/datum/preference/text/ooc_notes/silicon
	savefile_key = "ooc_notes_silicon"

/datum/preference/text/ooc_notes/silicon/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return FALSE

/// Custom species and lore for silicons, also known as "Custom Model." This allows silicons to define a custom species rather than receiving, by default "A cyborg unit." BORING.
/datum/preference/text/custom_species/silicon
	savefile_key = "custom_species_silicon"

/datum/preference/text/custom_species/silicon/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return FALSE

// Silicon CS Lore
/datum/preference/text/custom_species_lore/silicon
	savefile_key = "custom_species_lore_silicon"

/datum/preference/text/custom_species_lore/silicon/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return FALSE

// Attraction Prefs
/datum/preference/choiced/attraction
	savefile_key = "attraction"
	category = PREFERENCE_CATEGORY_NON_CONTEXTUAL
	savefile_identifier = PREFERENCE_CHARACTER

/datum/preference/choiced/attraction/init_possible_values()
	return GLOB.sexuality_erp_status

/datum/preference/choiced/attraction/create_default_value()
	return "Нету"

/datum/preference/choiced/attraction/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return FALSE

// Emote Lenght Prefs
/datum/preference/choiced/emote_length
	savefile_key = "emote_length"
	category = PREFERENCE_CATEGORY_GAME_PREFERENCES
	savefile_identifier = PREFERENCE_PLAYER

/datum/preference/choiced/emote_length/init_possible_values()
	return GLOB.emote_length

/datum/preference/choiced/emote_length/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return FALSE

/datum/preference/choiced/emote_length/create_default_value()
	return "Не выставлено"

// Approach Prefs
/datum/preference/choiced/approach_pref
	savefile_key = "approach_pref"
	category = PREFERENCE_CATEGORY_GAME_PREFERENCES
	savefile_identifier = PREFERENCE_PLAYER

/datum/preference/choiced/approach_pref/init_possible_values()
	return GLOB.approach_pref

/datum/preference/choiced/approach_pref/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return FALSE

/datum/preference/choiced/approach_pref/create_default_value()
	return "Не выставлено"

// Furry Prefs
/datum/preference/choiced/furry_pref
	savefile_key = "furry_pref"
	category = PREFERENCE_CATEGORY_GAME_PREFERENCES
	savefile_identifier = PREFERENCE_PLAYER

/datum/preference/choiced/furry_pref/init_possible_values()
	return GLOB.race_pref

/datum/preference/choiced/furry_pref/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return FALSE

/datum/preference/choiced/furry_pref/create_default_value()
	return "Не выставлено"

// Scalie Prefs (Lizard, Dragons, ETC)
/datum/preference/choiced/scalie_pref
	savefile_key = "scalie_pref"
	category = PREFERENCE_CATEGORY_GAME_PREFERENCES
	savefile_identifier = PREFERENCE_PLAYER

/datum/preference/choiced/scalie_pref/init_possible_values()
	return GLOB.race_pref

/datum/preference/choiced/scalie_pref/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return FALSE

/datum/preference/choiced/scalie_pref/create_default_value()
	return "Не выставлено"

// Other Prefs
/datum/preference/choiced/other_pref
	savefile_key = "other_pref"
	category = PREFERENCE_CATEGORY_GAME_PREFERENCES
	savefile_identifier = PREFERENCE_PLAYER

/datum/preference/choiced/other_pref/init_possible_values()
	return GLOB.race_pref

/datum/preference/choiced/other_pref/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return FALSE

/datum/preference/choiced/scalie_pref/create_default_value()
	return "Не выставлено"

// Demihuman Prefs
/datum/preference/choiced/demihuman_pref
	savefile_key = "demihuman_pref"
	category = PREFERENCE_CATEGORY_GAME_PREFERENCES
	savefile_identifier = PREFERENCE_PLAYER

/datum/preference/choiced/demihuman_pref/init_possible_values()
	return GLOB.race_pref

/datum/preference/choiced/demihuman_pref/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return FALSE

/datum/preference/choiced/demihuman_pref/create_default_value()
	return "Не выставлено"

// Human Prefs
/datum/preference/choiced/human_pref
	savefile_key = "human_pref"
	category = PREFERENCE_CATEGORY_GAME_PREFERENCES
	savefile_identifier = PREFERENCE_PLAYER

/datum/preference/choiced/human_pref/init_possible_values()
	return GLOB.race_pref

/datum/preference/choiced/human_pref/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return FALSE

/datum/preference/choiced/human_pref/create_default_value()
	return "Не выставлено"

/datum/preference/toggle/obscurity_examine
	category = PREFERENCE_CATEGORY_GAME_PREFERENCES
	default_value = TRUE
	savefile_key = "obscurity_examine_pref"
	savefile_identifier = PREFERENCE_PLAYER

////////////////////////////////////
/// РЕФОРС НОВОВСКИХ ПРЕФОВ НИЖЕ ///
////////////////////////////////////

/datum/preference/choiced/erp_status/init_possible_values()
	return GLOB.based_erp_status // ARK STATION EDIT

/datum/preference/choiced/erp_status/create_default_value()
	return "Нет" // ARK STATION EDIT

/datum/preference/choiced/erp_status_nc/init_possible_values()
	return GLOB.noncon_erp_status // ARK STATION EDIT

/datum/preference/choiced/erp_status_nc/create_default_value()
	return "Нет" // ARK STATION EDIT

/datum/preference/choiced/erp_status_v/init_possible_values()
	return GLOB.vore_erp_status // ARK STATION EDIT

/datum/preference/choiced/erp_status_v/create_default_value()
	return "Нет" // ARK STATION EDIT

/datum/preference/choiced/erp_status_mechanics/init_possible_values()
	return GLOB.mechanics_erp_status // ARK STATION EDIT

/datum/preference/choiced/erp_status_mechanics/create_default_value()
	return "Нет" // ARK STATION EDIT

/datum/preference/choiced/erp_sexuality/init_possible_values()
	return GLOB.sexuality_erp_status // ARK STATION EDIT

/datum/preference/choiced/erp_sexuality/create_default_value()
	return "Нету" // ARK STATION EDIT

/datum/preference/choiced/erp_status_hypno/init_possible_values()
	return GLOB.hypno_erp_status // ARK STATION EDIT

/datum/preference/choiced/erp_status_hypno/create_default_value()
	return "Нет" // ARK STATION EDIT

/datum/preference/choiced/display_gender/init_possible_values()
	return GLOB.gender

/datum/preference/choiced/display_gender/create_default_value()
	return "Не выставлено"
