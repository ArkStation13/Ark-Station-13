/datum/job/security_medic
	title = JOB_SECURITY_MEDIC
	description = "Patch up officers and prisoners, realize you don't have the tools to Tend Wounds, barge into Medbay and tell them how to do their jobs"
	auto_deadmin_role_flags = DEADMIN_POSITION_SECURITY
	department_head = list(JOB_HEAD_OF_SECURITY)
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	supervisors = SUPERVISOR_HOS
	minimal_player_age = 7
	exp_requirements = 120
	exp_required_type = EXP_TYPE_CREW
	exp_required_type_department = EXP_TYPE_SECURITY
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "SECURITY_MEDIC"

	outfit = /datum/outfit/job/security_medic
	plasmaman_outfit = /datum/outfit/plasmaman/security
	akula_outfit = /datum/outfit/akula

	paycheck = PAYCHECK_CREW
	paycheck_department = ACCOUNT_SEC

	liver_traits = list(TRAIT_LAW_ENFORCEMENT_METABOLISM)

	display_order = JOB_DISPLAY_ORDER_SECURITY_MEDIC
	bounty_types = CIV_JOB_SEC
	departments_list = list(
		/datum/job_department/security,
		/datum/job_department/medical,
	)

	family_heirlooms = list(/obj/item/clothing/neck/stethoscope, /obj/item/book/manual/wiki/security_space_law)

	//This is the paramedic goodie list. Secmedics are paramedics more or less so they can use these instead of raiding medbay.
	mail_goodies = list(
		/obj/item/reagent_containers/hypospray/medipen = 20,
		/obj/item/reagent_containers/hypospray/medipen/oxandrolone = 10,
		/obj/item/reagent_containers/hypospray/medipen/salacid = 10,
		/obj/item/reagent_containers/hypospray/medipen/salbutamol = 10,
		/obj/item/reagent_containers/hypospray/medipen/penacid = 10,
		/obj/item/reagent_containers/hypospray/medipen/survival/luxury = 5
	)
	rpg_title = "Battle Cleric"
	job_flags = JOB_ANNOUNCE_ARRIVAL | JOB_CREW_MANIFEST | JOB_EQUIP_RANK | JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_REOPEN_ON_ROUNDSTART_LOSS | JOB_ASSIGN_QUIRKS | JOB_CAN_BE_INTERN

	alt_titles = list(
		"Security Medic",
		"Field Medic",
		"Security Corpsman",
		"Brig Physician",
		"Combat Medic",
		"Brig Doctor",
		"Security EMT",
		"Brig EMT",
	)

	banned_quirks = list(SEC_RESTRICTED_QUIRKS)

	antagonist_restricted = TRUE

/datum/outfit/job/security_medic
	name = "Security Medic"
	jobtype = /datum/job/security_medic

	belt = /obj/item/modular_computer/pda/security
	ears = /obj/item/radio/headset/headset_medsec
	uniform = /obj/item/clothing/under/rank/security/peacekeeper/security_medic
	gloves = /obj/item/clothing/gloves/latex/nitrile
	shoes = /obj/item/clothing/shoes/jackboots/sec
	glasses = /obj/item/clothing/glasses/hud/health/sunglasses
	suit = /obj/item/clothing/suit/armor/vest/peacekeeper/security_medic
	l_hand = /obj/item/storage/medkit/brute
	head = /obj/item/clothing/head/beret/sec/peacekeeper/security_medic
	//backpack_contents = list(
	//	/obj/item/storage/box/gunset/firefly = 1,
	//	)
	backpack = /obj/item/storage/backpack/security
	satchel = /obj/item/storage/backpack/satchel/sec
	duffelbag = /obj/item/storage/backpack/duffelbag/sec

	box = /obj/item/storage/box/survival/security

	implants = list(/obj/item/implant/mindshield)

	id_trim = /datum/id_trim/job/security_medic

	suit_store = /obj/item/gun/energy/disabler

/obj/effect/landmark/start/security_officer/Initialize(mapload)
	. = ..()
	new /obj/effect/landmark/start/security_medic(get_turf(src))

/obj/effect/landmark/start/security_medic
	name = "Security Medic"
	icon_state = "Security Medic"
	icon = 'modular_skyrat/master_files/icons/mob/landmarks.dmi'

/obj/item/encryptionkey/headset_sec/medsec
	name = "medical-security encryption key"
	channels = list(RADIO_CHANNEL_MEDICAL = 1, RADIO_CHANNEL_SECURITY = 1)

/obj/item/radio/headset/headset_medsec
	name = "medical-security radio headset"
	desc = "Used to hear how many security officers need to be stiched back together."
	icon_state = "sec_headset"
	keyslot = new /obj/item/encryptionkey/headset_sec/medsec

/datum/id_trim/job/security_medic
	assignment = "Security Medic"
	//trim_icon = 'modular_skyrat/master_files/icons/obj/card.dmi'
	trim_state = "trim_medicaldoctor"
	department_color = COLOR_ASSEMBLY_RED
	subdepartment_color = COLOR_ASSEMBLY_RED
	sechud_icon_state = SECHUD_SECURITY_MEDIC
	extra_access = list(ACCESS_DETECTIVE)
	minimal_access = list(ACCESS_SECURITY, ACCESS_BRIG_ENTRANCE, ACCESS_BRIG, ACCESS_COURT, ACCESS_WEAPONS, ACCESS_MECH_SECURITY, ACCESS_MINERAL_STOREROOM, ACCESS_MAINT_TUNNELS, ACCESS_MEDICAL,
		ACCESS_MORGUE,
		ACCESS_MORGUE_SECURE,
		ACCESS_SURGERY,)
	template_access = list(ACCESS_CAPTAIN, ACCESS_HOS, ACCESS_CHANGE_IDS)

	job = /datum/job/security_medic

/datum/id_trim/job/security_medic/New()
	. = ..()

	// Config check for if sec has maint access.
	if(CONFIG_GET(flag/security_has_maint_access))
		access |= list(ACCESS_MAINT_TUNNELS)


////////////

/obj/structure/closet/secure_closet/security_medic
	name = "security medics's locker"
	req_access = list(ACCESS_SECURITY)
	icon = 'zov_modular_arkstation/modules/security-medic-renewal/icons/misc.dmi'
	icon_state = "brigdoc"

/obj/structure/closet/secure_closet/security_medic/PopulateContents()
	..()
	new /obj/item/clothing/suit/toggle/labcoat/skyrat/security_medic(src)
	new /obj/item/clothing/suit/hazardvest/security_medic(src)
	new /obj/item/clothing/suit/toggle/labcoat/skyrat/security_medic/blue(src)
	//new /obj/item/clothing/suit/hazardvest/security_medic/blue(src)
	new /obj/item/clothing/head/helmet/sec/peacekeeper/security_medic(src)
	new /obj/item/clothing/suit/armor/vest/peacekeeper/security_medic/alternate(src)
	//new /obj/item/clothing/under/rank/security/peacekeeper/tactical(src)
	new /obj/item/radio/headset/headset_medsec(src)
	new /obj/item/storage/medkit/emergency(src)
	new /obj/item/clothing/suit/jacket/straight_jacket(src)
	new /obj/item/storage/belt/medical(src)
	new /obj/item/storage/belt/security/medic/full(src)
	new /obj/item/clothing/under/rank/medical/scrubs/skyrat/red/sec(src)
	new /obj/item/clothing/under/rank/security/peacekeeper/security_medic/alternate(src)
	new /obj/item/clothing/under/rank/security/peacekeeper/security_medic(src)
	new /obj/item/clothing/under/rank/security/peacekeeper/security_medic/skirt(src)

////////////////

/datum/area_spawn/secmed_locker
	target_areas = list(/area/station/security/medical)
	desired_atom = /obj/structure/closet/secure_closet/security_medic

/datum/area_spawn/secmed_landmark
	target_areas = list(/area/station/security/medical)
	desired_atom = /obj/effect/landmark/start/security_medic

////////////////

/obj/item/clothing/under/rank/medical/scrubs/skyrat/red/sec
	name = "security medic scrubs"
	desc = "It's made of a special fiber that provides minor protection against biohazards and acid, along with some light padding. This one is in a deep red."
	armor_type = /datum/armor/red_sec

/datum/armor/red_sec
	melee = 10
	bio = 10
	fire = 30
	acid = 30
	wound = 10
