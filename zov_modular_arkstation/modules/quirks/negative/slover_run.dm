/datum/quirk/slowrun
	name = "Slow Runner"
	desc = "You could never keep up with your peers. Your running speed is slightly slower."
	icon = FA_ICON_FAST_BACKWARD
	value = -4
	mob_trait = TRAIT_SLOW_RUNNER
	gain_text = span_notice("You felt a slight cramp in your leg.")
	lose_text = span_danger("You feel a surge of strength in your legs.")
	medical_record_text = "The patient has problems with running."
	mail_goodies = list(/obj/item/reagent_containers/cup/soda_cans/grey_bull)

/datum/quirk/slowrun/add(client/client_source)
	if(isdummy(quirk_holder))
		return
	refresh_quirk_holder_srunner()

/datum/quirk/slowrun/remove()
	refresh_quirk_holder_srunner()

/datum/status_effect/slow_runner
	id = "slow_runner"
	alert_type = null

/datum/quirk/slowrun/proc/refresh_quirk_holder_srunner()
	if(quirk_holder.has_status_effect(/datum/status_effect/slow_runner))
		quirk_holder.remove_status_effect(/datum/status_effect/slow_runner)
		return
	quirk_holder.apply_status_effect(/datum/status_effect/slow_runner)

/datum/movespeed_modifier/status_effect/slow_runner
	multiplicative_slowdown = 1.5

/datum/status_effect/slow_runner/on_apply()
	var/mob/living/carbon/owner_mob = owner
	owner_mob.add_movespeed_modifier(/datum/movespeed_modifier/status_effect/slow_runner)
	return TRUE

/datum/status_effect/slow_runner/on_remove()
	var/mob/living/carbon/owner_mob = owner
	owner_mob.remove_movespeed_modifier(/datum/movespeed_modifier/status_effect/slow_runner)
