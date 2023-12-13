// Безбилетник

/datum/job/stowaway
	title = JOB_STOWAWAY
	description = "Survive avoiding security officers."
	department_head = list("No one")
	faction = FACTION_STATION
	total_positions = 2
	spawn_positions = 2
	supervisors = "no one"
	exp_granted_type = EXP_TYPE_CREW
	paycheck = PAYCHECK_ZERO
	config_tag = "STOWAWAY"

	outfit = /datum/outfit/job/stowaway
	plasmaman_outfit = /datum/outfit/plasmaman

	display_order = JOB_DISPLAY_ORDER_STOWAWAY
	department_for_prefs = /datum/job_department/assistant

	exclusive_mail_goodies = FALSE

	family_heirlooms = list(/obj/item/clothing/gloves/color/yellow, /obj/item/storage/toolbox/mechanical/old/heirloom)
	rpg_title = "Hobo"
	job_flags = JOB_NEW_PLAYER_JOINABLE | JOB_ASSIGN_QUIRKS | JOB_CANNOT_OPEN_SLOTS

	required_languages = null

	alt_titles = list("Interloper")

/datum/outfit/job/stowaway
	name = "Stowaway"
	jobtype = /datum/job/stowaway

	//id = /obj/item/card/id/stowaway
	//id_trim = /datum/id_trim/job/stowaway
	uniform = /obj/item/clothing/under/pants/jeans
	belt = /obj/item/storage/belt/utility/full
	ears = null
	shoes = /obj/item/clothing/shoes/sneakers/black
	gloves = /obj/item/clothing/gloves/color/yellow
	r_pocket = /obj/item/radio
	head = /obj/item/clothing/head/beanie/black

/datum/id_trim/job/stowaway
	assignment = null
	trim_state = ""
	department_color = COLOR_ASSISTANT_GRAY
	subdepartment_color = COLOR_ASSISTANT_GRAY
	sechud_icon_state = SECHUD_UNKNOWN
	template_access = list(
		ACCESS_MAINT_TUNNELS,
		)
	job = /datum/job/stowaway

/obj/effect/landmark/start/stowaway
	name = "Stowaway"
	icon_state = "Assistant"
	jobspawn_override = TRUE
	delete_after_roundstart = FALSE

/obj/effect/landmark/start/stowaway/after_round_start()
	return

///datum/area_spawn/stowaway_landmark
	//target_areas = list(/area/station/maintenance)
	//desired_atom = /obj/effect/landmark/start/stowaway

/obj/item/card/id/stowaway
	name = "Unknown ID Card"
	desc = "A strange-looking old ID card. Looks like there's some old bank account attached."
	registered_name = null
	assignment = null
