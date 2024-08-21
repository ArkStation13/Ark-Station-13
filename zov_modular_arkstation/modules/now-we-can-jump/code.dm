#define JUMP_MESSAGE_NOSE "broke his nose"
#define JUMP_MESSAGE_HIT "hit self slightly"

/atom/proc/try_jump(atom/target, mob/living/carbon/human/user)
	if(!isliving(user) || !ishuman(user) || !user.has_gravity() || !user.Adjacent(user) || !(user.stat == CONSCIOUS) || user.body_position == LYING_DOWN || user.buckled) // ТЫ ЕБЛАН?
		return

	var/jump_message = prob(40) ? JUMP_MESSAGE_NOSE : JUMP_MESSAGE_HIT

	if(QDELETED(src) || QDELETED(user)) // ТЫ НЕ СУЩЕСТВУЕШЬ, ЕБЛИЩЕ.
		return

	for(var/obj/item/bodypart/leg/missing_limb as anything in user.get_missing_limbs())
		if(missing_limb in GLOB.leg_zones) // Проверка на ноги. Нехуй прыгать инвалидам.
			to_chat(user, span_notice("I have no legs!"))
			user.emote("cry") // НУ ЗАПЛАЧЬ.
			return

	if(prob(0.01))
		user.emote("agony")
		user.overlay_fullscreen("flash_void", /atom/movable/screen/fullscreen/flash/black)
		sleep(6 SECONDS)
		user.clear_fullscreen("flash_void", rand(15, 60))
		return

	if(user.legcuffed)
		if(user.handcuffed)
			user.visible_message(span_alert("[user] tried to jump with [user.p_their()] hands and feet tied, which is why [user.p_they()] fell and [jump_message]."))
			if(jump_message == JUMP_MESSAGE_NOSE)
				user.adjustStaminaLoss(30)
				user.Paralyze(30)
				user.adjustBruteLoss(30)
				user.AdjustUnconscious(10 SECONDS)
				user.emote("scream")
				user.overlay_fullscreen("flash_void", /atom/movable/screen/fullscreen/flash/black)
				sleep(6 SECONDS)
				user.clear_fullscreen("flash_void", rand(15, 60))
				return
			else
				user.adjustStaminaLoss(20)
				user.adjustBruteLoss(10)
				user.Paralyze(10)
				return
		user.visible_message(span_alert("[user] tried to jump with [user.p_their()] feet tied."))
		user.adjustStaminaLoss(20)
		user.Paralyze(10)
		return

	if(user.staminaloss >= 60) // ПРЕДУПРЕЖДАЕМ ЧТО НЕКСТ ПРЫЖОК 100% БУДЕТ ЛЕЖАЧИМ.
		to_chat(user, span_warning("My legs are really starting to hurt..."))

	if(user.staminaloss >= 90) // ПЕРЕПРЫГАЛ? ПОЛУЧАЙ НАХУЙ ИНСУЛЬТ.
		to_chat(user, span_notice("Tired muscles are unable to lift your carcass into the air and you fall to the floor."))
		user.Paralyze(15)
		user.adjustStaminaLoss(10)

	if(!HAS_TRAIT(user, TRAIT_MIMING))
		playsound(user, user.gender == MALE ? 'zov_modular_arkstation/modules/now-we-can-jump/jump_male.ogg' : 'zov_modular_arkstation/modules/now-we-can-jump/jump_female.ogg', 25, 0, 1)
	user.visible_message("<span class='danger'>[user] jumps.</span>", \
					"<span class='warning'> I jump at the [loc]!</span>")
	if(HAS_TRAIT(user, TRAIT_JUMPER))
		user.adjustStaminaLoss(10)
	else
		user.adjustStaminaLoss(rand(30,50))
	user.throw_at(target, 3, 1, user, spin = (HAS_TRAIT(user, TRAIT_CLUMSY) ? TRUE : FALSE))

#undef JUMP_MESSAGE_NOSE
#undef JUMP_MESSAGE_HIT
