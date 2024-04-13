/datum/preference/toggle/gas_breath
	category = PREFERENCE_CATEGORY_GAME_PREFERENCES
	savefile_key = "gas_breath"
	savefile_identifier = PREFERENCE_PLAYER

/datum/preference/toggle/gas_breath/apply_to_client_updated(client/client, value)
	if(!value)
		client.mob.stop_sound_channel(CHANNEL_GASMASK)

/obj/item/clothing/mask/gas
	///Does this particular mask have breath noises
	var/breathy = TRUE
	///This covers most of the screen
	var/hearing_range = 5

/obj/item/clothing/mask/gas/signalis_gaiter
	breathy = FALSE

/obj/item/clothing/mask/gas/adjustmask(mob/living/carbon/user)
	. = ..()
	breathy = mask_adjusted ? FALSE : TRUE

/obj/item/clothing/mask/gas/equipped(mob/living/carbon/human/user, slot)
	. = ..()
	if(!breathy)
		return
	if(slot != ITEM_SLOT_MASK)
		STOP_PROCESSING(SSgasmask, src)
		return
	START_PROCESSING(SSgasmask, src)

/obj/item/clothing/mask/gas/dropped(mob/living/user)
	. = ..()
	STOP_PROCESSING(SSgasmask, src)

/obj/item/clothing/mask/gas/process(seconds_per_tick)
	// var/mob/living/carbon/user
	if(TIMER_COOLDOWN_RUNNING(src, COOLDOWN_GAS_BREATH))
		return
	// if(ismob(user))
	// 	if(!user.canon_client?.prefs?.read_preference(/datum/preference/toggle/gas_breath))
	// 		return
	playsound(src, SFX_GASBREATH, 20, TRUE, channel = CHANNEL_GASMASK)
	TIMER_COOLDOWN_START(src, COOLDOWN_GAS_BREATH, 10 SECONDS)
