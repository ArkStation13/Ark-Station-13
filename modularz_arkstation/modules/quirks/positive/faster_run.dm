/*/datum/quirk/fastrun
	name = "Fast Runner"
	desc = "You've dedicated your life to running, or you've been lucky enough to be born fast and agile. Your running speed increases slightly."
	icon = FA_ICON_FAST_FORWARD
	value = 4
	mob_trait = TRAIT_FAST_RUNNER
	gain_text = span_notice("You feel a surge of strength in your legs.")
	lose_text = span_danger("You felt a slight cramp in your leg.")
	medical_record_text = "The patient passed the standards for speed running excellently."
	mail_goodies = list(/obj/item/reagent_containers/cup/soda_cans/grey_bull)

/datum/quirk/fastrun/add(client/client_source)
	if(isdummy(quirk_holder))
		return
	refresh_quirk_holder_frunner()

/datum/quirk/fastrun/remove()
	refresh_quirk_holder_frunner()

/datum/status_effect/fast_runner
	id = "fast_runner"
	alert_type = null

/datum/quirk/fastrun/proc/refresh_quirk_holder_frunner()
	if(quirk_holder.has_status_effect(/datum/status_effect/fast_runner))
		quirk_holder.remove_status_effect(/datum/status_effect/fast_runner)
		return
	quirk_holder.apply_status_effect(/datum/status_effect/fast_runner)

/datum/movespeed_modifier/status_effect/fast_runner
	multiplicative_slowdown = -0.3

/datum/status_effect/fast_runner/on_apply()
	var/mob/living/carbon/owner_mob = owner
	owner_mob.add_movespeed_modifier(/datum/movespeed_modifier/status_effect/fast_runner)
	return TRUE

/datum/status_effect/fast_runner/on_remove()
	var/mob/living/carbon/owner_mob = owner
	owner_mob.remove_movespeed_modifier(/datum/movespeed_modifier/status_effect/fast_runner) */ // Временно вырезано.
