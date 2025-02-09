/datum/quirk/flimsy
	name = "Flimsy"
	desc = "Your body is weaker than most, your health is reduced by 20%."
	icon = FA_ICON_HEART_CIRCLE_MINUS
	value = -4
	mob_trait = TRAIT_FLIMSY
	medical_record_text = "The patient has extremely low resistance to injury."
	gain_text = span_notice("You feel like you could be knocked down with one blow.")
	lose_text = span_danger("You think yourself stronger.")

/datum/quirk/flimsy/add()
	apply()
	RegisterSignal(quirk_holder, COMSIG_HUMAN_PREFS_APPLIED, PROC_REF(apply))

/datum/quirk/flimsy/proc/apply()
	SIGNAL_HANDLER
	quirk_holder.maxHealth = round(quirk_holder.maxHealth * 0.8, 1)

/datum/quirk/flimsy/remove()
	if(!quirk_holder)
		return
	quirk_holder.maxHealth = round(quirk_holder.maxHealth * 1.25, 1)
	UnregisterSignal(quirk_holder, COMSIG_HUMAN_PREFS_APPLIED)
