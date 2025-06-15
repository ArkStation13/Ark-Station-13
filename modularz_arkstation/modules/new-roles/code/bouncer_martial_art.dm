#define MARTIALART_BOUNCER "bouncer martial art"

/datum/martial_art/bouncer
	name = "Bouncer martial art"
	id = MARTIALART_BOUNCER

	var/datum/action/bounce/bounce

/datum/martial_art/bouncer/New(datum/new_origin)
	. = ..()
	bounce = new(src)

/datum/martial_art/bouncer/proc/check_streak(mob/living/carbon/human/A, mob/living/carbon/human/D)
	if(!can_use(A, D))
		return FALSE
	switch(streak)
		if("do_bounce")
			streak = ""
			do_bounce(A,D)
			return TRUE
	return FALSE

/datum/martial_art/bouncer/activate_style(mob/living/new_holder)
	. = ..()
	bounce.Grant(new_holder)

/datum/martial_art/bouncer/deactivate_style(mob/living/remove_from)
	. = ..()
	bounce.Remove(remove_from)

/datum/action/bounce
	name = "Bounce"
	button_icon = 'icons/mob/actions/actions_items.dmi'
	button_icon_state = "legsweep"

/datum/action/bounce/Trigger(trigger_flags)
	if(owner.incapacitated)
		to_chat(owner, "<span class='warning'>You can't bounce while you're incapacitated.</span>")
		return
	var/datum/martial_art/source = target
	if (source.streak == "do_bounce")
		owner.visible_message("<span class='danger'>[owner] assumes a neutral stance.</span>", "<b><i>Your next attack is cleared.</i></b>")
		source.streak = ""
	else
		if(HAS_TRAIT(owner, TRAIT_PACIFISM))
			to_chat(owner, "<span class='warning'>You don't want to harm other people!</span>")
			return
		owner.visible_message("<span class='danger'>[owner] assumes the Bouncer stance!</span>", "<b><i>Your next attack will be a Bounce.</i></b>")
		source.streak = "do_bounce"

/datum/martial_art/bouncer/proc/do_bounce(mob/living/carbon/human/A, mob/living/carbon/human/D)
	A.do_attack_animation(D, ATTACK_EFFECT_KICK)
	D.visible_message("<span class='warning'>[A] kicks [D] square in the chest, sending them flying!</span>", \
					"<span class='userdanger'>You are kicked square in the chest by [A], sending you flying!</span>", "<span class='hear'>You hear a sickening sound of flesh hitting flesh!</span>", COMBAT_MESSAGE_RANGE, A)
	playsound(get_turf(A), 'sound/effects/hit_kick.ogg', 50, TRUE, -1)
	var/atom/throw_target = get_edge_target_turf(D, A.dir)
	D.throw_at(throw_target, 5, 9, A)
	D.apply_damage(5, BRUTE, BODY_ZONE_CHEST, wound_bonus = CANT_WOUND, wound_bonus = CANT_WOUND)
	log_combat(A, D, "bounced")
	return TRUE

/datum/martial_art/bouncer/harm_act(mob/living/carbon/human/A, mob/living/carbon/human/D)
	if(check_streak(A,D))
		return TRUE
	..()

/datum/outfit/job/bouncer/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE, client/preference_source)
	..()
	if(visualsOnly)
		return
	var/datum/martial_art/bouncer/B = new
	B.teach(H)
