/atom/proc/try_jump(atom/target, mob/living/carbon/human/user)
	if(!isliving(user) || !ishuman(user) || !user.has_gravity() || !user.Adjacent(user) || !(user.stat == CONSCIOUS) || user.body_position == LYING_DOWN || user.buckled) // ТЫ ЕБЛАН?
		return

	var/message_suka = prob(10) ? "broke his nose" : "hit himself slightly"

	if(QDELETED(src) || QDELETED(user)) // ТЫ НЕ СУЩЕСТВУЕШЬ, ЕБЛИЩЕ.
		return

	for(var/obj/item/bodypart/leg/missing_limb as anything in user.get_missing_limbs())
		if(missing_limb == BODY_ZONE_L_LEG || BODY_ZONE_R_LEG) // Проверка на ноги. Нехуй прыгать инвалидам.
			to_chat(user, span_notice("I have no legs!"))
			user.say("*cry") // НУ ЗАПЛАЧЬ.
			return

	if(user.legcuffed)
		if(user.handcuffed)
			user.visible_message(span_alert("[user] tried to jump with his hands and feet tied, which is why he fell and [message_suka]."))
			if(message_suka == "broke his nose")
				user.adjustStaminaLoss(30)
				user.Paralyze(30)
				user.adjustBruteLoss(30)
				user.AdjustUnconscious(5 SECONDS)
				INVOKE_ASYNC(user, TYPE_PROC_REF(/mob, emote), "scream")
				user.overlay_fullscreen("flash_void", /atom/movable/screen/fullscreen/flash/black)
				sleep(6 SECONDS)
				user.clear_fullscreen("flash_void", rand(15, 60))
				return
			user.adjustStaminaLoss(20)
			user.adjustBruteLoss(10)
			user.Paralyze(10)
			return
		user.visible_message(span_alert("[user] tried to jump with his feet tied."))
		user.adjustStaminaLoss(20)
		user.Paralyze(10)
		return

	if(user.staminaloss >= 90) // ПЕРЕПРЫГАЛ? ПОЛУЧАЙ НАХУЙ ИНСУЛЬТ.
		to_chat(user, span_notice("Tired muscles are unable to lift your carcass into the air and you fall to the floor."))
		user.Paralyze(15)
		user.adjustStaminaLoss(10)

	if(user.staminaloss >= 60) // ПРЕДУПРЕЖДАЕМ ЧТО НЕКСТ ПРЫЖОК 100% БУДЕТ ЛЕЖАЧИМ.
		to_chat(user, span_warning("My legs are really starting to hurt..."))

	if(!HAS_TRAIT(user, TRAIT_MIMING))
		playsound(user, user.gender == MALE ? 'zov_modular_arkstation/modules/now-we-can-jump/jump_male.ogg' : 'zov_modular_arkstation/modules/now-we-can-jump/jump_female.ogg', 25, 0, 1)
	user.visible_message("<span class='danger'>[user] jumps.</span>", \
					"<span class='warning'> I jump at the [loc]!</span>")
	if(HAS_TRAIT(user, TRAIT_JUMPER))
		user.adjustStaminaLoss(10)
	else
		user.adjustStaminaLoss(rand(30,50))
	user.throw_at(target, 3, 1, user, spin = (HAS_TRAIT(user, TRAIT_CLUMSY) ? TRUE : FALSE))
