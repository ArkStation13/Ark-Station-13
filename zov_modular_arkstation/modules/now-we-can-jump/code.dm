/atom/proc/try_jump(atom/target, mob/living/carbon/human/user)
	if(!isliving(user) || !user.has_gravity() || !user.Adjacent(user) || !(user.stat == CONSCIOUS) || user.body_position == LYING_DOWN || user.buckled) // ТЫ УМЕР.
		return

	if(QDELETED(src) || QDELETED(user)) // ТЫ НЕ СУЩЕСТВУЕШЬ, ЕБЛИЩЕ.
		return

	if(user.get_bodypart(list(!BODY_ZONE_L_LEG, !BODY_ZONE_R_LEG))) // Проверка на ноги. Нехуй прыгать инвалидам.
		to_chat(user, span_notice("I have no legs!"))
		user.say("*cry") // НУ ЗАПЛАЧЬ.
		return

	if(user.staminaloss >= 90) // ПЕРЕПРЫГАЛ? ПОЛУЧАЙ НАХУЙ ИНСУЛЬТ.
		to_chat(user, span_notice("Tired muscles are unable to lift your carcass into the air and you fall to the floor."))
		user.Paralyze(15)
		user.adjustStaminaLoss(10)

	if(user.staminaloss >= 60) // ПРЕДУПРЕЖДАЕМ ЧТО НЕКСТ ПРЫЖОК 100% БУДЕТ ЛЕЖАЧИМ.
		to_chat(user, span_warning("My legs are really starting to hurt..."))

	if(!HAS_TRAIT(user, TRAIT_MIMING))
		playsound(user, user.gender == MALE ? 'zov_modular_arkstation/modules/now-we-can-jump/jump_male.ogg' : 'zov_modular_arkstation/modules/now-we-can-jump/jump_female.ogg', 25, 0, 1)
	user.visible_message("<span class='danger'>[user.name] jumps.</span>", \
					"<span class='warning'> I jump at the [loc]!</span>")
	user.adjustStaminaLoss(rand(30,50))
	user.throw_at(target, 3, 1, user, spin = (HAS_TRAIT(user, TRAIT_CLUMSY) ? TRUE : FALSE))
