/obj/machinery/rnd/production/techfab/department/medical
	stripe_color = "#389b38"

/obj/item/clothing/gloves/latex/nitrile
	greyscale_colors = "#4cc96b"

// JOBS

/datum/outfit/job/doctor
	name = "Medical Doctor"
	jobtype = /datum/job/doctor

	id_trim = /datum/id_trim/job/medical_doctor
	uniform = /obj/item/clothing/under/rank/medical/scrubs/green
	suit = /obj/item/clothing/suit/toggle/labcoat
	suit_store = /obj/item/flashlight/pen
	belt = /obj/item/modular_computer/pda/medical
	ears = /obj/item/radio/headset/headset_med/green
	head = /obj/item/clothing/head/utility/surgerycap/green
	shoes = /obj/item/clothing/shoes/sneakers/dark_green
	l_hand = /obj/item/storage/medkit/surgery

	backpack = /obj/item/storage/backpack/medic/green
	satchel = /obj/item/storage/backpack/satchel/med/green
	duffelbag = /obj/item/storage/backpack/duffelbag/med/green
	messenger = /obj/item/storage/backpack/messenger/med/green

	box = /obj/item/storage/box/survival/medical
	chameleon_extras = /obj/item/gun/syringe
	skillchips = list(/obj/item/skillchip/entrails_reader)

/datum/outfit/job/doctor/mod
	name = "Medical Doctor (MODsuit)"

	suit_store = /obj/item/tank/internals/oxygen
	back = /obj/item/mod/control/pre_equipped/medical
	suit = null
	head = null
	uniform = /obj/item/clothing/under/rank/medical/doctor/green
	mask = /obj/item/clothing/mask/breath/medical
	r_pocket = /obj/item/flashlight/pen
	internals_slot = ITEM_SLOT_SUITSTORE

/datum/outfit/mafia/md
	name = "Mafia Medical Doctor"

	uniform = /obj/item/clothing/under/rank/medical/scrubs/green
	shoes = /obj/item/clothing/shoes/sneakers/dark_green
	suit = /obj/item/clothing/suit/toggle/labcoat

/datum/outfit/job/paramedic
	name = "Paramedic"
	jobtype = /datum/job/paramedic

	id = /obj/item/card/id/advanced
	id_trim = /datum/id_trim/job/paramedic
	uniform = /obj/item/clothing/under/rank/medical/paramedic/green
	suit = /obj/item/clothing/suit/toggle/labcoat/paramedic/green
	suit_store = /obj/item/flashlight/pen/paramedic
	backpack_contents = list(
		/obj/item/emergency_bed = 1,
		)
	belt = /obj/item/storage/belt/medical/paramedic/green
	ears = /obj/item/radio/headset/headset_med/green
	head = /obj/item/clothing/head/soft/paramedic/green
	gloves = /obj/item/clothing/gloves/latex/nitrile
	shoes = /obj/item/clothing/shoes/sneakers/dark_green
	l_pocket = /obj/item/modular_computer/pda/medical/paramedic
	r_pocket = /obj/item/storage/box/bandages

	backpack = /obj/item/storage/backpack/medic/green
	satchel = /obj/item/storage/backpack/satchel/med/green
	duffelbag = /obj/item/storage/backpack/duffelbag/med/green
	messenger = /obj/item/storage/backpack/messenger/med/green

	box = /obj/item/storage/box/survival/medical
	chameleon_extras = /obj/item/gun/syringe
	pda_slot = ITEM_SLOT_LPOCKET

/datum/outfit/job/psychologist
	name = "Psychologist"
	jobtype = /datum/job/psychologist

	id = /obj/item/card/id/advanced
	id_trim = /datum/id_trim/job/psychologist
	uniform = /obj/item/clothing/under/costume/buttondown/slacks/service
	backpack_contents = list(
		/obj/item/storage/pill_bottle/happinesspsych,
		/obj/item/storage/pill_bottle/lsdpsych,
		/obj/item/storage/pill_bottle/mannitol,
		/obj/item/storage/pill_bottle/paxpsych,
		/obj/item/storage/pill_bottle/psicodine,
		)
	belt = /obj/item/modular_computer/pda/psychologist
	ears = /obj/item/radio/headset/headset_srvmed
	shoes = /obj/item/clothing/shoes/laceup
	l_hand = /obj/item/clipboard
	neck = /obj/item/clothing/neck/tie/black/tied
	backpack = /obj/item/storage/backpack/medic/green
	satchel = /obj/item/storage/backpack/satchel/med/green
	duffelbag = /obj/item/storage/backpack/duffelbag/med/green
	messenger = /obj/item/storage/backpack/messenger/med/green

	pda_slot = ITEM_SLOT_BELT
	skillchips = list(/obj/item/skillchip/job/psychology)

/datum/outfit/job/cmo
	name = "Chief Medical Officer"
	jobtype = /datum/job/chief_medical_officer

	id = /obj/item/card/id/advanced/silver
	id_trim = /datum/id_trim/job/chief_medical_officer
	uniform = /obj/item/clothing/under/rank/medical/chief_medical_officer/turtleneck/green
	suit = /obj/item/clothing/suit/toggle/labcoat/cmo/green
	suit_store = /obj/item/flashlight/pen/paramedic
	backpack_contents = list(
		/obj/item/melee/baton/telescopic = 1,
		)
	belt = /obj/item/modular_computer/pda/heads/cmo
	ears = /obj/item/radio/headset/heads/cmo
	head = /obj/item/clothing/head/utility/surgerycap/green
	shoes = /obj/item/clothing/shoes/sneakers/dark_green
	l_pocket = /obj/item/laser_pointer/blue
	r_pocket = /obj/item/pinpointer/crew
	l_hand = /obj/item/storage/medkit/surgery

	backpack = /obj/item/storage/backpack/medic/green
	satchel = /obj/item/storage/backpack/satchel/med/green
	duffelbag = /obj/item/storage/backpack/duffelbag/med/green
	messenger = /obj/item/storage/backpack/messenger/med/green

	box = /obj/item/storage/box/survival/medical
	chameleon_extras = list(
		/obj/item/gun/syringe,
		/obj/item/stamp/head/cmo,
		)
	skillchips = list(/obj/item/skillchip/entrails_reader)

/datum/outfit/centcom/ert/medic
	name = "ERT Medic"

	id = /obj/item/card/id/advanced/centcom/ert/medical
	back = /obj/item/mod/control/pre_equipped/responsory/medic
	box = /obj/item/storage/box/survival/centcom
	backpack_contents = list(
		/obj/item/gun/medbeam = 1,
		/obj/item/melee/baton/security/loaded = 1,
		/obj/item/reagent_containers/hypospray/combat = 1,
		/obj/item/storage/box/hug/plushes = 1,
	)
	belt = /obj/item/storage/belt/medical/ert/green
	glasses = /obj/item/clothing/glasses/hud/health
	l_hand = /obj/item/storage/medkit/regular
	r_hand = /obj/item/gun/energy/e_gun
	l_pocket = /obj/item/healthanalyzer/advanced
	additional_radio = /obj/item/encryptionkey/heads/cmo

/obj/item/mod/module/insignia/medic
	color = "#1c7214"

// ID & PDA

/datum/id_trim/job/medical_doctor
	assignment = "Medical Doctor"
	trim_state = "trim_medicaldoctor"
	department_color = COLOR_DARK_MODERATE_LIME_GREEN
	subdepartment_color = COLOR_DARK_MODERATE_LIME_GREEN

/datum/id_trim/job/paramedic
	assignment = "Paramedic"
	trim_state = "trim_paramedic"
	department_color = COLOR_DARK_MODERATE_LIME_GREEN
	subdepartment_color = COLOR_DARK_MODERATE_LIME_GREEN

/datum/id_trim/job/psychologist
	assignment = "Psychologist"
	trim_state = "trim_psychologist"
	department_color = COLOR_DARK_MODERATE_LIME_GREEN
	subdepartment_color = COLOR_DARK_MODERATE_LIME_GREEN

/datum/id_trim/job/coroner
	assignment = "Coroner"
	trim_state = "trim_coroner"
	department_color = COLOR_DARK_MODERATE_LIME_GREEN
	subdepartment_color = COLOR_DARK_MODERATE_LIME_GREEN

/datum/id_trim/job/chief_medical_officer
	assignment = "Chief Medical Officer"
	intern_alt_name = "Chief Medical Officer-in-Training"
	trim_state = "trim_medicaldoctor"
	department_color = COLOR_COMMAND_BLUE
	subdepartment_color = COLOR_DARK_MODERATE_LIME_GREEN

/obj/item/modular_computer/pda/medical
	greyscale_colors = "#FAFAFA#355FAC#57C451"

/obj/item/modular_computer/pda/medical/paramedic
	greyscale_colors = "#FAFAFA#355FAC#57C451"

/obj/item/modular_computer/pda/psychologist
	greyscale_colors = "#FAFAFA#355FAC#57C451"

// HEADSET

/obj/item/radio/headset/headset_med/green
	icon = 'modularz_arkstation/modules/green-medbay/icons/icons.dmi'

// BACKPACKS

/obj/item/storage/backpack/medic/green
	icon = 'modularz_arkstation/modules/green-medbay/icons/clothing/backpacks_obj.dmi'
	worn_icon = 'modularz_arkstation/modules/green-medbay/icons/clothing/backpacks_mob.dmi'

/obj/item/storage/backpack/satchel/med/green
	icon = 'modularz_arkstation/modules/green-medbay/icons/clothing/backpacks_obj.dmi'
	worn_icon = 'modularz_arkstation/modules/green-medbay/icons/clothing/backpacks_mob.dmi'


/obj/item/storage/backpack/duffelbag/med/green
	icon = 'modularz_arkstation/modules/green-medbay/icons/clothing/backpacks_obj.dmi'
	worn_icon = 'modularz_arkstation/modules/green-medbay/icons/clothing/backpacks_mob.dmi'


/obj/item/storage/backpack/messenger/med/green
	icon = 'modularz_arkstation/modules/green-medbay/icons/clothing/backpacks_obj.dmi'
	worn_icon = 'modularz_arkstation/modules/green-medbay/icons/clothing/backpacks_mob.dmi'


// CLOTHING

/obj/item/clothing/under/rank/medical/doctor/green
	name = "green medical doctor's jumpsuit"
	icon = 'modularz_arkstation/modules/green-medbay/icons/clothing/obj.dmi'
	worn_icon = 'modularz_arkstation/modules/green-medbay/icons/clothing/mob.dmi'

/obj/item/clothing/under/rank/medical/doctor/green/skirt
	name = "green medical doctor's jumpskirt"
	icon = 'modularz_arkstation/modules/green-medbay/icons/clothing/obj.dmi'
	worn_icon = 'modularz_arkstation/modules/green-medbay/icons/clothing/mob.dmi'
	desc = "It's made of a special fiber that provides minor protection against biohazards. It has a cross on the chest denoting that the wearer is trained medical personnel."
	icon_state = "medical_skirt"
	inhand_icon_state = "w_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	dying_key = DYE_REGISTRY_JUMPSKIRT
	female_sprite_flags = FEMALE_UNIFORM_TOP_ONLY
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/under/rank/medical/chief_medical_officer/turtleneck/green
	name = "green chief medical officer's turtleneck"
	icon = 'modularz_arkstation/modules/green-medbay/icons/clothing/obj.dmi'
	worn_icon = 'modularz_arkstation/modules/green-medbay/icons/clothing/mob.dmi'
	desc = "A green turtleneck and tan khakis, for a chief medical officer with a superior sense of style."

/obj/item/clothing/under/rank/medical/chief_medical_officer/turtleneck/green/skirt
	name = "green chief medical officer's turtleneck skirt"
	desc = "A green turtleneck and tan khaki skirt, for a chief medical officer with a superior sense of style."
	icon_state = "cmoturtle_skirt"
	inhand_icon_state = "b_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	dying_key = DYE_REGISTRY_JUMPSKIRT
	female_sprite_flags = FEMALE_UNIFORM_TOP_ONLY
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON
/obj/item/clothing/under/rank/medical/coroner/green
	desc = "It's made of a special fiber that provides minor protection against biohazards. It has a white cross turned sideways on the chest, denoting that the wearer is a trained coroner."
	name = "green coroner jumpsuit"
	icon_state = "coroner"
	inhand_icon_state = "w_suit"
	icon = 'modularz_arkstation/modules/green-medbay/icons/clothing/obj.dmi'
	worn_icon = 'modularz_arkstation/modules/green-medbay/icons/clothing/mob.dmi'

/obj/item/clothing/under/rank/medical/coroner/green/skirt
	name = "green coroner jumpskirt"
	desc = "It's made of a special fiber that provides minor protection against biohazards. It has a white cross turned sideways on the chest, denoting that the wearer is a trained coroner."
	icon_state = "coroner_skirt"
	inhand_icon_state = "w_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	dying_key = DYE_REGISTRY_JUMPSKIRT
	female_sprite_flags = FEMALE_UNIFORM_TOP_ONLY
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/under/rank/medical/paramedic/green
	name = "green paramedic jumpsuit"
	desc = "It's made of a special fiber that provides minor protection against biohazards. It has a dark green cross on the chest denoting that the wearer is a trained paramedic."
	icon = 'modularz_arkstation/modules/green-medbay/icons/clothing/obj.dmi'
	worn_icon = 'modularz_arkstation/modules/green-medbay/icons/clothing/mob.dmi'

/obj/item/clothing/under/rank/medical/paramedic/green/skirt
	name = "green paramedic jumpskirt"
	desc = "It's made of a special fiber that provides minor protection against biohazards. It has a dark green cross on the chest denoting that the wearer is a trained paramedic."
	icon_state = "paramedic_skirt"
	inhand_icon_state = "w_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	dying_key = DYE_REGISTRY_JUMPSKIRT
	female_sprite_flags = FEMALE_UNIFORM_TOP_ONLY
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/suit/toggle/labcoat/paramedic/green
	name = "green paramedic's jacket"
	desc = "A dark green jacket for paramedics with reflective stripes."
	icon = 'modularz_arkstation/modules/green-medbay/icons/clothing/obj.dmi'
	worn_icon = 'modularz_arkstation/modules/green-medbay/icons/clothing/mob.dmi'

/obj/item/storage/belt/medical/green
	name = "green medical belt"
	icon_state = "medical_belt"
	inhand_icon_state = "medical"
	worn_icon_state = "medical_belt"
	icon = 'modularz_arkstation/modules/green-medbay/icons/clothing/obj.dmi'
	worn_icon = 'modularz_arkstation/modules/green-medbay/icons/clothing/mob.dmi'

/obj/item/storage/belt/medical/ert/green
	icon_state = "emt"
	inhand_icon_state = "security"
	worn_icon_state = "emt"
	icon = 'modularz_arkstation/modules/green-medbay/icons/clothing/obj.dmi'
	worn_icon = 'modularz_arkstation/modules/green-medbay/icons/clothing/mob.dmi'

/obj/item/storage/belt/medical/paramedic/green
	name = "green EMT belt"
	icon_state = "emt"
	inhand_icon_state = "security"
	worn_icon_state = "emt"
	icon = 'modularz_arkstation/modules/green-medbay/icons/clothing/obj.dmi'
	worn_icon = 'modularz_arkstation/modules/green-medbay/icons/clothing/mob.dmi'

/obj/item/clothing/suit/toggle/labcoat/cmo/green
	name = "green labcoat"
	desc = "Standard green model."
	icon_state = "labgreen"

/obj/item/clothing/glasses/hud/health/green
	name = "green health scanner HUD"
	glass_colour_type = /datum/client_colour/glass_colour/lightgreen
	icon = 'modularz_arkstation/modules/green-medbay/icons/clothing/obj.dmi'
	worn_icon = 'modularz_arkstation/modules/green-medbay/icons/clothing/mob.dmi'

/obj/item/clothing/glasses/hud/health/night/green
	name = "green night vision health scanner HUD"
	glass_colour_type = /datum/client_colour/glass_colour/green
	icon = 'modularz_arkstation/modules/green-medbay/icons/clothing/obj.dmi'
	worn_icon = 'modularz_arkstation/modules/green-medbay/icons/clothing/mob.dmi'

/obj/item/clothing/glasses/hud/health/sunglasses/green
	name = "green medical HUDSunglasses"
	glass_colour_type = /datum/client_colour/glass_colour/green
	icon = 'modularz_arkstation/modules/green-medbay/icons/clothing/obj.dmi'
	worn_icon = 'modularz_arkstation/modules/green-medbay/icons/clothing/mob.dmi'

/obj/item/clothing/head/soft/paramedic/green
	name = "green paramedic cap"
	desc = "It's a baseball hat with a dark green color and a reflective cross on the top."
	icon = 'modularz_arkstation/modules/green-medbay/icons/clothing/obj.dmi'
	worn_icon = 'modularz_arkstation/modules/green-medbay/icons/clothing/mob.dmi'

/obj/item/clothing/shoes/sneakers/dark_green
	name = "dark green shoes"
	greyscale_colors = "#0d4f1d#ffffff"

// STAMP

/obj/item/stamp/head/cmo
	name = "chief medical officer's rubber stamp"
	icon_state = "stamp-cmo"
	dye_color = DYE_CENTCOM
