/datum/quirk/tough
	name = "Toughness"
	desc = "Your abnormally strong body can withstand 20% more damage."
	icon = FA_ICON_HEART_CIRCLE_PLUS
	value = 6
	mob_trait = TRAIT_TOUGHNESS
	medical_record_text = "The patient demonstrated an abnormally high resistance to injury."
	gain_text = span_notice("You feel strength in your muscles.")
	lose_text = span_danger("You feel less strong.")

/datum/quirk/tough/add()
	apply()
	RegisterSignal(quirk_holder, COMSIG_HUMAN_PREFS_APPLIED, PROC_REF(apply))

/datum/quirk/tough/proc/apply()
	SIGNAL_HANDLER
	quirk_holder.maxHealth = round(quirk_holder.maxHealth * 1.20, 1)

/datum/quirk/tough/remove()
	if(!quirk_holder)
		return
	quirk_holder.maxHealth = round(quirk_holder.maxHealth * 0.833, 1)
	UnregisterSignal(quirk_holder, COMSIG_HUMAN_PREFS_APPLIED)
