/datum/emote/living/ruffle
	key = "ruffle"
	key_third_person = "ruffles"
	message = "ruffles their wings for a moment."

/datum/emote/living/ruffle/run_emote(mob/user, params, type_override, intentional)
	message = "ruffles [user.p_their()] wings for a moment."
	. = ..()

/datum/emote/living/mew
	key = "mew"
	key_third_person = "mews"
	message = "mews hysterically!"
	message_mime = "makes a cat face!"
	sound = 'modularz_arkstation/_master_files/sound/voice/meow_meme.ogg'
	cooldown = 1 SECONDS
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/speen
	key = "speen"
	key_third_person ="speens"
	message = "speeeeens!"
	message_mime = "speeeeens silently!"
	sound = 'modularz_arkstation/_master_files/sound/voice/speen.ogg'
	hands_use_check = TRUE

/datum/emote/living/speen/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	user.spin(20, 1)

/datum/emote/living/speen/check_cooldown(mob/user, intentional)
	. = ..()
	if(.)
		return
	if(!can_run_emote(user, intentional=intentional))
		return
	if(!iscarbon(user))
		return

/datum/emote/living/chitter2
	key = "chitter2"
	key_third_person = "chitters2"
	message = "chitters."
	message_mime = "chitters silently!"
	sound = 'modularz_arkstation/_master_files/sound/voice/moth/mothchitter2.ogg'
	cooldown = 0.3 SECONDS
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/eyebrow2
	key = "eyebrow2"
	key_third_person = "eyebrows2"
	message = "<b>raises an eyebrow.</b>"
	message_mime = "<b>raises an eyebrow with quaking force!</b>"
	sound = 'modularz_arkstation/_master_files/sound/voice/vineboom.ogg'
	cooldown = 2.9 SECONDS
	emote_type = EMOTE_VISIBLE

/datum/emote/living/blink3
	key = "blink3"
	key_third_person = "blinks3"
	message = "blinks."
	message_mime = "blinks expressively."
	sound = 'modularz_arkstation/_master_files/sound/voice/blink.ogg'
	cooldown = 0.25 SECONDS
	emote_type = EMOTE_VISIBLE

/datum/emote/living/laugh2
	key = "laugh2"
	key_third_person = "laughs2"
	message = "laughs like a king."
	message_mime = "acts out laughing like a king."
	sound = 'modularz_arkstation/_master_files/sound/voice/laugh_king.ogg'
	// No cooldown var required
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/laugh3
	key = "laugh3"
	key_third_person = "laughs3"
	message = "laughs silly."
	message_mime = "acts out laughing silly."
	sound = 'modularz_arkstation/_master_files/sound/voice/lol.ogg'
	cooldown = 6.1 SECONDS
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/laugh4
	key = "laugh4"
	key_third_person = "laughs4"
	message = "burst into laughter!"
	message_mime = "acts out bursting into laughter."
	sound = 'modularz_arkstation/_master_files/sound/voice/laugh_muta.ogg'
	cooldown = 3 SECONDS
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/laugh5
	key = "laugh5"
	key_third_person = "laughs5"
	message = "laughs in Scottish."
	message_mime = "acts out laughing in Scottish."
	sound = 'modularz_arkstation/_master_files/sound/voice/laugh_deman.ogg'
	cooldown = 2.75 SECONDS
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/laugh6
	key = "laugh6"
	key_third_person = "laughs6"
	message = "laughs like a kettle!"
	message_mime = "acts out laughing like a kettle."
	sound = 'modularz_arkstation/_master_files/sound/voice/laugh6.ogg'
	cooldown = 4.45 SECONDS
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/cry2
	key = "cry2"
	key_third_person = "cries2"
	message = "cries like a king."
	message_mime = "acts out crying like a king."
	sound = 'modularz_arkstation/_master_files/sound/voice/cry_king.ogg'
	cooldown = 1.6 SECONDS // Uses longest sound's time
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/cry2/get_sound(mob/living/user)
	. = ..()
	return pick('modularz_arkstation/_master_files/sound/voice/cry_king.ogg', 'modularz_arkstation/_master_files/sound/voice/cry_king2.ogg')


/datum/emote/living/wtune
	key = "whistletune"
	key_third_person = "whistletunes"
	message = "whistles a tune."
	message_mime = "makes an expression as if whistling."
	sound = 'modularz_arkstation/_master_files/sound/voice/wtune1.ogg'
	cooldown = 4.55 SECONDS // Uses longest sound's time.
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/wtune/get_sound(mob/living/user)
	. = ..()
	return pick('modularz_arkstation/_master_files/sound/voice/wtune1.ogg', 'modularz_arkstation/_master_files/sound/voice/wtune2.ogg')

/datum/emote/living/fiufiu
	key = "wolfwhistle"
	key_third_person = "wolfwhistles"
	message = "wolf-whistles!" // i am not creative
	message_param = "audibly approves %t's appearance."
	message_mime = "makes an expression as if <i>inappropriately</i> whistling."
	sound = 'modularz_arkstation/_master_files/sound/voice/wolfwhistle.ogg'
	cooldown = 0.78 SECONDS
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/weh2
	key = "weh2"
	key_third_person = "wehs2"
	message = "let out a weh!"
	message_mime = "acts out a weh!"
	sound = 'modularz_arkstation/_master_files/sound/voice/weh2.ogg'
	cooldown = 0.25 SECONDS
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/weh3
	key = "weh3"
	key_third_person = "wehs3"
	message = "let out a weh!"
	message_mime = "acts out a weh!"
	sound = 'modularz_arkstation/_master_files/sound/voice/weh3.ogg'
	cooldown = 0.25 SECONDS
	emote_type = EMOTE_AUDIBLE


/datum/emote/living/weh4
	key = "weh4"
	key_third_person = "wehs4"
	message = "let out a surprised weh!"
	message_mime = "acts out a surprised weh!"
	sound = 'modularz_arkstation/_master_files/sound/voice/weh_s.ogg'
	cooldown = 0.35 SECONDS
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/bark2
	key = "bark2"
	key_third_person = "barks2"
	message = "barks!"
	message_mime = "acts out a bark!"
	sound = 'modularz_arkstation/_master_files/sound/voice/bark_alt.ogg'
	cooldown = 0.35 SECONDS
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/woof/alt
	key = "woof2"
	key_third_person = "woofs2"
	sound = 'modularz_arkstation/_master_files/sound/voice/woof2.ogg'
	cooldown = 0.3 SECONDS
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/coyhowl
	key = "coyhowl"
	key_third_person = "coyhowls"
	message = "howls like coyote!"
	message_mime = "acts out a coyote's howl!"
	sound = 'modularz_arkstation/_master_files/sound/voice/coyotehowl.ogg'
	cooldown = 2.94 SECONDS // Uses longest sound's time
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/coyhowl/get_sound(mob/living/user)
	. = ..()
	return pick('modularz_arkstation/_master_files/sound/voice/coyotehowl.ogg', 'modularz_arkstation/_master_files/sound/voice/coyotehowl2.ogg', 'modularz_arkstation/_master_files/sound/voice/coyotehowl3.ogg', 'modularz_arkstation/_master_files/sound/voice/coyotehowl4.ogg', 'modularz_arkstation/_master_files/sound/voice/coyotehowl5.ogg')

/datum/emote/living/mlem
	key = "mlem"
	key_third_person = "mlems"
	message = "sticks their tongue for a moment. Mlem!"
	emote_type = EMOTE_VISIBLE

/datum/emote/living/snore/snore2
	key = "snore2"
	key_third_person = "snores2"
	message = "lets out an <b>earthshaking</b> snore"
	message_mime = "lets out an <b>inaudible</b> snore!"
	sound = 'modularz_arkstation/_master_files/sound/voice/aauugghh1.ogg'
	cooldown = 2.1 SECONDS
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/snore/snore2/run_emote(mob/user, params)
	var/datum/dna/D = user.has_dna()
	var/say_mod = (D ? D.species.say_mod : "says")
	var/list/aaauughh = list(
		"lets out an <b>earthshaking</b> snore.",
		"lets out what sounds like a <b>painful</b> snore.",
		"[say_mod], <b>\"AAAAAAUUUUUUGGGHHHHH!!!\"</b>"
	)
	message = pick(aaauughh)

	// Set random emote sound
	sound = pick('modularz_arkstation/_master_files/sound/voice/aauugghh1.ogg', 'modularz_arkstation/_master_files/sound/voice/aauugghh2.ogg')

	// Return normally
	. = ..()


/datum/emote/living/pant
	key = "pant"
	key_third_person = "pants"
	message = "pants!"

/datum/emote/living/pant/run_emote(mob/user, params, type_override, intentional)
	var/list/pants = list(
				"pants!",
		"pants like a dog.",
		"lets out soft pants.",
		"pulls [user.p_their()] tongue out, panting."
	)
	message = pick(pants)
	. = ..()

/datum/emote/living/yippee
	key = "yippee"
	key_third_person = "yippees"
	message = "lets out a yippee!"
	message_mime = "acts out a yippee!"
	sound = 'modularz_arkstation/_master_files/sound/voice/yippee.ogg'
	cooldown = 1.2 SECONDS

/datum/emote/living/mewo
	key = "mewo"
	key_third_person = "mewos"
	message = "mewos!"
	message_mime = "mewos silently!"
	sound = 'modularz_arkstation/_master_files/sound/voice/mewo.ogg'
	cooldown = 0.7 SECONDS

/datum/emote/living/ara_ara
	key = "ara"
	key_third_person = "aras"
	message = "coos with sultry surprise~..."
	message_mime = "exudes a sultry aura~"
	sound = 'modularz_arkstation/_master_files/sound/voice/ara-ara.ogg'
	cooldown = 1.25 SECONDS

/datum/emote/living/ara_ara/alt
	key = "ara2"
	sound = 'modularz_arkstation/_master_files/sound/voice/ara-ara2.ogg'
	cooldown = 1.25 SECONDS

/datum/emote/living/facemetacarpus
	key = "facehand"
	key_third_person = "facepalms"
	message = "creates an error in the code."
	//muzzle_ignore = TRUE
	//restraint_check = TRUE
	sound = 'modularz_arkstation/_master_files/sound/effects/slap.ogg'
	var/metacarpus_type = "palm"
	cooldown = 0.25 SECONDS

/datum/emote/living/facemetacarpus/run_emote(mob/user, params, type_override, intentional)
	message = pick(list(
		"places [usr.p_their()] [metacarpus_type] across [usr.p_their()] face.",
			"lowers [usr.p_their()] face into [usr.p_their()] [metacarpus_type].",
			"face[metacarpus_type]s",
	))
	. = ..()

/datum/emote/living/facemetacarpus/paw
	key = "facepaw"
	key_third_person = "facepaws"
	metacarpus_type = "paw"

/datum/emote/living/facemetacarpus/claw
	key = "faceclaw"
	key_third_person = "faceclaws"
	metacarpus_type = "claw"

/datum/emote/living/facemetacarpus/wing
	key = "facewing"
	key_third_person = "facewings"
	metacarpus_type = "wing"

/datum/emote/living/facemetacarpus/hoof
	key = "facehoof"
	key_third_person = "facehoofs"
	metacarpus_type = "hoof"

/datum/emote/living/merowr
	key = "merowr"
	key_third_person = "merowrs"
	message = "merowrs!"
	message_mime = "acts out a merowr!"
	sound = 'modularz_arkstation/_master_files/sound/voice/merowr.ogg'
	cooldown = 1.2 SECONDS

/datum/emote/living/yooo
	key = "yooo"
	key_third_person = "yooos"
	message = "thinks they are part of Kabuki play."
	sound = 'modularz_arkstation/_master_files/sound/voice/yooo.ogg'
	cooldown = 2.54 SECONDS

/datum/emote/living/meow2/get_sound(mob/living/user)
	. = ..()
	return  pick('modularz_arkstation/_master_files/sound/voice/catpeople/cat_meow1.ogg', 'modularz_arkstation/_master_files/sound/voice/catpeople/cat_meow2.ogg', 'modularz_arkstation/_master_files/sound/voice/catpeople/cat_meow3.ogg')


/datum/emote/living/meow2
	key = "meow2"
	key_third_person = "meows"
	message = "meows!"
	sound = 'modularz_arkstation/_master_files/sound/voice/catpeople/cat_meow1.ogg'
	cooldowns = 0.8 SECONDS
	vary = FALSE

/datum/emote/living/meow2/get_sound(mob/living/user)
	. = ..()
	return pick('modularz_arkstation/_master_files/sound/voice/catpeople/cat_mew1.ogg', 'modularz_arkstation/_master_files/sound/voice/catpeople/cat_mew2.ogg')

/datum/emote/living/meow3
	key = "meow3"
	key_third_person = "mews!"
	message = "mews!"
	sound = 'modularz_arkstation/_master_files/sound/voice/catpeople/cat_mew1.ogg'
	cooldowns = 0.8 SECONDS
	vary = FALSE

/datum/emote/living/mrrp
	key = "mrrp"
	key_third_person = "mrrps"
	message = "trills like a cat!"
	sound = 'modularz_arkstation/_master_files/sound/voice/catpeople/cat_mrrp1.ogg'
	cooldowns = 0.8 SECONDS
	vary = FALSE

/datum/emote/living/mrrp2
	key = "mrrp2"
	key_third_person = "mrrps"
	message = "trills like a cat!"
	sound = 'modularz_arkstation/_master_files/sound/voice/catpeople/cat_mrrp2.ogg'
	cooldowns = 0.8 SECONDS
	vary = FALSE
