/**
 *	# Assigning Sol
 *
 *	Sol is the sunlight, during this period, all Bloodsuckers must be in their coffin, else they burn.
 */

///Ranks the Bloodsucker up, called by Sol.
/datum/antagonist/bloodsucker/proc/sol_rank_up(atom/source)
	SIGNAL_HANDLER

	INVOKE_ASYNC(src, PROC_REF(RankUp))

///Called when Sol is near starting.
/datum/antagonist/bloodsucker/proc/sol_near_start(atom/source)
	SIGNAL_HANDLER
	if(bloodsucker_lair_area && !(locate(/datum/action/cooldown/bloodsucker/gohome) in powers))
		BuyPower(/datum/action/cooldown/bloodsucker/gohome)

///Called when Sol first ends.
/datum/antagonist/bloodsucker/proc/on_sol_end(atom/source)
	SIGNAL_HANDLER
	check_end_torpor()
	for(var/datum/action/cooldown/bloodsucker/power in powers)
		if(istype(power, /datum/action/cooldown/bloodsucker/gohome))
			RemovePower(power)

/datum/antagonist/bloodsucker/proc/handle_sol()
	SIGNAL_HANDLER
	if(!owner || !owner.current || isbrain(owner.current))
		return

	if(!istype(owner.current.loc, /obj/structure))
		if(COOLDOWN_FINISHED(src, bloodsucker_spam_sol_burn))
			if(bloodsucker_level > 0)
				to_chat(owner, span_userdanger("The solar flare sets your skin ablaze!"))
			else
				to_chat(owner, span_userdanger("The solar flare scalds your neophyte skin!"))
			COOLDOWN_START(src, bloodsucker_spam_sol_burn, BLOODSUCKER_SPAM_SOL) //This should happen twice per Sol

		if(owner.current.fire_stacks <= 0)
			owner.current.fire_stacks = 0
		if(bloodsucker_level > 0)
			owner.current.adjust_fire_stacks(0.2 + bloodsucker_level / 10)
			owner.current.ignite_mob()
		owner.current.adjustFireLoss(2 + (bloodsucker_level / 2))
		owner.current.updatehealth()
		owner.current.add_mood_event("vampsleep", /datum/mood_event/daylight_sun_scorched)
		return

	if(istype(owner.current.loc, /obj/structure/closet/crate/coffin)) // Coffins offer the BEST protection
		if(owner.current.am_staked() && COOLDOWN_FINISHED(src, bloodsucker_spam_sol_burn))
			to_chat(owner.current, span_userdanger("You are staked you will keep burning until it is removed! Remove the offending weapon from your heart before sleeping."))
			COOLDOWN_START(src, bloodsucker_spam_sol_burn, BLOODSUCKER_SPAM_SOL) //This should happen twice per Sol
		if(!HAS_TRAIT_FROM_ONLY(owner.current, TRAIT_NODEATH, BLOODSUCKER_TRAIT))
			check_begin_torpor(TORPOR_SKIP_CHECK_ALL)
			owner.current.add_mood_event("vampsleep", /datum/mood_event/coffinsleep)
		return

	if(COOLDOWN_FINISHED(src, bloodsucker_spam_sol_burn)) // Closets offer SOME protection
		to_chat(owner, span_warning("Your skin sizzles. [owner.current.loc] doesn't protect well against UV bombardment."))
		COOLDOWN_START(src, bloodsucker_spam_sol_burn, BLOODSUCKER_SPAM_SOL) //This should happen twice per Sol
	owner.current.adjustFireLoss(0.5 + (bloodsucker_level / 4))
	owner.current.updatehealth()
	owner.current.add_mood_event("vampsleep", /datum/mood_event/daylight_bad_sleep)

/datum/antagonist/bloodsucker/proc/give_warning(atom/source, danger_level, vampire_warning_message, vassal_warning_message)
	SIGNAL_HANDLER
	SSsunlight.warn_notify(owner.current, danger_level, vampire_warning_message)

/**
 * # Torpor
 *
 * Torpor is what deals with the Bloodsucker falling asleep, their healing, the effects, ect.
 * This is basically what Sol is meant to do to them, but they can also trigger it manually if they wish to heal, as Burn is only healed through Torpor.
 * You cannot manually exit Torpor, it is instead entered/exited by:
 *
 * Torpor is triggered by:
 * - Being in a Coffin while Sol is on, dealt with by Sol
 * - Entering a Coffin with more than 10 combined Brute/Burn damage, dealt with by /closet/crate/coffin/close() [bloodsucker_coffin.dm]
 * - Death, dealt with by /HandleDeath()
 * Torpor is ended by:
 * - Having less than 10 Brute damage while OUTSIDE of your Coffin while it isnt Sol.
 * - Having less than 10 Brute & Burn Combined while INSIDE of your Coffin while it isnt Sol.
 * - Sol being over, dealt with by /sunlight/process() [bloodsucker_daylight.dm]
*/
/datum/antagonist/bloodsucker/proc/check_begin_torpor(SkipChecks = NONE)
	var/mob/living/carbon/user = owner.current
	/// Are we entering Torpor via Sol/Death? Then entering it isnt optional!
	if(SkipChecks & TORPOR_SKIP_CHECK_ALL)
		if(COOLDOWN_FINISHED(src, bloodsucker_spam_torpor))
			to_chat(user, span_danger("Your immortal body will not yet relinquish your soul to the abyss. You enter Torpor."))
		torpor_begin(TRUE)
		return
	/// Prevent Torpor whilst frenzied.
	if(!(SkipChecks & TORPOR_SKIP_CHECK_FRENZY) && (frenzied || (IS_DEAD_OR_INCAP(user) && bloodsucker_blood_volume == 0)))
		to_chat(user, span_userdanger("Your frenzy prevents you from entering torpor!"))
		return
	// sometimes you might incur these damage types when you really, should not, important to check for it here so we can heal it later
	var/total_damage = getBruteLoss() + getFireLoss() + user.getToxLoss() + user.getOxyLoss()
	/// Checks - Not daylight & Has more than 10 Brute/Burn & not already in Torpor
	if(SkipChecks & TORPOR_SKIP_CHECK_DAMAGE || !SSsunlight.sunlight_active && total_damage >= 10 && !HAS_TRAIT_FROM_ONLY(owner.current, TRAIT_NODEATH, BLOODSUCKER_TRAIT))
		torpor_begin()

/datum/antagonist/bloodsucker/proc/check_end_torpor()
	var/mob/living/carbon/user = owner.current
	var/total_brute = getBruteLoss()
	var/total_burn = getFireLoss()
	// for waking up we ignore all other damage types so we don't get stuck
	var/total_damage = total_brute + total_burn
	if(total_burn >= user.maxHealth * 2)
		return FALSE
	if(SSsunlight.sunlight_active)
		return FALSE
	if(bloodsucker_blood_volume == 0 || owner.current.am_staked())
		// If you're frenzying, you need a bit more health to actually have a chance to do something
		if(frenzied && total_damage >= user.maxHealth)
			return FALSE
		torpor_end()
	// You are in a Coffin, so instead we'll check TOTAL damage, here.
	if(istype(user.loc, /obj/structure/closet/crate/coffin))
		if(total_damage <= 10)
			torpor_end()
	else
		if(total_damage <= 10)
			torpor_end()
	return TRUE

/datum/antagonist/bloodsucker/proc/torpor_begin(silent = FALSE)
	// slow down bucko
	if(!COOLDOWN_FINISHED(src, bloodsucker_spam_torpor))
		return
	if(!silent)
		to_chat(owner.current, span_notice("You enter the horrible slumber of deathless Torpor. You will heal until you are renewed."))
	// Force them to go to sleep
	REMOVE_TRAIT(owner.current, TRAIT_SLEEPIMMUNE, BLOODSUCKER_TRAIT)
	// Without this, you'll just keep dying while you recover.
	owner.current.add_traits(list(TRAIT_NODEATH, TRAIT_FAKEDEATH, TRAIT_DEATHCOMA, TRAIT_RESISTLOWPRESSURE, TRAIT_RESISTHIGHPRESSURE), BLOODSUCKER_TRAIT)
	owner.current.do_jitter_animation(2)
	// Disable ALL Powers
	DisableAllPowers()

/datum/antagonist/bloodsucker/proc/torpor_end(quiet = FALSE)
	if(quiet)
		owner.current.grab_ghost()
		to_chat(owner.current, span_warning("You have recovered from Torpor."))
	owner.current.remove_traits(list(TRAIT_NODEATH, TRAIT_FAKEDEATH, TRAIT_DEATHCOMA, TRAIT_RESISTLOWPRESSURE, TRAIT_RESISTHIGHPRESSURE), BLOODSUCKER_TRAIT)
	if(!HAS_TRAIT_FROM_ONLY(owner.current, TRAIT_MASQUERADE, BLOODSUCKER_TRAIT))
		ADD_TRAIT(owner.current, TRAIT_SLEEPIMMUNE, BLOODSUCKER_TRAIT)
	heal_vampire_organs()
	SEND_SIGNAL(src, BLOODSUCKER_EXIT_TORPOR)

// QUIRK //


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
