/datum/job/mechanic
	title = JOB_MECHANIC
	description = "Builds and maintains space pods."
	department_head = list(JOB_CHIEF_ENGINEER)
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	supervisors = SUPERVISOR_CE
	minimal_player_age = 7
	exp_requirements = 0
	exp_required_type = EXP_TYPE_CREW
	exp_required_type_department = EXP_TYPE_ENGINEERING
	exp_granted_type = EXP_TYPE_ENGINEERING
	config_tag = "MECHANIC"

	outfit = /datum/outfit/job/mechanic
	plasmaman_outfit = /datum/outfit/plasmaman/engineering
	akula_outfit = /datum/outfit/akula/station_engineer

	paycheck = PAYCHECK_CREW
	paycheck_department = ACCOUNT_ENG

	display_order = JOB_DISPLAY_ORDER_MECHANIC
	bounty_types = CIV_JOB_ENG
	departments_list = list(
		/datum/job_department/engineering,
	)

	department_for_prefs = /datum/job_department/engineering

	family_heirlooms = list(/obj/item/wrench)

	mail_goodies = list(
		/obj/item/storage/fancy/cigarettes/cigars/havana = 4,
		/obj/item/circuitboard/mecha/spacepod_main = 2,
		/obj/item/circuitboard/mecha/spacepod_peri = 2,
		/obj/item/pods_parts/plate/basic = 2,
		/obj/item/pods_parts/plate/sci = 1,
		/obj/item/pods_parts/plate/sec = 1,
	)
	rpg_title = "Coachman"
	job_flags = STATION_JOB_FLAGS


	alt_titles = list("Mechanic", "Pod Pilot", "Space Pods Builder", "Space Pods Maintainer", "Coachman")

	//banned_quirks = list(SEC_RESTRICTED_QUIRKS)

	//antagonist_restricted = TRUE

/datum/outfit/job/mechanic
	name = "Mechanic"
	jobtype = /datum/job/mechanic

	belt = /obj/item/storage/belt/utility/full
	ears = /obj/item/radio/headset/mechanic
	uniform = /obj/item/clothing/under/rank/engineering/engineer/hazard
	gloves = /obj/item/clothing/gloves/color/black
	shoes = /obj/item/clothing/shoes/workboots
	glasses = /obj/item/clothing/glasses/sunglasses
	head = /obj/item/clothing/head/utility/hardhat/welding/dblue
	backpack = /obj/item/storage/backpack
	satchel = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag
	l_pocket = /obj/item/modular_computer/pda/engineering

	box = /obj/item/storage/box/survival


	id_trim = /datum/id_trim/job/mechanic

/obj/effect/landmark/start/mechanic
	name = JOB_MECHANIC
	icon_state = "Engineering Guard"
	icon = 'modular_nova/master_files/icons/mob/landmarks.dmi'

/obj/item/encryptionkey/mechanic
	name = "mechanic encryption key"
	icon_state = "cypher_engi"
	channels = list(RADIO_CHANNEL_ENGINEERING = 1)

/obj/item/radio/headset/mechanic
	name = "mechanic radio headset"
	icon_state = "eng_headset"
	keyslot = new /obj/item/encryptionkey/mechanic

/datum/id_trim/job/mechanic
	assignment = "Mechanic"
	trim_state = "trim_stationengineer"
	department_color = COLOR_ENGINEERING_ORANGE
	subdepartment_color = COLOR_BLACK
	sechud_icon_state = SECHUD_ENGINEERING_GUARD
	minimal_access = list(
		ACCESS_AUX_BASE,
		ACCESS_CONSTRUCTION,
		ACCESS_ENGINEERING,
		ACCESS_ENGINE_EQUIP,
		ACCESS_EXTERNAL_AIRLOCKS,
		ACCESS_MAINT_TUNNELS,
		ACCESS_MECH_ENGINE,
		ACCESS_MINERAL_STOREROOM,
		ACCESS_MINISAT,
		ACCESS_TCOMMS,
		ACCESS_TECH_STORAGE,
		)
	extra_access = list(
		ACCESS_ATMOSPHERICS,
		)
	template_access = list(
		ACCESS_CAPTAIN,
		ACCESS_CHANGE_IDS,
		ACCESS_CE,
		)
	job = /datum/job/mechanic

/////////////////////////////////////////////////////////////////////

/obj/structure/closet/secure_closet/mechanic
	name = "mechanic's locker"
	req_access = list(ACCESS_ENGINEERING)
	icon_state = "eng_secure"

/obj/structure/closet/secure_closet/mechanic/PopulateContents()
	..()
	new /obj/item/clothing/under/rank/engineering/engineer(src)
	new /obj/item/clothing/under/rank/engineering/engineer/skirt(src)
	new /obj/item/clothing/under/rank/engineering/engineer/hazard(src)
	new /obj/item/storage/toolbox/mechanical(src)
	new /obj/item/storage/toolbox/electrical(src)
	new /obj/item/clothing/head/utility/hardhat/welding/dblue(src)
	new /obj/item/radio/headset/mechanic(src)

/area/station/engineering/mechanic
	name = "Mechanics Workshop"

/area/station/engineering/mechanic/hallway
	name = "Workshop Hallway"
	icon_state = "engine_hallway"

/area/station/engineering/mechanic/hangar
	name = "Hangar"
	icon_state = "engine_smes"

////////////////
