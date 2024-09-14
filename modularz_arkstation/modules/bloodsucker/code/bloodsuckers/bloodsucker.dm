/datum/antagonist/bloodsucker
	name = "\improper Bloodsucker"
	show_in_antagpanel = TRUE
	roundend_category = "bloodsuckers"
	antagpanel_category = "Bloodsucker"
	job_rank = ROLE_BLOODSUCKER
	antag_hud_name = "bloodsucker"
	show_name_in_check_antagonists = TRUE
	can_coexist_with_others = FALSE
	hijack_speed = 0.5
	hud_icon = 'modularz_arkstation/modules/bloodsucker/icons/mob/huds/bloodsucker.dmi'
	ui_name = "AntagInfoBloodsucker"
	preview_outfit = /datum/outfit/bloodsucker_outfit

	/// How much blood we have, starting off at default blood levels. Do not adjust this directly, use adjustBloodVolume(), and use getBloodVolume() to get the current value.
	VAR_PRIVATE/bloodsucker_blood_volume = BLOOD_VOLUME_NORMAL
	/// How much blood we can have at once, increases per level.
	var/max_blood_volume = 600

	var/datum/bloodsucker_clan/my_clan

	// TIMERS //
	///Timer between alerts for Burn messages
	COOLDOWN_DECLARE(bloodsucker_spam_sol_burn)
	///Timer between alerts for Healing messages
	COOLDOWN_DECLARE(bloodsucker_spam_healing)
	/// Timer between exiting torpor
	COOLDOWN_DECLARE(bloodsucker_spam_torpor)

	///Used for assigning your name
	var/bloodsucker_name
	///Used for assigning your title
	var/bloodsucker_title
	///Used for assigning your reputation
	var/bloodsucker_reputation

	///Amount of Humanity lost, don't modify this directly, use AddHumanityLost(), and use GetHumanityLost() to get the current value.
	VAR_PRIVATE/humanity_lost = 0
	///Have we been broken the Masquerade?
	var/broke_masquerade = FALSE
	///How many Masquerade Infractions do we have?
	var/masquerade_infractions = 0
	///If we are currently in a Frenzy
	var/frenzied = FALSE
	/// sired by a ventrue
	var/ventrue_sired

	///ALL Powers currently owned
	var/list/datum/action/cooldown/bloodsucker/powers = list()

	///Vassals under my control. Periodically remove the dead ones.
	var/list/datum/antagonist/vassal/vassals = list()
	///Special vassals I own, to not have double of the same type.
	var/list/datum/antagonist/vassal/special_vassals = list()

	///How many ranks we have, don't modify this directly, use AdjustRank() and use GetRank() to get the current value.
	VAR_PRIVATE/bloodsucker_level = 0
	/// Unspent ranks, don't modify this directly, use AdjustUnspentRanks() and use GetUnspentRanks() to get the current value.
	VAR_PRIVATE/bloodsucker_level_unspent = 1
	var/additional_regen
	var/blood_over_cap = 0
	var/bloodsucker_regen_rate = 0.3

	// Used for Bloodsucker Objectives
	var/area/bloodsucker_lair_area
	var/obj/structure/closet/crate/coffin
	var/total_blood_drank = 0

	/// Used for Bloodsuckers gaining levels from drinking blood
	var/blood_level_gain = 0
	var/blood_level_gain_amount = 0

	///Blood display HUD
	var/atom/movable/screen/bloodsucker/blood_counter/blood_display
	///Vampire level display HUD
	var/atom/movable/screen/bloodsucker/rank_counter/vamprank_display

	/// Static typecache of all bloodsucker powers.
	var/static/list/all_bloodsucker_powers = typecacheof(/datum/action/cooldown/bloodsucker, ignore_root_path = TRUE)
	/// Antagonists that cannot be Vassalized no matter what
	var/static/list/vassal_banned_antags = list(
		/datum/antagonist/bloodsucker,
		// /datum/antagonist/monsterhunter,
		/datum/antagonist/changeling,
		/datum/antagonist/cult,
		// /datum/antagonist/ert/safety_moth,
	)
	///Default Bloodsucker traits
	var/static/list/bloodsucker_traits = list(
		TRAIT_NOBREATH,
		TRAIT_SLEEPIMMUNE,
		TRAIT_NOCRITDAMAGE,
		TRAIT_RESISTCOLD,
		TRAIT_RADIMMUNE,
		TRAIT_STABLEHEART,
		TRAIT_NOSOFTCRIT,
		TRAIT_NOHARDCRIT,
		TRAIT_AGEUSIA,
		TRAIT_COLDBLOODED,
		TRAIT_VIRUSIMMUNE,
		TRAIT_HARDLY_WOUNDED,
		TRAIT_NO_MIRROR_REFLECTION,
		TRAIT_DRINKS_BLOOD,
		TRAIT_TOXIMMUNE,
		// Fun fact, toxins can still be applied to you if you loose your liver even with TOXIMMUNE
		TRAIT_STABLELIVER
	)
	var/static/biotype = MOB_VAMPIRIC
	/// Weakref to the owner mob's heart, without bloodsucker_life stops and they die. Handled via signals due to the fact that
	/// Bloodsuckers don't take damage from lacking a heart due to TRAIT_NOBREATH
	/// Saved here so we can keep a track of it and remove signals properly
	var/datum/weakref/heart

/**
 * Apply innate effects is everything given to the mob
 * When a body is tranferred, this is called on the new mob
 * while on_gain is called ONCE per ANTAG, this is called ONCE per BODY.
 */
/datum/antagonist/bloodsucker/apply_innate_effects(mob/living/mob_override)
	. = ..()
	var/mob/living/carbon/current_mob = mob_override || owner.current
	RegisterSignal(current_mob, COMSIG_ATOM_EXAMINE, PROC_REF(on_examine))
	RegisterSignal(current_mob, COMSIG_LIVING_LIFE, PROC_REF(LifeTick))
	RegisterSignal(current_mob, COMSIG_LIVING_DEATH, PROC_REF(on_death))
	RegisterSignal(current_mob, COMSIG_SPECIES_GAIN, PROC_REF(on_species_gain))
	RegisterSignal(current_mob, COMSIG_QDELETING, PROC_REF(on_removal))
	RegisterSignal(current_mob, COMSIG_CARBON_GAIN_ORGAN, PROC_REF(on_organ_gain))
	talking_head()
	handle_clown_mutation(current_mob, mob_override ? null : "As a vampiric clown, you are no longer a danger to yourself. Your clownish nature has been subdued by your thirst for blood.")
	add_team_hud(current_mob)
	remove_invalid_quirks()

	if(current_mob.hud_used)
		on_hud_created()
	else
		RegisterSignal(current_mob, COMSIG_MOB_HUD_CREATED, PROC_REF(on_hud_created))
	if(ishuman(current_mob))
		current_mob?.dna?.species.on_bloodsucker_gain(current_mob)
		add_signals_to_heart(current_mob)
		// check if we already somehow don't have a heart, if this is possible, something is fucked up.
		on_organ_removal(null, current_mob)
#ifdef BLOODSUCKER_TESTING
	var/turf/user_loc = get_turf(current_mob)
	new /obj/structure/closet/crate/coffin(user_loc)
	new /obj/structure/bloodsucker/vassalrack(user_loc)
#endif

/**
 * Remove innate effects is everything given to the mob
 * When a body is transferred, this is called on the old mob.
 * while on_removal is called ONCE per ANTAG, this is called ONCE per BODY.
 */
/datum/antagonist/bloodsucker/remove_innate_effects(mob/living/mob_override)
	. = ..()
	var/mob/living/carbon/current_mob = mob_override || owner.current
	remove_signals_from_heart(current_mob)
	UnregisterSignal(current_mob, list(COMSIG_LIVING_LIFE, COMSIG_ATOM_EXAMINE, COMSIG_LIVING_DEATH, COMSIG_SPECIES_GAIN, COMSIG_QDELETING))
	handle_clown_mutation(current_mob, removing = FALSE)
	if(current_mob.hud_used)
		var/datum/hud/hud_used = current_mob.hud_used
		hud_used.infodisplay -= blood_display
		hud_used.infodisplay -= vamprank_display
		QDEL_NULL(blood_display)
		QDEL_NULL(vamprank_display)

	SSsunlight.remove_sun_sufferer(owner.current) //check if sunlight should end
	current_mob.dna?.species?.on_bloodsucker_loss(current_mob)
	if(current_mob.client)
		// We need to let the bloodsucker antag datum get removed before we can re-add quirks
		addtimer(CALLBACK(SSquirks, TYPE_PROC_REF(/datum/controller/subsystem/processing/quirks, AssignQuirks), current_mob, current_mob.client), 1 SECONDS)


/datum/antagonist/bloodsucker/proc/on_hud_created(datum/source)
	SIGNAL_HANDLER
	var/datum/hud/bloodsucker_hud = owner.current.hud_used

	blood_display = new(null, bloodsucker_hud)
	bloodsucker_hud.infodisplay += blood_display

	vamprank_display = new(null, bloodsucker_hud)
	bloodsucker_hud.infodisplay += vamprank_display

	bloodsucker_hud.show_hud(bloodsucker_hud.hud_version)
	SSsunlight.add_sun_sufferer(owner.current)
	UnregisterSignal(owner.current, COMSIG_MOB_HUD_CREATED)
	update_blood_hud()
	update_rank_hud()

/// Override some properties of incompatible species
/datum/antagonist/bloodsucker/proc/on_species_gain(mob/living/carbon/human/target, datum/species/current_species, datum/species/old_species)
	SIGNAL_HANDLER
	if(!ishuman(owner.current))
		return
	add_signals_to_heart(target)
	var/mob/living/carbon/human/user = owner.current
	user?.dna?.species.on_bloodsucker_gain(target)

/datum/antagonist/bloodsucker/get_admin_commands()
	. = ..()
	.["Set blood level"] = CALLBACK(src, PROC_REF(admin_set_blood))
	.["Give Level"] = CALLBACK(src, PROC_REF(RankUp), TRUE)
	if(bloodsucker_level_unspent >= 1)
		.["Remove Level"] = CALLBACK(src, PROC_REF(RankDown))

	if(broke_masquerade)
		.["Fix Masquerade"] = CALLBACK(src, PROC_REF(fix_masquerade))
	else
		.["Break Masquerade"] = CALLBACK(src, PROC_REF(break_masquerade))

	if(my_clan)
		.["Remove Clan"] = CALLBACK(src, PROC_REF(remove_clan))
	else
		.["Add Clan"] = CALLBACK(src, PROC_REF(admin_set_clan))

///Called when you get the antag datum, called only ONCE per antagonist.
/datum/antagonist/bloodsucker/on_gain()
	if(!owner?.current)
		return ..()
	RegisterSignal(SSsunlight, COMSIG_SOL_RANKUP_BLOODSUCKERS, PROC_REF(sol_rank_up))
	RegisterSignal(SSsunlight, COMSIG_SOL_NEAR_START, PROC_REF(sol_near_start))
	RegisterSignal(SSsunlight, COMSIG_SOL_END, PROC_REF(on_sol_end))
	RegisterSignal(SSsunlight, COMSIG_SOL_RISE_TICK, PROC_REF(handle_sol))
	RegisterSignal(SSsunlight, COMSIG_SOL_WARNING_GIVEN, PROC_REF(give_warning))
	if(ventrue_sired) // sired bloodsuckers shouldnt be getting the same benefits as Bloodsuckers.
		bloodsucker_level_unspent = 0
		show_in_roundend = FALSE
	else
		// Start Sunlight if first Bloodsucker
		// Name and Titles
		SelectFirstName()
		SelectTitle(am_fledgling = TRUE)
		SelectReputation(am_fledgling = TRUE)
		// Objectives
		forge_bloodsucker_objectives()

	. = ..()
	// Assign Powers
	give_starting_powers()
	assign_starting_stats()

/// Called by the remove_antag_datum() and remove_all_antag_datums() mind procs for the antag datum to handle its own removal and deletion.
/datum/antagonist/bloodsucker/on_removal()
	free_all_vassals()
	if(!owner?.current)
		return
	if(ishuman(owner.current))
		var/mob/living/carbon/human/user = owner.current
		user?.dna?.species.regenerate_organs(user, null, TRUE)
	clear_powers_and_stats()
	ventrue_sired = null
	return ..()

/datum/antagonist/bloodsucker/on_body_transfer(mob/living/old_body, mob/living/new_body)
	. = ..()
	if(!old_body || !new_body)
		CRASH("Bloodsucker on_body_transfer called with null bodies!")
	for(var/datum/action/cooldown/bloodsucker/all_powers as anything in powers)
		if(old_body)
			all_powers.Remove(old_body)
		all_powers.Grant(new_body)
	var/obj/item/bodypart/old_left_arm = old_body?.get_bodypart(BODY_ZONE_L_ARM)
	var/obj/item/bodypart/old_right_arm = old_body?.get_bodypart(BODY_ZONE_R_ARM)
	var/old_left_arm_unarmed_damage_low
	var/old_left_arm_unarmed_damage_high
	var/old_right_arm_unarmed_damage_low
	var/old_right_arm_unarmed_damage_high
	if(old_body && ishuman(old_body))
		var/mob/living/carbon/human/old_user = old_body
		old_user.mob_biotypes &= ~biotype
		//Keep track of what they were
		old_left_arm_unarmed_damage_low = old_left_arm?.unarmed_damage_low
		old_left_arm_unarmed_damage_high = old_left_arm?.unarmed_damage_high
		old_right_arm_unarmed_damage_low = old_right_arm?.unarmed_damage_low
		old_right_arm_unarmed_damage_high = old_right_arm?.unarmed_damage_high
		//Then reset them
		if(old_left_arm)
			old_left_arm.unarmed_damage_low = initial(old_left_arm.unarmed_damage_low)
			old_left_arm.unarmed_damage_high = initial(old_left_arm.unarmed_damage_high)
		if(old_right_arm)
			old_right_arm.unarmed_damage_low = initial(old_right_arm.unarmed_damage_low)
			old_right_arm.unarmed_damage_high = initial(old_right_arm.unarmed_damage_high)
	if(ishuman(new_body))
		var/mob/living/carbon/human/new_user = new_body
		new_user.mob_biotypes |= biotype
		var/obj/item/bodypart/new_left_arm
		var/obj/item/bodypart/new_right_arm
		//Give old punch damage values
		new_left_arm = new_body?.get_bodypart(BODY_ZONE_L_ARM)
		new_right_arm = new_body?.get_bodypart(BODY_ZONE_R_ARM)
		if(old_left_arm)
			new_left_arm.unarmed_damage_low = old_left_arm_unarmed_damage_low
			new_left_arm.unarmed_damage_high = old_left_arm_unarmed_damage_high
		if(old_right_arm)
			new_right_arm.unarmed_damage_low = old_right_arm_unarmed_damage_low
			new_right_arm.unarmed_damage_high = old_right_arm_unarmed_damage_high

	//Give Bloodsucker Traits
	if(old_body)
		old_body.remove_traits(bloodsucker_traits, BLOODSUCKER_TRAIT)
	new_body.add_traits(bloodsucker_traits, BLOODSUCKER_TRAIT)

/datum/antagonist/bloodsucker/greet()
	. = ..()
	var/fullname = return_full_name()
	to_chat(owner, span_userdanger("You are [fullname], a strain of vampire known as a Bloodsucker!"))
	owner.announce_objectives()
	if(bloodsucker_level_unspent >= 2)
		to_chat(owner, span_announce("As a latejoiner, you have [bloodsucker_level_unspent] bonus Ranks, entering your claimed coffin allows you to spend a Rank."))
	owner.current.playsound_local(null, 'modularz_arkstation/modules/bloodsucker/sound/BloodsuckerAlert.ogg', 100, FALSE, pressure_affected = FALSE)
	antag_memory += "Although you were born a mortal, in undeath you earned the name <b>[fullname]</b>.<br>"

/datum/antagonist/bloodsucker/farewell()
	to_chat(owner.current, span_userdanger("<FONT size = 3>With a snap, your curse has ended. You are no longer a Bloodsucker. You live once more!</FONT>"))
	// Refill with Blood so they don't instantly die.
	if(!HAS_TRAIT(owner.current, TRAIT_NOBLOOD))
		owner.current.blood_volume = max(owner.current.blood_volume, BLOOD_VOLUME_NORMAL)

// Called when using admin tools to give antag status
/datum/antagonist/bloodsucker/admin_add(datum/mind/new_owner, mob/admin)
	var/levels = input("How many unspent Ranks would you like [new_owner] to have?","Bloodsucker Rank", bloodsucker_level_unspent) as null | num
	var/msg = " made [key_name_admin(new_owner)] into \a [name]"
	if(levels > 1)
		bloodsucker_level_unspent = levels
		msg += " with [levels] extra unspent Ranks."
	message_admins("[key_name_admin(usr)][msg]")
	log_admin("[key_name(usr)][msg]")
	new_owner.add_antag_datum(src)

/datum/antagonist/bloodsucker/get_preview_icon()

	var/icon/final_icon = render_preview_outfit(/datum/outfit/bloodsucker_outfit)
	final_icon.Blend(icon('icons/effects/blood.dmi', "uniformblood"), ICON_OVERLAY)

	return finish_preview_icon(final_icon)

/datum/antagonist/bloodsucker/ui_static_data(mob/user)
	var/list/data = ability_ui_data(powers)
	//we don't need to update this that much.
	data["in_clan"] = !!my_clan
	var/list/clan_data = list()
	if(my_clan)
		clan_data["clan_name"] = my_clan.name
		clan_data["clan_description"] = my_clan.description
		clan_data["clan_icon"] = my_clan.join_icon_state

	data["clan"] += list(clan_data)

	return data + ..()

/datum/antagonist/bloodsucker/ui_assets(mob/user)
	return list(
		get_asset_datum(/datum/asset/simple/bloodsucker_icons),
	)

/datum/antagonist/bloodsucker/ui_act(action, params, datum/tgui/ui)
	. = ..()
	if(.)
		return

	switch(action)
		if("join_clan")
			if(my_clan)
				return
			assign_clan_and_bane()
			if(ui.closing)
				return
			ui.send_full_update(force = TRUE)

/datum/antagonist/bloodsucker/roundend_report()
	var/list/report = list()

	// Vamp name
	report += "<br><span class='header'><b>\[[return_full_name()]\]</b></span>"
	report += printplayer(owner)
	if(my_clan)
		report += "They were part of the <b>[my_clan.name]</b>!"

	// Default Report
	var/objectives_complete = TRUE
	if(objectives.len)
		report += printobjectives(objectives)
		for(var/datum/objective/objective in objectives)
			if(objective.objective_name == "Optional Objective")
				continue
			if(!objective.check_completion())
				objectives_complete = FALSE
				break

	// Now list their vassals
	if(vassals.len)
		report += "<span class='header'>Their Vassals were...</span>"
		for(var/datum/antagonist/vassal/all_vassals as anything in vassals)
			if(!all_vassals.owner)
				continue
			var/list/vassal_report = list()
			vassal_report += "<b>[all_vassals.owner.name]</b>"

			if(all_vassals.owner.assigned_role)
				vassal_report += " the [all_vassals.owner.assigned_role.title]"
			if(IS_FAVORITE_VASSAL(all_vassals.owner.current))
				vassal_report += " and was the <b>Favorite Vassal</b>"
			else if(IS_REVENGE_VASSAL(all_vassals.owner.current))
				vassal_report += " and was the <b>Revenge Vassal</b>"
			report += vassal_report.Join()

	if(objectives.len == 0 || objectives_complete)
		report += "<span class='greentext big'>The [name] was successful!</span>"
	else
		report += "<span class='redtext big'>The [name] has failed!</span>"

	return report.Join("<br>")

/datum/antagonist/bloodsucker/proc/give_starting_powers()
	for(var/datum/action/cooldown/bloodsucker/all_powers as anything in all_bloodsucker_powers)
		if(!(initial(all_powers.purchase_flags) & BLOODSUCKER_DEFAULT_POWER))
			continue
		BuyPower(all_powers)

/datum/antagonist/bloodsucker/proc/assign_starting_stats()
	//Traits: Species
	if(ishuman(owner.current))
		var/mob/living/carbon/human/user = owner.current
		var/obj/item/bodypart/user_left_arm = user.get_bodypart(BODY_ZONE_L_ARM)
		var/obj/item/bodypart/user_right_arm = user.get_bodypart(BODY_ZONE_R_ARM)
		user.dna?.remove_all_mutations()
		user_left_arm.unarmed_damage_low += 1 //lowest possible punch damage - 6 now
		user_left_arm.unarmed_damage_high += 1 //highest possible punch damage - 11
		user_right_arm.unarmed_damage_low += 1 //lowest possible punch damage - 6
		user_right_arm.unarmed_damage_high += 1 //highest possible punch damage - 11
		user.mob_biotypes |= biotype
	//Give Bloodsucker Traits
	owner.current.add_traits(bloodsucker_traits, BLOODSUCKER_TRAIT)
	//Clear Addictions
	for(var/addiction_type in subtypesof(/datum/addiction))
		owner.current.mind.remove_addiction_points(addiction_type, MAX_ADDICTION_POINTS)
	//No Skittish "People" allowed
	if(HAS_TRAIT(owner.current, TRAIT_SKITTISH))
		REMOVE_TRAIT(owner.current, TRAIT_SKITTISH, ROUNDSTART_TRAIT)
	// Tongue & Language
	owner.current.grant_language(/datum/language/vampiric, ALL, LANGUAGE_MIND)
	/// Clear Disabilities & Organs
	heal_vampire_organs()

/**
 * ##clear_power_and_stats()
 *
 * Removes all Bloodsucker related Powers/Stats changes, setting them back to pre-Bloodsucker
 * Order of steps and reason why:
 * Remove clan - Clans like Nosferatu give Powers on removal, we have to make sure this is given before removing Powers.
 * Powers - Remove all Powers, so things like Masquerade are off.
 * Species traits, Traits, Language - Misc stuff, has no priority.
 * Organs - At the bottom to ensure everything that changes them has reverted themselves already.
 * Update Sight - Done after Eyes are regenerated.
 */
/datum/antagonist/bloodsucker/proc/clear_powers_and_stats()
	// Remove clan first
	if(my_clan)
		QDEL_NULL(my_clan)
	// Powers
	for(var/datum/action/cooldown/bloodsucker/all_powers as anything in powers)
		RemovePower(all_powers)
	if(QDELETED(owner.current))
		return
	/// Stats
	if(ishuman(owner.current))
		var/mob/living/carbon/human/user = owner.current
		user.mob_biotypes &= ~biotype
		var/obj/item/bodypart/left_arm = user.get_bodypart(BODY_ZONE_L_ARM)
		var/obj/item/bodypart/right_arm = user.get_bodypart(BODY_ZONE_R_ARM)
		if(left_arm)
			left_arm.unarmed_damage_low = initial(left_arm.unarmed_damage_low)
			left_arm.unarmed_damage_high = initial(left_arm.unarmed_damage_high)
		if(right_arm)
			right_arm.unarmed_damage_low = initial(right_arm.unarmed_damage_low)
			right_arm.unarmed_damage_high = initial(right_arm.unarmed_damage_high)
	var/obj/item/bodypart/chest/target_chest = owner.current.get_bodypart(BODY_ZONE_CHEST)
	if(target_chest && target_chest.bodypart_flags & BODYPART_UNREMOVABLE)
		target_chest.bodypart_flags &= ~BODYPART_UNREMOVABLE
	// Remove all bloodsucker traits
	owner.current.remove_traits(bloodsucker_traits, BLOODSUCKER_TRAIT)
	// Language
	owner.current.remove_language(/datum/language/vampiric, ALL, LANGUAGE_MIND)
	// Heart & Eyes
	var/mob/living/carbon/user = owner.current
	var/obj/item/organ/internal/heart/newheart = owner.current.get_organ_slot(ORGAN_SLOT_HEART)
	if(newheart)
		newheart.Restart()
	var/obj/item/organ/internal/eyes/user_eyes = user.get_organ_slot(ORGAN_SLOT_EYES)
	if(user_eyes)
		user_eyes.flash_protect = initial(user_eyes.flash_protect)
		user_eyes.color_cutoffs = initial(user_eyes.color_cutoffs)
		user_eyes.sight_flags = initial(user_eyes.sight_flags)
	user.update_sight()

/datum/antagonist/bloodsucker/proc/remove_invalid_quirks()
	var/datum/quirk/bad_quirk = owner.current.get_quirk(/datum/quirk/sol_weakness)
	// silently remove the quirk if it's not valid
	bad_quirk.remove_from_current_holder(TRUE)
	owner.current.remove_quirk(/datum/quirk/sol_weakness)

/// Name shown on antag list
/datum/antagonist/bloodsucker/antag_listing_name()
	return ..() + "([return_full_name()])"

/// Whatever interesting things happened to the antag admins should know about
/// Include additional information about antag in this part
/datum/antagonist/bloodsucker/antag_listing_status()
	if(owner && !considered_alive(owner))
		return "<font color=red>Final Death</font>"
	return ..()

/datum/antagonist/bloodsucker/proc/forge_bloodsucker_objectives()
	// Claim a Lair Objective
	var/datum/objective/bloodsucker/lair/lair_objective = new
	lair_objective.owner = owner
	objectives += lair_objective
	// Survive Objective
	var/datum/objective/survive/bloodsucker/survive_objective = new
	survive_objective.owner = owner
	objectives += survive_objective

	// Objective 1: Vassalize a Head/Command, or a specific target
	switch(rand(1, 3))
		if(1) // Conversion Objective
			var/datum/objective/bloodsucker/conversion/chosen_subtype = pick(subtypesof(/datum/objective/bloodsucker/conversion))
			var/datum/objective/bloodsucker/conversion/conversion_objective = new chosen_subtype
			conversion_objective.owner = owner
			conversion_objective.objective_name = "Optional Objective"
			objectives += conversion_objective
		if(2) // Heart Thief Objective
			var/datum/objective/steal_n_of_type/hearts/heartthief_objective = new
			heartthief_objective.owner = owner
			heartthief_objective.objective_name = "Optional Objective"
			objectives += heartthief_objective
		if(3) // Drink Blood Objective
			var/datum/objective/bloodsucker/gourmand/gourmand_objective = new
			gourmand_objective.owner = owner
			gourmand_objective.objective_name = "Optional Objective"
			objectives += gourmand_objective

#define COFFIN_HEALING_COST 0.5

/datum/quirk/sol_weakness
	name = "Sol Weakness"
	icon = FA_ICON_SUN
	desc = "Your sub-species of the Hemophage virus renders you weak to Solar radiation, \
		you will have to hide in a coffin or a closet during the day, or risk burning to a crisp. \
		Thankfully, you will also heal your wounds at half cost in a coffin."
	gain_text = span_warning("You feel a sudden weakness in your body, and a burning sensation on your skin. \
		You should find a coffin to hide in during the day.")
	lose_text = span_notice("You feel safe in Sol's embrace once more.")
	medical_record_text = "Patient's strain of the hemophage virus is weak to sunlight. \
		They will have to hide in a coffin or a closet during the day, or risk burning to a crisp."
	value = -4
	hardcore_value = 6
	species_whitelist = list(SPECIES_HEMOPHAGE)
	quirk_flags = QUIRK_HIDE_FROM_SCAN | QUIRK_HUMAN_ONLY
	COOLDOWN_DECLARE(sun_burn)

/datum/quirk/sol_weakness/add()
	if(!quirk_holder.hud_used)
		RegisterSignal(quirk_holder, COMSIG_MOB_HUD_CREATED, PROC_REF(add_sun_timer_hud))
		return
	add_sun_timer_hud()

/datum/quirk/sol_weakness/remove()
	SSsunlight.remove_sun_sufferer(quirk_holder)
	UnregisterSignal(SSsunlight, list(COMSIG_SOL_RISE_TICK, COMSIG_SOL_WARNING_GIVEN))

/datum/quirk
	/// List of species that this quirk is valid for, or empty if it's valid for all species. Only use species ids here.
	var/list/species_whitelist = list()

/datum/quirk/add_to_holder(mob/living/new_holder, quirk_transfer, client/client_source)
	if(!can_add(new_holder))
		CRASH("Attempted to add quirk to holder that can't have it.")
	. = ..()

/// Returns true if the quirk is valid for the target, call parent so qurk_species_whitelist can be checked.
/datum/quirk/proc/can_add(mob/target)
	SHOULD_CALL_PARENT(TRUE)
	if(length(species_whitelist))
		if(!ishuman(target))
			return FALSE
		var/mob/living/carbon/human = target
		if(!(human?.dna.species.id in species_whitelist))
			return FALSE
	return TRUE


/datum/quirk/sol_weakness/can_add(mob/target)
	. = ..()
	if(!.)
		return
	return !IS_BLOODSUCKER(target)

/datum/quirk/sol_weakness/process(seconds_per_tick)
	var/datum/status_effect/blood_regen_active/regen = quirk_holder?.has_status_effect(/datum/status_effect/blood_regen_active)
	if(in_coffin() && ishemophage(quirk_holder))
		if(!regen)
			return
		// cheaper healing as long as you're in a coffin
		regen.cost_blood = COFFIN_HEALING_COST
	else if(regen?.blood_to_health_multiplier == COFFIN_HEALING_COST)
		regen.cost_blood = initial(regen.blood_to_health_multiplier)

/datum/quirk/sol_weakness/proc/add_sun_timer_hud()
	if(!quirk_holder.hud_used)
		CRASH("Sol Weakness quirk holder has no HUD")
	SSsunlight.add_sun_sufferer(quirk_holder)
	UnregisterSignal(quirk_holder, COMSIG_MOB_HUD_CREATED)
	RegisterSignal(SSsunlight, COMSIG_SOL_RISE_TICK, PROC_REF(sun_risen))
	RegisterSignal(SSsunlight, COMSIG_SOL_WARNING_GIVEN, PROC_REF(sun_warning))

/datum/quirk/sol_weakness/proc/sun_risen()
	SIGNAL_HANDLER
	if(!istype(quirk_holder.loc, /obj/structure))
		sun_burn()
	else
		if(in_coffin())
			quirk_holder.add_mood_event("vampsleep", /datum/mood_event/coffinsleep/quirk)
			sun_burn_message(span_warning("The sun is up, but you safely rest in your [quirk_holder.loc]."))
		else
			quirk_holder.add_mood_event("vampsleep", /datum/mood_event/daylight_bad_sleep)
			quirk_holder.adjustFireLoss(1)
			sun_burn_message(span_warning("[quirk_holder.loc] is not a coffin, but it keeps you safe enough."))

/datum/quirk/sol_weakness/proc/sun_burn()
	quirk_holder.add_mood_event("vampsleep", /datum/mood_event/daylight_sun_scorched)
	if(quirk_holder.blood_volume > BLOOD_VOLUME_MAXIMUM * 0.4)
		quirk_holder.blood_volume -= 5
		sun_burn_message(span_warning("The sun burns your skin, but your blood protects you from the worst of it..."))
		quirk_holder.adjustFireLoss(1)
		return
	sun_burn_message(span_userdanger("THE SUN, IT BURNS!"))
	quirk_holder.adjustFireLoss(2)
	quirk_holder.adjust_fire_stacks(1)
	quirk_holder.ignite_mob()

/datum/quirk/sol_weakness/proc/sun_burn_message(text)
	SIGNAL_HANDLER
	if(!COOLDOWN_FINISHED(src, sun_burn))
		return
	to_chat(quirk_holder, text)
	COOLDOWN_START(src, sun_burn, 30 SECONDS)

/datum/quirk/sol_weakness/proc/sun_warning(atom/source, danger_level, vampire_warning_message, vassal_warning_message)
	SIGNAL_HANDLER
	if(danger_level == DANGER_LEVEL_SOL_ROSE)
		vampire_warning_message = span_userdanger("Solar flares bombard the station with deadly UV light! Stay in cover for the next [TIME_BLOODSUCKER_DAY / 60] minutes or risk death!")
	SSsunlight.warn_notify(quirk_holder, danger_level, vampire_warning_message)

/datum/quirk/sol_weakness/proc/in_coffin()
	return istype(quirk_holder.loc, /obj/structure/closet/crate/coffin)

#undef COFFIN_HEALING_COST

//
/**
 * # Phobetor Brain Trauma
 *
 * Beefmen's Brain trauma, causing phobetor tears to traverse through.
 */

/datum/brain_trauma/special/bluespace_prophet/phobetor
	name = "Sleepless Dreamer"
	desc = "The patient, after undergoing untold psychological hardship, believes they can travel between the dreamscapes of this dimension."
	scan_desc = "awoken sleeper"
	gain_text = "<span class='notice'>Your mind snaps, and you wake up. You <i>really</i> wake up."
	lose_text = "<span class='warning'>You succumb once more to the sleepless dream of the unwoken."

	///Created tears, only checking the FIRST one, not the one it's created to link to.
	var/list/created_firsts = list()

///When the trauma is removed from a mob.
/datum/brain_trauma/special/bluespace_prophet/phobetor/on_lose(silent)
	. = ..()
	for(var/obj/effect/client_image_holder/phobetor/phobetor_tears as anything in created_firsts)
		qdel(phobetor_tears)

/datum/brain_trauma/special/bluespace_prophet/phobetor/on_life(seconds_per_tick, times_fired)
	if(!COOLDOWN_FINISHED(src, portal_cooldown))
		return
	COOLDOWN_START(src, portal_cooldown, 10 SECONDS)
	var/list/turf/possible_tears = list()
	for(var/turf/nearby_turfs as anything in RANGE_TURFS(8, owner))
		if(nearby_turfs.density)
			continue
		possible_tears += nearby_turfs
	if(!LAZYLEN(possible_tears))
		return

	var/turf/first_tear
	var/turf/second_tear
	first_tear = return_valid_floor_in_range(owner, 6, 0, TRUE)
	if(!first_tear)
		return
	second_tear = return_valid_floor_in_range(first_tear, 20, 6, TRUE)
	if(!second_tear)
		return

	var/obj/effect/client_image_holder/phobetor/first = new(first_tear, owner)
	var/obj/effect/client_image_holder/phobetor/second = new(second_tear, owner)

	first.linked_to = second
	first.seer = owner
	first.desc += " This one leads to [get_area(second)]."
	first.name += " ([get_area(second)])"
	created_firsts += first

	second.linked_to = first
	second.seer = owner
	second.desc += " This one leads to [get_area(first)]."
	second.name += " ([get_area(first)])"

	// Delete Next Portal if it's time (it will remove its partner)
	var/obj/effect/client_image_holder/phobetor/first_on_the_stack = created_firsts[1]
	if(created_firsts.len && world.time >= first_on_the_stack.created_on + first_on_the_stack.exist_length)
		var/targetGate = first_on_the_stack
		created_firsts -= targetGate
		qdel(targetGate)

/datum/brain_trauma/special/bluespace_prophet/phobetor/proc/return_valid_floor_in_range(atom/targeted_atom, checkRange = 8, minRange = 0, check_floor = TRUE)
	// FAIL: Atom doesn't exist. Aren't you real?
	if(!istype(targeted_atom))
		return FALSE
	var/delta_x = rand(minRange,checkRange)*pick(-1,1)
	var/delta_y = rand(minRange,checkRange)*pick(-1,1)
	var/turf/center = get_turf(targeted_atom)

	var/target = locate((center.x + delta_x),(center.y + delta_y), center.z)
	if(check_turf_is_valid(target, check_floor))
		return target
	return FALSE

/**
 * Used as a helper that checks if you can successfully teleport to a turf.
 * Returns a boolean, and checks for if the turf has density, if the turf's area has the NOTELEPORT flag,
 * and if the objects in the turf have density.
 * If check_floor is TRUE in the argument, it will return FALSE if it's not a type of [/turf/open/floor].
 * Arguments:
 * * turf/open_turf - The turf being checked for validity.
 * * check_floor - Checks if it's a type of [/turf/open/floor]. If this is FALSE, lava/chasms will be able to be selected.
 */
/datum/brain_trauma/special/bluespace_prophet/phobetor/proc/check_turf_is_valid(turf/open_turf, check_floor = TRUE)
	if(check_floor && !istype(open_turf, /turf/open/floor))
		return FALSE
	if(open_turf.density)
		return FALSE
	var/area/turf_area = get_area(open_turf)
	if(turf_area.area_flags & NOTELEPORT)
		return FALSE
	// Checking for Objects...
	for(var/obj/object in open_turf)
		if(object.density)
			return FALSE
	return TRUE

/**
 * # Phobetor Tears
 *
 * The phobetor tears created by the Brain trauma.
 */

/obj/effect/client_image_holder/phobetor
	name = "phobetor tear"
	desc = "A subdimensional rip in reality, which gives extra-spacial passage to those who have woken from the sleepless dream."
	image_icon = 'modularz_arkstation/modules/bloodsucker/icons/effects/phobetor_tear.dmi'
	image_state = "phobetor_tear"
	// Place this above shadows so it always glows.
	image_layer = ABOVE_MOB_LAYER

	/// How long this will exist for
	var/exist_length = 50 SECONDS
	/// The time of this tear's creation
	var/created_on
	/// The phobetor tear this is linked to
	var/obj/effect/client_image_holder/phobetor/linked_to
	/// The person able to see this tear.
	var/mob/living/carbon/seer

/obj/effect/client_image_holder/phobetor/Initialize()
	. = ..()
	created_on = world.time

/obj/effect/client_image_holder/phobetor/Destroy()
	if(linked_to)
		linked_to.linked_to = null
		QDEL_NULL(linked_to)
	return ..()

/obj/effect/client_image_holder/phobetor/proc/check_location_seen(atom/subject, turf/target_turf)
	if(!target_turf)
		return FALSE
	if(!isturf(target_turf))
		return FALSE
	if(!target_turf.lighting_object || !target_turf.get_lumcount() >= 0.1)
		return FALSE
	for(var/mob/living/nearby_viewers in viewers(target_turf))
		if(nearby_viewers == subject)
			continue
		if(!isliving(nearby_viewers) || !nearby_viewers.mind)
			continue
		if(nearby_viewers.is_blind())
			continue
		return TRUE
	return FALSE

/obj/effect/client_image_holder/phobetor/attack_hand(mob/living/user, list/modifiers)
	if(user != seer || !linked_to)
		return
	if(user.loc != src.loc)
		to_chat(user, "Step into the Tear before using it.")
		return
	for(var/obj/item/implant/tracking/imp in user.implants)
		if(imp)
			to_chat(user, span_warning("[imp] gives you the sense that you're being watched."))
			return
	// Is this, or linked, stream being watched?
	if(check_location_seen(user, get_turf(user)))
		to_chat(user, span_warning("Not while you're being watched."))
		return
	if(check_location_seen(user, get_turf(linked_to)))
		to_chat(user, span_warning("Your destination is being watched."))
		return
	to_chat(user, span_notice("You slip unseen through [src]."))
	user.playsound_local(null, 'sound/magic/wand_teleport.ogg', 30, FALSE, pressure_affected = FALSE)
	user.forceMove(get_turf(linked_to))

//
/// Called once the target is made into a bloodsucker. Used for removing conflicting species organs mostly
/datum/species/proc/on_bloodsucker_gain(mob/living/carbon/human/target)
	return null

/datum/species/proc/on_bloodsucker_loss(mob/living/carbon/human/target)
	return null

/// Replaces a couple organs to normal variants to not cause issues. Not super happy with this, alternative is disallowing vampiric races from being bloodsuckers
/datum/species/proc/humanize_organs(mob/living/carbon/human/target, organs = list())
	if(!organs || !length(organs))
		organs = list(
			ORGAN_SLOT_HEART = /obj/item/organ/internal/heart,
			ORGAN_SLOT_LIVER = /obj/item/organ/internal/liver,
			ORGAN_SLOT_STOMACH = /obj/item/organ/internal/stomach,
			ORGAN_SLOT_TONGUE = /obj/item/organ/internal/tongue,
		)
	mutantheart = organs[ORGAN_SLOT_HEART]
	mutantliver = organs[ORGAN_SLOT_LIVER]
	mutantstomach = organs[ORGAN_SLOT_STOMACH]
	mutanttongue = organs[ORGAN_SLOT_TONGUE]
	for(var/organ_slot in organs)
		var/obj/item/organ/old_organ = target.get_organ_slot(organ_slot)
		var/organ_path = organs[organ_slot]
		if(old_organ?.type == organ_path)
			continue
		var/obj/item/organ/new_organ = SSwardrobe.provide_type(organ_path)
		new_organ.Insert(target, FALSE, DELETE_IF_REPLACED)

/datum/species/proc/normalize_organs(mob/living/carbon/human/target)
	mutantheart = initial(mutantheart)
	mutantliver = initial(mutantliver)
	mutantstomach = initial(mutantstomach)
	mutanttongue = initial(mutanttongue)
	regenerate_organs(target, replace_current = TRUE)

//

/datum/species/jelly/on_bloodsucker_gain(mob/living/carbon/human/target)
	humanize_organs(target)

/datum/species/jelly/on_bloodsucker_loss(mob/living/carbon/human/target)
	// regenerate_organs with replace doesn't seem to automatically remove invalid organs unfortunately
	normalize_organs()

//

/datum/species/lizard/on_bloodsucker_gain(mob/living/carbon/human/target, datum/species/current_species)
	bodytemp_heat_damage_limit = BODYTEMP_HEAT_DAMAGE_LIMIT
	bodytemp_cold_damage_limit = BODYTEMP_COLD_DAMAGE_LIMIT

/datum/species/lizard/on_bloodsucker_loss(mob/living/carbon/human/target)
	bodytemp_heat_damage_limit = initial(bodytemp_heat_damage_limit)
	bodytemp_cold_damage_limit = initial(bodytemp_cold_damage_limit)

//
/datum/species/vampire
	inherent_biotypes = MOB_VAMPIRIC|MOB_UNDEAD|MOB_HUMANOID

/datum/species/vampire/on_bloodsucker_gain(mob/living/carbon/human/target, datum/species/current_species)
	to_chat(target, span_warning("Your vampire features have been removed, your nature as a bloodsucker abates the lesser vampirism curse."))
	humanize_organs(target, current_species)

/datum/species/vampire/on_bloodsucker_loss(mob/living/carbon/human/target)
	normalize_organs(target)

// handled by bane on null rod whip
/datum/species/vampire/damage_weakness(datum/source, list/damage_mods, damage_amount, damagetype, def_zone, sharpness, attack_direction, obj/item/attacking_item)
	return

//
/datum/species/hemophage
	inherent_biotypes = MOB_HUMANOID | MOB_ORGANIC | MOB_VAMPIRIC
	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/mhuman,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/mhuman,
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/mhuman,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/mhuman,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/mhuman,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/mhuman,
	)

// MUTANT COLOR OVERRIDE

/datum/species/hemophage/New()
	inherent_traits |= list(
		TRAIT_MUTANT_COLORS,
	)
	. = ..()

// BLOODSUCKER SPECIFIC FIXES
/datum/species/hemophage/on_bloodsucker_gain(mob/living/carbon/human/target)
	to_chat(target, span_warning("Your hemophage features have been removed, your nature as a bloodsucker abates the hemophage virus."))
	// Without this any new organs would get corrupted again.
	target.RemoveElement(/datum/element/tumor_corruption)
	for(var/obj/item/organ/internal/organ in target.organs)
		organ.RemoveElement(/datum/element/tumor_corruption)
	humanize_organs(target)

/datum/species/hemophage/on_bloodsucker_loss(mob/living/carbon/human/target)
	normalize_organs(target)
