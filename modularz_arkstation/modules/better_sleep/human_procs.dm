// Переменные, нужные для работы этой хрени.
/mob/living/carbon/human
	/// Уникальный айди таймера для засыпания, запускается если глаза закрыты и ты лежишь.
	var/time_to_sleep
	/// Открыты ли наши глаза?
	var/is_eyes_open = TRUE

// Глаза открыты? Закрываем. И наоборот.
/mob/living/carbon/human/proc/close_or_open_eyes()
	if(is_eyes_open == FALSE)
		open_eyes()
	else
		close_eyes()

// Пытаемся открыть глаза.
/mob/living/carbon/human/proc/open_eyes()
	if(time_to_sleep)
		deltimer(time_to_sleep)
	is_eyes_open = TRUE
	if(IsSleeping())
		if(prob(1))
			to_chat(src, span_warning("wake up wake up wake up wake up wake up wake up wake up wake up"))
		else
			to_chat(src, span_warning("You are trying to wake up!"))
		SetSleeping(6 SECONDS)
	clear_fullscreen("closed_eyes", animated = 4 SECONDS)
	REMOVE_TRAIT(src, TRAIT_NOFLASH, ACTION_TRAIT)

// Пытаемся закрыть глаза.
/mob/living/carbon/human/proc/close_eyes()
	if(IsSleeping())
		return
	is_eyes_open = FALSE
	overlay_fullscreen("closed_eyes", /atom/movable/screen/fullscreen/flash/black)
	ADD_TRAIT(src, TRAIT_NOFLASH, ACTION_TRAIT)

// Проверка выполняется в процессинге жизни /mob/living/carbon/human/Life().
/mob/living/carbon/human/proc/try_to_sleep()
	if(is_eyes_open == FALSE)
		if(body_position == LYING_DOWN || buckled)
			if(IsSleeping())
				return
			time_to_sleep = addtimer(CALLBACK(src, PROC_REF(PermaSleeping)), 6 SECONDS, TIMER_UNIQUE | TIMER_STOPPABLE | TIMER_DELETE_ME)
		else
			if(time_to_sleep)
				deltimer(time_to_sleep)

/mob/living/carbon/human/proc/eyes_blink()
	close_eyes()
	sleep(1 SECONDS)
	open_eyes()

/// Прок пермасна (Вырезан на оффах)
/mob/living/proc/PermaSleeping()
	if(SEND_SIGNAL(src, COMSIG_LIVING_STATUS_SLEEP, -1) & COMPONENT_NO_STUN)
		return
	if(HAS_TRAIT(src, TRAIT_GODMODE))
		return
	var/datum/status_effect/incapacitating/sleeping/S = IsSleeping()
	if(S)
		S.duration = -1
	else
		S = apply_status_effect(/datum/status_effect/incapacitating/sleeping, -1)
	return S
