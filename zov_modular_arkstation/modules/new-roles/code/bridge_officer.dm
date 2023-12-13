#define SECHUD_BRIDGEOFFICER "hudbridgeofficer"

/datum/job/bridge_officer
	title = JOB_BRIDGE_OFFICER
	description = "Help stational heads to perform their jobs. Avoid being smashed by the pile of papers."
	//auto_deadmin_role_flags = DEADMIN_POSITION_HEAD
	department_head = list(JOB_CAPTAIN)
	faction = FACTION_STATION
	total_positions = 2
	spawn_positions = 2
	supervisors = SUPERVISOR_CAPTAIN
	minimal_player_age = 7
	exp_requirements = 0
	exp_required_type = EXP_TYPE_CREW
	exp_required_type_department = EXP_TYPE_COMMAND
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "BRIDGE_OFFICER"

	outfit = /datum/outfit/job/bridge_officer
	plasmaman_outfit = /datum/outfit/plasmaman/centcom_intern
	akula_outfit = /datum/outfit/akula

	paycheck = PAYCHECK_CREW
	paycheck_department = ACCOUNT_CMD

	//liver_traits = list(TRAIT_LAW_ENFORCEMENT_METABOLISM)

	display_order = JOB_DISPLAY_ORDER_BRIDGE_OFFICER
	bounty_types = CIV_JOB_RANDOM
	departments_list = list(
		/datum/job_department/central_command,
	)

	department_for_prefs = /datum/job_department/captain

	family_heirlooms = list(/obj/item/clipboard)

	mail_goodies = list(
		/obj/item/storage/fancy/cigarettes/cigars/havana = 5,
		/obj/item/stack/spacecash/c500 = 2,
		/obj/item/disk/nuclear/fake/obvious = 1,
	)
	rpg_title = "Goblin"
	job_flags = STATION_JOB_FLAGS


	alt_titles = list("Command Secretary", "Command Officer", "Bridge Secretary", "Ensign", "Bridge Advisor", "Bridge Intern")

	//banned_quirks = list(SEC_RESTRICTED_QUIRKS)

	//antagonist_restricted = TRUE

/datum/outfit/job/bridge_officer
	name = "Bridge Officer"
	jobtype = /datum/job/bridge_officer

	//belt =
	ears = /obj/item/radio/headset/headset_bridge_officer
	uniform = /obj/item/clothing/under/rank/bridge_officer_uniform
	gloves = /obj/item/clothing/gloves/color/black
	shoes = /obj/item/clothing/shoes/laceup
	glasses = /obj/item/clothing/glasses/sunglasses
	//suit =
	head = /obj/item/clothing/head/bridge_officer_beret
	//backpack_contents = list(
	//
	//	)
	backpack = /obj/item/storage/backpack
	satchel = /obj/item/storage/backpack
	duffelbag = /obj/item/storage/backpack/duffelbag

	box = /obj/item/storage/box/survival


	id_trim = /datum/id_trim/job/bridge_officer

/obj/effect/landmark/start/bridge_officer
	name = "Bridge Officer"
	icon_state = "Captain"
	icon = 'modular_skyrat/master_files/icons/mob/landmarks.dmi'

/obj/item/encryptionkey/headset_bridge_officer
	name = "bridge officer encryption key"
	icon_state = "cypherkey_centcom"
	channels = list(RADIO_CHANNEL_COMMAND = 1)

/obj/item/radio/headset/headset_bridge_officer
	name = "bridge officer radio headset"
	desc = "In case you're not tired of captain's mumble."
	icon_state = "srv_headset"
	keyslot = new /obj/item/encryptionkey/headset_bridge_officer

/datum/id_trim/job/bridge_officer
	assignment = "Bridge Officer"
	trim_icon = 'zov_modular_arkstation/modules/new-roles/icons/misc.dmi'
	trim_state = "trim_bridgeofficer"
	department_color = COLOR_COMMAND_BLUE
	subdepartment_color = COLOR_CENTCOM_BLUE
	sechud_icon_state = SECHUD_BRIDGEOFFICER
	minimal_access = list(
		ACCESS_BRIG_ENTRANCE,
		ACCESS_COURT,
		ACCESS_LAWYER,
		ACCESS_MINERAL_STOREROOM,
		ACCESS_SERVICE,
		ACCESS_COMMAND,
		)
	extra_access = list()
	template_access = list(
		ACCESS_CAPTAIN,
		ACCESS_CHANGE_IDS,
		ACCESS_HOP,
		)
	job = /datum/job/bridge_officer

/////////////////////////////////////////////////////////////////////

/obj/structure/closet/secure_closet/bridge_officer
	name = "bridge officer's locker"
	req_access = list(ACCESS_COMMAND)
	icon = 'zov_modular_arkstation/modules/new-roles/icons/misc.dmi'
	icon_state = "bridge"

/obj/structure/closet/secure_closet/bridge_officer/PopulateContents()
	..()
	new /obj/item/clothing/under/rank/civilian/head_of_personnel/skyrat/turtleneck(src)
	new /obj/item/clothing/under/rank/civilian/head_of_personnel/skyrat/turtleneck/skirt(src)
	new /obj/item/clothing/under/rank/bridge_officer_uniform(src)
	new /obj/item/clothing/under/rank/bridge_officer_uniform(src)
	new /obj/item/clothing/under/rank/bridge_officer_uniform/skirt(src)
	new /obj/item/clothing/under/rank/bridge_officer_uniform/skirt(src)
	new /obj/item/clothing/suit/toggle/lawyer/bridge_officer_jacket(src)
	new /obj/item/clothing/suit/toggle/lawyer/bridge_officer_jacket(src)
	new /obj/item/clothing/head/bridge_officer_beret(src)
	new /obj/item/clothing/head/bridge_officer_cap(src)
	new /obj/item/clothing/head/bridge_officer_cap(src)
	new /obj/item/radio/headset/headset_bridge_officer(src)
	new /obj/item/radio/headset/headset_bridge_officer(src)

////////////////

/datum/area_spawn/bridge_officer_locker
	target_areas = list(/area/station/command/bridge)
	desired_atom = /obj/structure/closet/secure_closet/bridge_officer

/datum/area_spawn/bridge_officer_landmark
	target_areas = list(/area/station/command/bridge)
	desired_atom = /obj/effect/landmark/start/bridge_officer
