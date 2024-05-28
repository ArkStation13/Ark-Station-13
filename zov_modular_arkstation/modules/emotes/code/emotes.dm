//Originaly made by Sasichkamega aka PowerOrb aka alexv-ds
/datum/emote/living/purr/run_emote(mob/user, params, type_override, intentional = FALSE)
	. = ..()
	if(. == FALSE)
		return
	if(!isfeline(user))
		return
	if(!user.loc)
		return
	var/list/damaged_purr_targets = list()
	//heal
	for(var/mob/living/carbon/purr_target in user.loc)
		if(purr_target == user || purr_target.stat == DEAD)
			continue
		var/list/damaged_bodyparts = purr_target.get_damaged_bodyparts(TRUE, TRUE, BODYTYPE_ORGANIC)
		if(!damaged_bodyparts.len)
			continue
		damaged_purr_targets.Add(purr_target)
		for(var/obj/item/bodypart/bodypart in damaged_bodyparts)
			if (bodypart.heal_damage(1/damaged_bodyparts.len, 1/damaged_bodyparts.len, TRUE, FALSE, BODYTYPE_ORGANIC))
				purr_target.update_damage_overlays()
	//print messages
	if (!damaged_purr_targets.len)
		return
	if (damaged_purr_targets.len == 1)
		user.show_message("<span class='infoplain'><span class='green'>You purr nearby [damaged_purr_targets[1]], slowly healing \his tissues.</span></span>", MSG_AUDIBLE)
	else
		user.show_message("<span class='infoplain'><span class='green'>You purr, slowly healing everyone nearby.</span></span>", MSG_AUDIBLE)
	for (var/mob/living/carbon/damaged_purr_target as anything in damaged_purr_targets)
		damaged_purr_target.show_message("<span class='infoplain'><span class='green'>[user] heals your tissues with their purr.</span></span>", MSG_AUDIBLE)
