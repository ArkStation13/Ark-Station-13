// Mech Beacon
/obj/item/choice_beacon/inteq_mech
	name = "InteQ mech beacon"
	desc = "To summon your own steel titan."

/obj/item/choice_beacon/inteq_mech/generate_display_names()
	var/static/list/ert_mech_list = list("Hermes" = /obj/vehicle/sealed/mecha/gygax/dark/hermes,
		"Ares" = /obj/vehicle/sealed/mecha/marauder/mauler/ares)
	if(!ert_mech_list)
		ert_mech_list = list()
		var/list/templist = typesof(/obj/item/storage/box/hero)
		for(var/V in templist)
			var/atom/A = V
			ert_mech_list[initial(A.name)] = A
	return ert_mech_list

/// Наушники
/obj/item/radio/headset/inteq
	name = "Inteq Headset"
	desc = "A brown headset, used by InteQ members."
	icon_state = "inteq_headset"
	worn_icon_state = "syndie_headset"
	icon = 'zov_modular_arkstation/modules/faction-inteq/icons/ear_obj.dmi'
	radiosound = 'zov_modular_arkstation/modules/sounds-renewal/sound/radio.ogg'
	freerange = FALSE
	freqlock = TRUE
	keyslot = new /obj/item/encryptionkey/headset_syndicate/inteq
	keyslot2 = new /obj/item/encryptionkey/headset_com

/obj/item/radio/headset/inteq/command
	name = "InteQ Command Headset"
	desc = "A commanding headset to gather your underlings."
	command = TRUE

/obj/item/radio/headset/inteq/bowman
	name = "InteQ Bowman Headset"
	desc = "A brown advanced headset, used by InteQ combatants. Protects your ears from flashbangs."
	icon_state = "inteq_headset_alt"

/obj/item/radio/headset/inteq/bowman/command
	name = "InteQ Bowman Command Headset"
	desc = "A brown advanced headset, used by InteQ combatants. Protects your ears from flashbangs. Helps your to command your men."
	command = TRUE


/obj/item/radio/headset/inteq/bowman/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(ITEM_SLOT_EARS))

/obj/item/encryptionkey/headset_syndicate/inteq
	name = "InteQ Encryption Key"
	channels = list(RADIO_CHANNEL_SYNDICATE = 1)
	icon_state = "inteq_cypherkey"
	icon = 'zov_modular_arkstation/modules/faction-inteq/icons/key.dmi'
	independent = TRUE
