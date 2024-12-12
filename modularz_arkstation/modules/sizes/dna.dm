// calculate max health from body size and height
/datum/dna/update_body_size()
	..()
	if(ishuman(holder))
		var/mob/living/carbon/human/hum_hold = holder
		var/hght = hum_hold.get_mob_height()
		holder.maxHealth = round((current_body_size + ((hght - HUMAN_HEIGHT_MEDIUM)/100)) * MAX_LIVING_HEALTH, 1)
