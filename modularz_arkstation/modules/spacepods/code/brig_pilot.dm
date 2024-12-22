/datum/job/brig_pilot
	title = JOB_BRIG_PILOT
	description = "Patrols a sector of the station on his space Pod."
	department_head = list(JOB_HEAD_OF_SECURITY)
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	supervisors = SUPERVISOR_HOS
	minimal_player_age = 7
	exp_requirements = 0
	exp_required_type = EXP_TYPE_CREW
	exp_required_type_department = EXP_TYPE_SECURITY
	exp_granted_type = EXP_TYPE_SECURITY
	config_tag = "BRIG_PILOT"

	outfit = /datum/outfit/job/brig_pilot
	plasmaman_outfit = /datum/outfit/plasmaman/security
	akula_outfit = /datum/outfit/akula/security_officer

	paycheck = PAYCHECK_CREW
	paycheck_department = ACCOUNT_SEC

	display_order = JOB_DISPLAY_ORDER_BRIG_PILOT
	bounty_types = CIV_JOB_SEC
	departments_list = list(
		/datum/job_department/security,
	)

	department_for_prefs = /datum/job_department/security

	family_heirlooms = list(/obj/item/book/manual/wiki/security_space_law)

	mail_goodies = list(
		/obj/item/food/donut/caramel = 10,
		/obj/item/food/donut/matcha = 10,
		/obj/item/food/donut/blumpkin = 5,
		/obj/item/clothing/mask/whistle = 5,
		/obj/item/melee/baton/security/boomerang/loaded = 1
	)
	rpg_title = "Dragon Knight"
	job_flags = STATION_JOB_FLAGS
	antagonist_restricted = TRUE

	alt_titles = list("Brig Pilot", "Pod Pilot", "Security Pilot", "Space Guard", "Brig Pilot Recruit", "Security Mecha Pilot")

	//banned_quirks = list(SEC_RESTRICTED_QUIRKS)

	//antagonist_restricted = TRUE

/datum/outfit/job/brig_pilot
	name = "Brig Pilot"
	jobtype = /datum/job/brig_pilot

	id_trim = /datum/id_trim/job/brig_pilot
	uniform = /obj/item/clothing/under/rank/security/officer/formal
	suit = /obj/item/clothing/suit/armor/vest/secjacket
	suit_store = /obj/item/gun/energy/disabler
	backpack_contents = list(
		/obj/item/evidencebag = 1,
		)
	belt = /obj/item/modular_computer/pda/security
	ears = /obj/item/radio/headset/headset_sec/alt/brig_pilot
	gloves = /obj/item/clothing/gloves/color/black
	head = /obj/item/clothing/head/beret/sec/peacekeeper/armadyne
	shoes = /obj/item/clothing/shoes/jackboots/sec
	l_pocket = /obj/item/restraints/handcuffs
	r_pocket = /obj/item/assembly/flash/handheld

	backpack = /obj/item/storage/backpack/security
	satchel = /obj/item/storage/backpack/satchel/sec
	duffelbag = /obj/item/storage/backpack/duffelbag/sec
	messenger = /obj/item/storage/backpack/messenger/sec

	box = /obj/item/storage/box/survival/security
	chameleon_extras = list(
		/obj/item/clothing/glasses/hud/security/sunglasses,
		/obj/item/clothing/head/helmet,
		/obj/item/gun/energy/disabler,
		)
	implants = list(/obj/item/implant/mindshield)

/obj/effect/landmark/start/brig_pilot
	name = "Brig Pilot"
	icon_state = "Corrections Officer"
	icon = 'modular_nova/master_files/icons/mob/landmarks.dmi'

/obj/item/encryptionkey/brig_pilot
	name = "brig pilot encryption key"
	icon_state = "cypher_sec"
	channels = list(RADIO_CHANNEL_SECURITY = 1)

/obj/item/radio/headset/headset_sec/alt/brig_pilot
	name = "brig pilot radio headset"
	icon_state = "sec_headset"
	keyslot = new /obj/item/encryptionkey/brig_pilot

/obj/item/radio/headset/headset_sec/brig_pilot
	name = "brig pilot radio headset"
	icon_state = "sec_headset"
	keyslot = new /obj/item/encryptionkey/brig_pilot

/datum/id_trim/job/security_officer

/datum/id_trim/job/brig_pilot
	assignment = "Brig Pilot"
	trim_state = "trim_veteranadventurer"
	department_color = COLOR_SECURITY_RED
	subdepartment_color = COLOR_BLACK
	sechud_icon_state = SECHUD_BRIG_PILOT
	minimal_access = list(
		ACCESS_BRIG,
		ACCESS_BRIG_ENTRANCE,
		ACCESS_COURT,
		ACCESS_MECH_SECURITY,
		ACCESS_MINERAL_STOREROOM,
		ACCESS_SECURITY,
		ACCESS_WEAPONS,
		ACCESS_ENGINEERING,
		)
	extra_access = list(
		ACCESS_DETECTIVE,
		ACCESS_MAINT_TUNNELS,
		ACCESS_MORGUE,
		)
	template_access = list(
		ACCESS_CAPTAIN,
		ACCESS_CHANGE_IDS,
		ACCESS_HOS,
		)
	job = /datum/job/brig_pilot

/////////////////////////////////////////////////////////////////////

/obj/structure/closet/secure_closet/brig_pilot
	name = "brig pilot's locker"
	req_access = list(ACCESS_SECURITY)
	icon_state = "sec"

/obj/structure/closet/secure_closet/brig_pilot/PopulateContents()
	..()
	new /obj/item/clothing/suit/armor/vest/alt/sec(src)
	new /obj/item/clothing/head/helmet/sec(src)
	new /obj/item/radio/headset/headset_sec/brig_pilot(src)
	new /obj/item/radio/headset/headset_sec/alt/brig_pilot(src)
	new /obj/item/clothing/glasses/hud/security/sunglasses(src)
	new /obj/item/flashlight/seclite(src)
	new /obj/item/clothing/gloves/tackler/security(src)
	new /obj/item/storage/toolbox/mechanical(src)
	new /obj/item/storage/toolbox/electrical(src)
	new /obj/item/clothing/head/utility/welding(src)
	new /obj/item/storage/belt/security/full(src)

/area/station/security/brig_pilot
	name = "Brig Pilot's Hangar"

/obj/structure/closet/secure_closet/security
////////////////
