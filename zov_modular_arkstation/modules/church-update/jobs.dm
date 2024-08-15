// DEPARTMENT /////////////////////////////////////////////////////////////////////////////////////
/datum/job_department/church
	department_name = DEPARTMENT_CHURCH
	department_bitflags = DEPARTMENT_BITFLAG_CHURCH
	department_head = /datum/job/chaplain
	department_experience_type = EXP_TYPE_CHURCH
	display_order = 7
	label_class = "church"
	ui_color = "#b8b8b8"
	nation_prefixes = list("Religi", "Godoni", "Orhtodoxi", "Pravoslavni")
	department_delivery_areas = list(/area/station/service/chapel)
	associated_cargo_groups = list("Church")
	head_of_staff_access = ACCESS_CHAPEL_OFFICE
	department_access = list(ACCESS_CHURCH_GENERAL)


// THE PRIEST /////////////////////////////////////////////////////////////////////////////////////
/datum/job/chaplain
	title = JOB_CHAPLAIN
	description = "Hold church and funerals, cremate people, preach your \
		religion, protect the crew against cults."
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD // ARK STATION EDIT
	department_head = list(JOB_CAPTAIN) // ARK STATION EDIT
	head_announce = list(RADIO_CHANNEL_CHURCH) // ARK STATION EDIT
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	supervisors = SUPERVISOR_CAPTAIN // ARK STATION EDIT
	req_admin_notify = 1 // ARK STATION EDIT
	minimal_player_age = 10 // ARK STATION EDIT
	exp_requirements = 180 // ARK STATION EDIT
	exp_required_type = EXP_TYPE_CREW // ARK STATION EDIT
	exp_required_type_department = EXP_TYPE_CHURCH // ARK STATION EDIT
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "CHAPLAIN"

	outfit = /datum/outfit/job/chaplain
	plasmaman_outfit = /datum/outfit/plasmaman/chaplain

	paycheck = PAYCHECK_COMMAND // ARK STATION EDIT
	paycheck_department = ACCOUNT_CHR // ARK STATION EDIT

	display_order = JOB_DISPLAY_ORDER_CHAPLAIN
	departments_list = list(
		/datum/job_department/church, // ARK STATION EDIT
		/datum/job_department/command, // ARK STATION EDIT
		)

	mind_traits = list(HEAD_OF_STAFF_MIND_TRAITS) // ARK STATION EDIT
	liver_traits = list(TRAIT_ROYAL_METABOLISM) // ARK STATION EDIT

	family_heirlooms = list(/obj/item/toy/windup_toolbox, /obj/item/reagent_containers/cup/glass/bottle/holywater)

	mail_goodies = list(
		/obj/item/reagent_containers/cup/glass/bottle/holywater = 30,
		/obj/item/grenade/chem_grenade/holy = 5,
		/obj/item/clothing/neck/cross = 2
	)
	rpg_title = "Paladin"
	job_flags = STATION_JOB_FLAGS

	voice_of_god_power = 2 //Chaplains are very good at speaking with the voice of god

	job_tone = "holy"

// Outfit
/datum/outfit/job/chaplain
	name = "Priest"
	jobtype = /datum/job/chaplain

	id_trim = /datum/id_trim/job/chaplain
	uniform = /obj/item/clothing/under/rank/civilian/chaplain

	head = /obj/item/clothing/head/chaplain/priest
	neck = /obj/item/clothing/neck/cloak/priest

	suit = /obj/item/clothing/suit/chaplainsuit/priest
	shoes = /obj/item/clothing/shoes/sneakers/white

	r_pocket = /obj/item/clothing/neck/cross

	backpack_contents = list(
		/obj/item/camera/spooky = 1,
		/obj/item/stamp/chap = 1,
		)
	belt = /obj/item/modular_computer/pda/chaplain
	ears = /obj/item/radio/headset/heads/priest

	backpack = /obj/item/storage/backpack/medieval
	satchel = /obj/item/storage/backpack/satchel/medieval

	chameleon_extras = /obj/item/stamp/chap
	skillchips = list(/obj/item/skillchip/entrails_reader)

// Trim
/datum/id_trim/job/chaplain
	assignment = "Priest"
	trim_state = "trim_chaplain"
	department_color = COLOR_LIGHT_YELLOW // ARK STATION EDIT
	subdepartment_color = COLOR_LIGHT_YELLOW // ARK STATION EDIT
	sechud_icon_state = SECHUD_CHAPLAIN
	minimal_access = list(
		ACCESS_CHAPEL_OFFICE,
		ACCESS_CREMATORIUM,
		ACCESS_MINERAL_STOREROOM,
		ACCESS_MORGUE,
		ACCESS_SERVICE,
		ACCESS_THEATRE,
		ACCESS_CHURCH_GENERAL, // ARK STATION EDIT
		ACCESS_CHURCH_DEACON, // ARK STATION EDIT
		ACCESS_CHURCH_FISCAL, // ARK STATION EDIT
		ACCESS_COMMAND, // ARK STATION EDIT
		ACCESS_KEYCARD_AUTH, // ARK STATION EDIT
		ACCESS_EVA, // ARK STATION EDIT
		ACCESS_BRIG_ENTRANCE, // ARK STATION EDIT
		ACCESS_RC_ANNOUNCE, // ARK STATION EDIT
		)
	extra_access = list()
	template_access = list(
		ACCESS_CAPTAIN,
		ACCESS_CHANGE_IDS,
		ACCESS_HOP,
		)
	job = /datum/job/chaplain

/obj/effect/landmark/start/chaplain
	name = "Priest"
	icon_state = "priest"
	icon = 'zov_modular_arkstation/modules/church-update/icons/misc/landmarks.dmi'

// DEACON /////////////////////////////////////////////////////////////////////////////////////
/datum/job/deacon
	title = JOB_DEACON
	description = "Deacons help bishops and priests in worship, \
		but cannot independently stand at a Christian meeting and perform the sacraments."
	department_head = list(JOB_CHAPLAIN)
	faction = FACTION_STATION
	total_positions = 2
	spawn_positions = 2
	supervisors = SUPERVISOR_CHAP
	exp_granted_type = EXP_TYPE_CHURCH
	config_tag = "DEACON"

	outfit = /datum/outfit/job/deacon
	plasmaman_outfit = /datum/outfit/plasmaman/deacon

	paycheck = PAYCHECK_CREW
	paycheck_department = ACCOUNT_CHR

	display_order = JOB_DISPLAY_ORDER_DEACON
	departments_list = list(
		/datum/job_department/church,
		)

	family_heirlooms = list(/obj/item/toy/windup_toolbox, /obj/item/reagent_containers/cup/glass/bottle/holywater)

	mail_goodies = list(
		/obj/item/reagent_containers/cup/glass/bottle/holywater = 30,
		/obj/item/grenade/chem_grenade/holy = 5,
		/obj/item/clothing/neck/cross = 2
	)
	rpg_title = "Deacon"
	job_flags = STATION_JOB_FLAGS

	voice_of_god_power = 2 //Chaplains are very good at speaking with the voice of god

	job_tone = "holy"

// Outfit
/datum/outfit/job/deacon
	name = "Deacon"
	jobtype = /datum/job/deacon

	id_trim = /datum/id_trim/job/deacon
	uniform = /obj/item/clothing/under/rank/civilian/chaplain

	head = /obj/item/clothing/head/chaplain/deacon
	suit = /obj/item/clothing/suit/chaplainsuit/deacon
	gloves = /obj/item/clothing/gloves/combat/medieval
	shoes = /obj/item/clothing/shoes/jackboots/black/medieval

	neck = /obj/item/clothing/neck/cross

	belt = /obj/item/modular_computer/pda/chaplain
	ears = /obj/item/radio/headset/headset_church

	backpack = /obj/item/storage/backpack/medieval
	satchel = /obj/item/storage/backpack/satchel/medieval

	chameleon_extras = /obj/item/stamp/chap
	skillchips = list(/obj/item/skillchip/entrails_reader)
// Plasma
/datum/outfit/plasmaman/deacon
	name = "Deacon Plasmaman"

	id_trim = /datum/id_trim/job/deacon

	uniform = /obj/item/clothing/under/plasmaman/chaplain
	suit = /obj/item/clothing/suit/chaplainsuit/deacon
	gloves = /obj/item/clothing/gloves/combat/medieval
	shoes = /obj/item/clothing/shoes/jackboots/black/medieval
	head = /obj/item/clothing/head/helmet/space/plasmaman/chaplain

	neck = /obj/item/clothing/neck/cross

	belt = /obj/item/modular_computer/pda/chaplain
	ears = /obj/item/radio/headset/headset_church

// Trim

/datum/id_trim/job/deacon
	assignment = "Deacon"
	trim_state = "trim_undertaker"
	department_color = COLOR_LIGHT_YELLOW
	subdepartment_color = COLOR_LIGHT_YELLOW
	sechud_icon_state = SECHUD_DEACON
	minimal_access = list(
		ACCESS_CREMATORIUM,
		ACCESS_MINERAL_STOREROOM,
		ACCESS_MORGUE,
		ACCESS_SERVICE,
		ACCESS_THEATRE,
		ACCESS_CHURCH_GENERAL,
		ACCESS_CHURCH_DEACON,
		)
	extra_access = list()
	template_access = list(
		ACCESS_CAPTAIN,
		ACCESS_CHANGE_IDS,
		ACCESS_HOP,
		)
	job = /datum/job/deacon

/obj/effect/landmark/start/deacon
	name = "Deacon"
	icon_state = "deacon"
	icon = 'zov_modular_arkstation/modules/church-update/icons/misc/landmarks.dmi'


// FISCAL /////////////////////////////////////////////////////////////////////////////////////
/datum/job/fiscal
	title = JOB_FISCAL
	description = "Deacons help bishops and priests in worship, \
		but cannot independently stand at a Christian meeting and perform the sacraments."
	department_head = list(JOB_CHAPLAIN)
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	supervisors = SUPERVISOR_CHAP
	exp_granted_type = EXP_TYPE_CHURCH
	config_tag = "FISCAL"

	outfit = /datum/outfit/job/fiscal
	plasmaman_outfit = /datum/outfit/plasmaman/fiscal

	paycheck = PAYCHECK_CREW
	paycheck_department = ACCOUNT_CHR

	display_order = JOB_DISPLAY_ORDER_FISCAL
	departments_list = list(
		/datum/job_department/church,
		)

	family_heirlooms = list(/obj/item/toy/windup_toolbox, /obj/item/reagent_containers/cup/glass/bottle/holywater)

	mail_goodies = list(
		/obj/item/reagent_containers/cup/glass/bottle/holywater = 30,
		/obj/item/grenade/chem_grenade/holy = 5,
		/obj/item/clothing/neck/cross = 2
	)
	rpg_title = "Fiscal"
	job_flags = STATION_JOB_FLAGS

	voice_of_god_power = 2 //Chaplains are very good at speaking with the voice of god

	job_tone = "holy"

// Outfit
/datum/outfit/job/fiscal
	name = "Fiscal"
	jobtype = /datum/job/fiscal

	id_trim = /datum/id_trim/job/fiscal
	uniform = /obj/item/clothing/under/syndicate/combat

	head = /obj/item/clothing/head/helmet/toggleable/inquisitor
	suit = /obj/item/clothing/suit/armor/riot/knight/inquisitor
	gloves = /obj/item/clothing/gloves/combat/medieval/steel
	shoes = /obj/item/clothing/shoes/combat/medieval_steel

	mask = /obj/item/clothing/mask/medieval
	r_pocket = /obj/item/clothing/neck/cross
	l_pocket = /obj/item/modular_computer/pda/chaplain

	neck = /obj/item/clothing/neck/medieval_chainmail

	belt = /obj/item/claymore/cerberus
	ears = /obj/item/radio/headset/headset_church

	backpack = /obj/item/storage/backpack/medieval
	satchel = /obj/item/storage/backpack/satchel/medieval

	chameleon_extras = /obj/item/stamp/chap
	skillchips = list(/obj/item/skillchip/entrails_reader)
// Plasma
/datum/outfit/plasmaman/fiscal
	name = "Fiscal Plasmaman"

	id_trim = /datum/id_trim/job/fiscal

	uniform = /obj/item/clothing/under/plasmaman/chaplain
	head = /obj/item/clothing/head/helmet/space/plasmaman/chaplain

	suit = /obj/item/clothing/suit/armor/riot/knight/inquisitor
	gloves = /obj/item/clothing/gloves/combat/medieval/steel
	shoes = /obj/item/clothing/shoes/combat/medieval_steel

	mask = /obj/item/clothing/mask/medieval
	r_pocket = /obj/item/clothing/neck/cross
	l_pocket = /obj/item/modular_computer/pda/chaplain

	neck = /obj/item/clothing/neck/medieval_chainmail

	belt = /obj/item/claymore/cerberus
	ears = /obj/item/radio/headset/headset_church

// Trim

/datum/id_trim/job/fiscal
	assignment = "Fiscal"
	trim_state = "trim_royalguard"
	department_color = COLOR_LIGHT_YELLOW
	subdepartment_color = COLOR_LIGHT_YELLOW
	sechud_icon_state = SECHUD_FISCAL
	minimal_access = list(
		ACCESS_CREMATORIUM,
		ACCESS_MINERAL_STOREROOM,
		ACCESS_MORGUE,
		ACCESS_SERVICE,
		ACCESS_THEATRE,
		ACCESS_CHURCH_GENERAL,
		ACCESS_CHURCH_FISCAL,
		)
	extra_access = list()
	template_access = list(
		ACCESS_CAPTAIN,
		ACCESS_CHANGE_IDS,
		ACCESS_HOP,
		)
	job = /datum/job/fiscal

/obj/effect/landmark/start/fiscal
	name = "Fiscal"
	icon_state = "fiscal"
	icon = 'zov_modular_arkstation/modules/church-update/icons/misc/landmarks.dmi'
