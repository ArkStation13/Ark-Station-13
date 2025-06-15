// calculate max health from body size and height
/datum/dna/update_body_size(force_reapply = FALSE)
	..()
	if(ishuman(holder))
		var/mob/living/carbon/human/hum_hold = holder
		var/hght = hum_hold.mob_height
		holder.maxHealth = round((current_body_size + ((hght - HUMAN_HEIGHT_MEDIUM)/100)) * MAX_LIVING_HEALTH, 1)
