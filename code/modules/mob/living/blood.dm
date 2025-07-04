#define BLOOD_DRIP_RATE_MOD 90 //Greater number means creating blood drips more often while bleeding
// Conversion between internal drunk power and common blood alcohol content
#define DRUNK_POWER_TO_BLOOD_ALCOHOL 0.003

/****************************************************
				BLOOD SYSTEM
****************************************************/

// Takes care blood loss and regeneration
/mob/living/carbon/human/handle_blood(seconds_per_tick, times_fired)
	// Under these circumstances blood handling is not necessary
	if(bodytemperature < BLOOD_STOP_TEMP || HAS_TRAIT(src, TRAIT_FAKEDEATH) || HAS_TRAIT(src, TRAIT_HUSK))
		return
	// Run the signal, still allowing mobs with noblood to "handle blood" in their own way
	var/sigreturn = SEND_SIGNAL(src, COMSIG_HUMAN_ON_HANDLE_BLOOD, seconds_per_tick, times_fired)
	if((sigreturn & HANDLE_BLOOD_HANDLED) || HAS_TRAIT(src, TRAIT_NOBLOOD))
		return

	//Blood regeneration if there is some space
	if(!(sigreturn & HANDLE_BLOOD_NO_NUTRITION_DRAIN))
		if(blood_volume < BLOOD_VOLUME_NORMAL && !HAS_TRAIT(src, TRAIT_NOHUNGER))
			var/nutrition_ratio = round(nutrition / NUTRITION_LEVEL_WELL_FED, 0.2)
			if(satiety > 80)
				nutrition_ratio *= 1.25
			adjust_nutrition(-nutrition_ratio * HUNGER_FACTOR * seconds_per_tick)
			blood_volume = min(blood_volume + (BLOOD_REGEN_FACTOR * physiology.blood_regen_mod * nutrition_ratio * seconds_per_tick), BLOOD_VOLUME_NORMAL)

			// ARK STATION ADDITION START
			var/thirst_ratio = 0
			if(!HAS_TRAIT(src, TRAIT_NOTHIRST))
				switch(water_level)
					if(0 to THIRST_LEVEL_PARCHED)
						thirst_ratio = 0.2
					if(THIRST_LEVEL_PARCHED to THIRST_LEVEL_THIRSTY)
						thirst_ratio = 0.4
					if(THIRST_LEVEL_THIRSTY to THIRST_LEVEL_BIT_THIRSTY)
						thirst_ratio = 0.6
					if(THIRST_LEVEL_BIT_THIRSTY to THIRST_LEVEL_QUENCHED)
						thirst_ratio = 0.8
					else
						thirst_ratio = 1
				adjust_thirst(-thirst_ratio * THIRST_FACTOR)
				blood_volume = min(BLOOD_VOLUME_NORMAL, blood_volume + 0.5 * thirst_ratio)
			// ARK STATION ADDITION END

	//Bloodloss from wounds
	var/temp_bleed = 0
	for(var/obj/item/bodypart/iter_part as anything in bodyparts)
		var/iter_bleed_rate = iter_part.get_modified_bleed_rate()
		temp_bleed += iter_bleed_rate * seconds_per_tick

		if(iter_part.generic_bleedstacks) // If you don't have any bleedstacks, don't try and heal them
			iter_part.adjustBleedStacks(-1, 0)

	if(temp_bleed)
		bleed(temp_bleed)
		bleed_warn(temp_bleed)

	//Effects of bloodloss
	if(sigreturn & HANDLE_BLOOD_NO_OXYLOSS)
		return

	// Some effects are halved mid-combat.
	var/determined_mod = has_status_effect(/datum/status_effect/determined) ? 0.5 : 0

	var/word = pick("dizzy","woozy","faint")
	switch(blood_volume)
		if(BLOOD_VOLUME_EXCESS to BLOOD_VOLUME_MAX_LETHAL)
			if(SPT_PROB(7.5, seconds_per_tick))
				to_chat(src, span_userdanger("Blood starts to tear your skin apart. You're going to burst!"))
				investigate_log("has been gibbed by having too much blood.", INVESTIGATE_DEATHS)
				inflate_gib()
		// Way too much blood!
		if(BLOOD_VOLUME_EXCESS to BLOOD_VOLUME_MAX_LETHAL)
			if(SPT_PROB(5, seconds_per_tick))
				to_chat(src, span_warning("You feel your skin swelling."))
		// Too much blood
		if(BLOOD_VOLUME_MAXIMUM to BLOOD_VOLUME_EXCESS)
			if(SPT_PROB(5, seconds_per_tick))
				to_chat(src, span_warning("You feel terribly bloated."))
		// Low blood but not a big deal in the immediate
		if(BLOOD_VOLUME_OKAY to BLOOD_VOLUME_SAFE)
			if(SPT_PROB(2.5, seconds_per_tick))
				set_eye_blur_if_lower(2 SECONDS * determined_mod)
				if(prob(50))
					to_chat(src, span_danger("You feel [word]. It's getting a bit hard to breathe."))
					losebreath += 0.5 * determined_mod * seconds_per_tick
				else if(getStaminaLoss() < 25 * determined_mod)
					to_chat(src, span_danger("You feel [word]. It's getting a bit hard to focus."))
					adjustStaminaLoss(10 * determined_mod * REM * seconds_per_tick)
		// Pretty low blood, getting dangerous!
		if(BLOOD_VOLUME_RISKY to BLOOD_VOLUME_OKAY)
			if(SPT_PROB(5, seconds_per_tick))
				set_eye_blur_if_lower(2 SECONDS * determined_mod)
				set_dizzy_if_lower(2 SECONDS * determined_mod)
				if(prob(50))
					to_chat(src, span_bolddanger("You feel very [word]. It's getting hard to breathe!"))
					losebreath += 1 * determined_mod * seconds_per_tick
				else if(getStaminaLoss() < 40 * determined_mod)
					to_chat(src, span_bolddanger("You feel very [word]. It's getting hard to stay awake!"))
					adjustStaminaLoss(15 * determined_mod * REM * seconds_per_tick)
		// Very low blood, danger!!
		if(BLOOD_VOLUME_BAD to BLOOD_VOLUME_RISKY)
			if(SPT_PROB(5, seconds_per_tick))
				set_eye_blur_if_lower(4 SECONDS * determined_mod)
				set_dizzy_if_lower(4 SECONDS * determined_mod)
				if(prob(50))
					to_chat(src, span_userdanger("You feel extremely [word]! It's getting very hard to breathe!"))
					losebreath += 1.5 * determined_mod * seconds_per_tick
				else if(getStaminaLoss() < 80 * determined_mod)
					to_chat(src, span_userdanger("You feel extremely [word]! It's getting very hard to stay awake!"))
					adjustStaminaLoss(20 * determined_mod * REM * seconds_per_tick)
		// Critically low blood, death is near! Adrenaline won't help you here.
		if(BLOOD_VOLUME_SURVIVE to BLOOD_VOLUME_BAD)
			if(SPT_PROB(7.5, seconds_per_tick))
				Unconscious(rand(1 SECONDS, 2 SECONDS))
				to_chat(src, span_userdanger("You black out for a moment!"))
		// Instantly die upon this threshold
		if(-INFINITY to BLOOD_VOLUME_SURVIVE)
			if(!HAS_TRAIT(src, TRAIT_NODEATH))
				investigate_log("has died of bloodloss.", INVESTIGATE_DEATHS)
				death()

	// Blood ratio! if you have 280 blood, this equals 0.5 as that's half of the current value, 560.
	var/effective_blood_ratio = blood_volume / BLOOD_VOLUME_NORMAL
	var/target_oxyloss = max((1 - effective_blood_ratio) * 100, 0)

	// If your ratio is less than one (you're missing any blood) and your oxyloss is under missing blood %, start getting oxy damage.
	// This damage accrues faster the less blood you have.
	// If the damage surpasses the KO threshold for oxyloss, then we'll always tick up so you die eventually
	if(target_oxyloss > 0 && (getOxyLoss() < target_oxyloss || (target_oxyloss >= OXYLOSS_PASSOUT_THRESHOLD && stat >= UNCONSCIOUS)))
		// At roughly half blood this equals to 3 oxyloss per tick. At 90% blood it's close to 0.5
		var/rounded_oxyloss = round(0.01 * (BLOOD_VOLUME_NORMAL - blood_volume), 0.25) * seconds_per_tick
		adjustOxyLoss(rounded_oxyloss, updating_health = TRUE)

/// Has each bodypart update its bleed/wound overlay icon states
/mob/living/carbon/proc/update_bodypart_bleed_overlays()
	for(var/obj/item/bodypart/iter_part as anything in bodyparts)
		iter_part.update_part_wound_overlay()

//Makes a blood drop, leaking amt units of blood from the mob
/mob/living/carbon/proc/bleed(amt)
	if(!blood_volume || HAS_TRAIT(src, TRAIT_GODMODE))
		return
	blood_volume = max(blood_volume - amt, 0)

	//Blood loss still happens in locker, floor stays clean
	if(isturf(loc) && prob(sqrt(amt)*BLOOD_DRIP_RATE_MOD))
		add_splatter_floor(loc, (amt <= 10))

/mob/living/carbon/human/bleed(amt)
	amt *= physiology.bleed_mod
	if(!HAS_TRAIT(src, TRAIT_NOBLOOD))
		..()

/// A helper to see how much blood we're losing per tick
/mob/living/carbon/proc/get_bleed_rate()
	if(!blood_volume)
		return
	var/bleed_amt = 0
	for(var/X in bodyparts)
		var/obj/item/bodypart/iter_bodypart = X
		bleed_amt += iter_bodypart.get_modified_bleed_rate()
	return bleed_amt

/mob/living/carbon/human/get_bleed_rate()
	if(HAS_TRAIT(src, TRAIT_NOBLOOD))
		return
	. = ..()
	. *= physiology.bleed_mod

/**
 * bleed_warn() is used to for carbons with an active client to occasionally receive messages warning them about their bleeding status (if applicable)
 *
 * Arguments:
 * * bleed_amt- When we run this from [/mob/living/carbon/human/proc/handle_blood] we already know how much blood we're losing this tick, so we can skip tallying it again with this
 * * forced-
 */
/mob/living/carbon/proc/bleed_warn(bleed_amt = 0, forced = FALSE)
	if(!blood_volume || !client)
		return
	if(!COOLDOWN_FINISHED(src, bleeding_message_cd) && !forced)
		return

	if(!bleed_amt) // if we weren't provided the amount of blood we lost this tick in the args
		bleed_amt = get_bleed_rate()

	var/bleeding_severity = ""
	var/next_cooldown = BLEEDING_MESSAGE_BASE_CD

	switch(bleed_amt)
		if(-INFINITY to 0)
			return
		if(0 to 1)
			bleeding_severity = "You feel light trickles of blood across your skin"
			next_cooldown *= 2.5
		if(1 to 3)
			bleeding_severity = "You feel a small stream of blood running across your body"
			next_cooldown *= 2
		if(3 to 5)
			bleeding_severity = "You skin feels clammy from the flow of blood leaving your body"
			next_cooldown *= 1.7
		if(5 to 7)
			bleeding_severity = "Your body grows more and more numb as blood streams out"
			next_cooldown *= 1.5
		if(7 to INFINITY)
			bleeding_severity = "Your heartbeat thrashes wildly trying to keep up with your bloodloss"

	var/rate_of_change = ", but it's getting better." // if there's no wounds actively getting bloodier or maintaining the same flow, we must be getting better!
	if(HAS_TRAIT(src, TRAIT_COAGULATING)) // if we have coagulant, we're getting better quick
		rate_of_change = ", but it's clotting up quickly!"
	else
		// flick through our wounds to see if there are any bleeding ones getting worse or holding flow (maybe move this to handle_blood and cache it so we don't need to cycle through the wounds so much)
		for(var/datum/wound/iter_wound as anything in all_wounds)
			if(!iter_wound.blood_flow)
				continue
			var/iter_wound_roc = iter_wound.get_bleed_rate_of_change()
			switch(iter_wound_roc)
				if(BLOOD_FLOW_INCREASING) // assume the worst, if one wound is getting bloodier, we focus on that
					rate_of_change = ", <b>and it's getting worse!</b>"
					break
				if(BLOOD_FLOW_STEADY) // our best case now is that our bleeding isn't getting worse
					rate_of_change = ", and it's holding steady."
				if(BLOOD_FLOW_DECREASING) // this only matters if none of the wounds fit the above two cases, included here for completeness
					continue

	to_chat(src, span_warning("[bleeding_severity][rate_of_change]"))
	COOLDOWN_START(src, bleeding_message_cd, next_cooldown)

/mob/living/carbon/human/bleed_warn(bleed_amt = 0, forced = FALSE)
	if(!HAS_TRAIT(src, TRAIT_NOBLOOD))
		return ..()

/mob/living/proc/restore_blood()
	blood_volume = initial(blood_volume)

/mob/living/carbon/restore_blood()
	blood_volume = BLOOD_VOLUME_NORMAL
	for(var/obj/item/bodypart/bodypart_to_restore as anything in bodyparts)
		bodypart_to_restore.setBleedStacks(0)

/****************************************************
				BLOOD TRANSFERS
****************************************************/

//Gets blood from mob to a container or other mob, preserving all data in it.
/mob/living/proc/transfer_blood_to(atom/movable/receiver, amount, forced, ignore_incompatibility)
	if(!blood_volume || !receiver.reagents)
		return FALSE
	if(blood_volume < BLOOD_VOLUME_BAD && !forced)
		return FALSE

	if(blood_volume < amount)
		amount = blood_volume

	var/blood_id = get_blood_id()
	if(!blood_id)
		return FALSE

	blood_volume -= amount

	var/list/blood_data = get_blood_data(blood_id)

	if(iscarbon(receiver))
		var/mob/living/carbon/carbon_receiver = receiver
		if(blood_id == carbon_receiver.get_blood_id()) //both mobs have the same blood substance
			if(blood_id == /datum/reagent/blood) //normal blood
				if(blood_data["viruses"])
					for(var/datum/disease/blood_disease as anything in blood_data["viruses"])
						if((blood_disease.spread_flags & DISEASE_SPREAD_SPECIAL) || (blood_disease.spread_flags & DISEASE_SPREAD_NON_CONTAGIOUS))
							continue
						carbon_receiver.ForceContractDisease(blood_disease)
				var/datum/blood_type/blood_type = blood_data["blood_type"]
				if(!ignore_incompatibility && !(blood_type.type_key() in carbon_receiver.dna.blood_type.compatible_types))
					carbon_receiver.reagents.add_reagent(/datum/reagent/toxin, amount * 0.5)
					return TRUE

			carbon_receiver.blood_volume = min(carbon_receiver.blood_volume + round(amount, 0.1), BLOOD_VOLUME_MAX_LETHAL)
			return TRUE

	receiver.reagents.add_reagent(blood_id, amount, blood_data, bodytemperature)
	return TRUE


/mob/living/proc/get_blood_data(blood_id)
	return

/mob/living/carbon/get_blood_data(blood_id)
	if(blood_id == /datum/reagent/blood) //actual blood reagent
		var/blood_data = list()
		//set the blood data
		blood_data["viruses"] = list()

		for(var/datum/disease/disease as anything in diseases)
			blood_data["viruses"] += disease.Copy()

		blood_data["blood_DNA"] = dna.unique_enzymes
		if(LAZYLEN(disease_resistances))
			blood_data["resistances"] = disease_resistances.Copy()
		var/list/temp_chem = list()
		for(var/datum/reagent/blood_reagent in reagents.reagent_list)
			temp_chem[blood_reagent.type] = blood_reagent.volume
		blood_data["trace_chem"] = list2params(temp_chem)
		if(mind)
			blood_data["mind"] = mind
		else if(last_mind)
			blood_data["mind"] = last_mind
		if(ckey)
			blood_data["ckey"] = ckey
		else if(last_mind)
			blood_data["ckey"] = ckey(last_mind.key)

		if(!HAS_TRAIT_FROM(src, TRAIT_SUICIDED, REF(src)))
			blood_data["cloneable"] = 1
		blood_data["blood_type"] = dna.blood_type
		blood_data["gender"] = gender
		blood_data["real_name"] = real_name
		blood_data["features"] = dna.features
		blood_data["factions"] = faction
		blood_data["quirks"] = list()
		for(var/datum/quirk/quirk as anything in quirks)
			blood_data["quirks"] += quirk.type
		return blood_data

//get the id of the substance this mob use as blood.
/mob/proc/get_blood_id()
	return

/mob/living/simple_animal/get_blood_id()
	if(blood_volume)
		return /datum/reagent/blood

/mob/living/carbon/human/get_blood_id()
	if(HAS_TRAIT(src, TRAIT_HUSK) || !dna)
		return
	if(check_holidays(APRIL_FOOLS) && is_clown_job(mind?.assigned_role))
		return /datum/reagent/colorful_reagent
	if(dna.species.exotic_blood)
		return dna.species.exotic_blood
	else if(HAS_TRAIT(src, TRAIT_NOBLOOD))
		return
	return /datum/reagent/blood

/// Returns the blood_type datum that corresponds to the string id key in GLOB.blood_types
/proc/get_blood_type(id)
	return GLOB.blood_types[id]

/// Returns the hex color string of a given blood_type datum given an assoc list of blood_DNA e.g. ("Unknown Blood Type", "*X")
/proc/get_blood_dna_color(list/blood_DNA)
	var/datum/blood_type/blood_type
	if(length(blood_DNA))
		var/last_added_bloodtype_key = blood_DNA[length(blood_DNA)]
		blood_type = blood_DNA[last_added_bloodtype_key]
	if(!istype(blood_type))
		blood_type = get_blood_type(blood_type) || random_human_blood_type()
	return blood_type.get_color()

/**
 * Returns TRUE if src is compatible with donor's blood, otherwise FALSE.
 * * donor: Carbon mob, the one that is donating blood.
 */
/mob/living/carbon/proc/get_blood_compatibility(mob/living/carbon/donor)
	var/datum/blood_type/patient_blood_data = dna.blood_type
	var/datum/blood_type/donor_blood_data = donor.dna.blood_type
	return (donor_blood_data in patient_blood_data.compatible_types)

//to add a splatter of blood or other mob liquid.
/mob/living/proc/add_splatter_floor(turf/splatter_turf, small_drip, skip_reagents_check = FALSE)
	if(!skip_reagents_check && !(get_blood_id() in list(/datum/reagent/blood, /datum/reagent/toxin/acid)))
		return

	if(!splatter_turf)
		splatter_turf = get_turf(src)
	if(isclosedturf(splatter_turf) || (isgroundlessturf(splatter_turf) && !GET_TURF_BELOW(splatter_turf)))
		return

	var/list/temp_blood_DNA
	if(small_drip)
		// Only a certain number of drips (or one large splatter) can be on a given turf.
		var/obj/effect/decal/cleanable/blood/drip/drop = locate() in splatter_turf
		if(drop)
			if(drop.drips < 5)
				drop.drips++
				drop.add_overlay(pick(drop.random_icon_states))
				drop.add_mob_blood(src)
				return
			else
				temp_blood_DNA = GET_ATOM_BLOOD_DNA(drop) //we transfer the dna from the drip to the splatter
				qdel(drop)//the drip is replaced by a bigger splatter
		else
			// NOVA EDIT ADDITION START
			if(get_blood_id() == /datum/reagent/toxin/acid)
				drop = new /obj/effect/decal/cleanable/blood/drip/xenoblood(splatter_turf, get_static_viruses())
			else
				drop = new(splatter_turf, get_static_viruses())
			// NOVA EDIT ADDITION END
			//drop = new(splatter_turf, get_static_viruses()) // NOVA EDIT REMOVAL
			drop.add_mob_blood(src)
			return

	// Find a blood decal or create a new one.
	var/obj/effect/decal/cleanable/blood/blood_spew = locate() in splatter_turf
	if(!blood_spew)
		// NOVA EDIT ADDITION START
		if(get_blood_id() == /datum/reagent/toxin/acid)
			blood_spew = new /obj/effect/decal/cleanable/xenoblood/xsplatter(splatter_turf, get_static_viruses())
		else
			blood_spew = new /obj/effect/decal/cleanable/blood/splatter(splatter_turf, get_static_viruses())
		// NOVA EDIT ADDITION END
		//blood_spew = new /obj/effect/decal/cleanable/blood/splatter(splatter_turf, get_static_viruses()) // NOVA EDIT REMOVAL
	if(QDELETED(blood_spew)) //Give it up
		return
	blood_spew.bloodiness = min((blood_spew.bloodiness + BLOOD_AMOUNT_PER_DECAL), BLOOD_POOL_MAX)
	blood_spew.add_mob_blood(src) //give blood info to the blood decal.
	if(temp_blood_DNA)
		blood_spew.add_blood_DNA(temp_blood_DNA, no_visuals = small_drip)

/mob/living/carbon/human/add_splatter_floor(turf/splatter_turf, small_drip, skip_reagents_check = TRUE)
	if(!HAS_TRAIT(src, TRAIT_NOBLOOD) && !dna?.blood_type.no_bleed_overlays)
		. = ..()

/mob/living/carbon/alien/add_splatter_floor(turf/splatter_turf, small_drip, skip_reagents_check)
	if(!splatter_turf)
		splatter_turf = get_turf(src)
	var/obj/effect/decal/cleanable/xenoblood/xeno_blood_splatter = locate() in splatter_turf.contents
	if(!xeno_blood_splatter)
		xeno_blood_splatter = new(splatter_turf)
	xeno_blood_splatter.add_blood_DNA(list("UNKNOWN DNA" = BLOOD_TYPE_XENO))

/mob/living/silicon/robot/add_splatter_floor(turf/splatter_turf, small_drip, skip_reagents_check)
	if(!splatter_turf)
		splatter_turf = get_turf(src)
	var/obj/effect/decal/cleanable/oil/oil_splatter = locate() in splatter_turf.contents
	if(!oil_splatter)
		oil_splatter = new(splatter_turf)

/mob/living/proc/get_blood_alcohol_content()
	var/blood_alcohol_content = 0
	var/datum/status_effect/inebriated/inebriation = has_status_effect(/datum/status_effect/inebriated)
	if(!isnull(inebriation))
		blood_alcohol_content = round(inebriation.drunk_value * DRUNK_POWER_TO_BLOOD_ALCOHOL, 0.01)

	return blood_alcohol_content

#undef BLOOD_DRIP_RATE_MOD
#undef DRUNK_POWER_TO_BLOOD_ALCOHOL
