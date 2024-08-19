/datum/job/expeditionary_trooper
	title = JOB_VANGUARD_OPERATIVE
	description = "Explore gateways, watch your friends die, find all the loot."
	department_head = list(JOB_RESEARCH_DIRECTOR)
	faction = FACTION_STATION
	total_positions = 4
	spawn_positions = 4
	supervisors = SUPERVISOR_RD
	config_tag = "VANGUARD_OPERATIVE"

	departments_list = list(
		/datum/job_department/science,
	)

	outfit = /datum/outfit/job/expeditionary_trooper
	plasmaman_outfit = /datum/outfit/plasmaman/mining

	paycheck = PAYCHECK_CREW
	paycheck_department = ACCOUNT_SCI

	display_order = JOB_DISPLAY_ORDER_EXP_CORPS
	bounty_types = CIV_JOB_SCI

	family_heirlooms = list(/obj/item/binoculars)

	job_flags = JOB_ANNOUNCE_ARRIVAL | JOB_CREW_MANIFEST | JOB_EQUIP_RANK | JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_REOPEN_ON_ROUNDSTART_LOSS | JOB_ASSIGN_QUIRKS

/datum/outfit/job/expeditionary_trooper
	name = "Vanguard Operative"
	jobtype = /datum/job/expeditionary_trooper

	glasses = /obj/item/clothing/glasses/sunglasses
	shoes = /obj/item/clothing/shoes/combat/expeditionary_corps
	ears = /obj/item/radio/headset/headset_sci
	uniform = /obj/item/clothing/under/rank/expeditionary_corps

	backpack = /obj/item/storage/backpack/science
	satchel = /obj/item/storage/backpack/satchel/science
	duffelbag = /obj/item/storage/backpack/duffelbag/science

	box = /obj/item/storage/box/expeditionary_survival

	backpack_contents = list(/obj/item/summon_beacon/vanguard)

	id = /obj/item/card/id/advanced/silver/exp_corps
	id_trim = /datum/id_trim/job/expeditionary_trooper

	belt = /obj/item/modular_computer/pda/expeditionary_corps

/obj/effect/landmark/start/expeditionary_corps
	name = "Vanguard Operative"
	icon_state = "Vanguard Operative"
	icon = 'modular_nova/master_files/icons/mob/landmarks.dmi'

/obj/item/modular_computer/pda/expeditionary_corps
	greyscale_colors = "#891417#000099"
	name = "Military PDA"
	long_ranged = TRUE

/obj/item/storage/box/expeditionary_survival
	name = "expedition survival pack"

/obj/item/card/id/advanced/silver/exp_corps
	wildcard_slots = WILDCARD_LIMIT_CENTCOM

/obj/structure/closet/crate/secure/exp_corps
	name = "Expedition Crate"
	desc = "A secure crate, for Expeditionary Corps only!"
	icon = 'zov_modular_arkstation/modules/vanguard-revival/icons/obj/crates.dmi'
	icon_state = "exp_secure"
	base_icon_state = "exp_secure"
	req_access = list(ACCESS_GATEWAY, ACCESS_CENT_GENERAL)
	max_integrity = 5000
	var/loadout_desc = "Whoever picks this is an incredibly boring generalist."

/obj/structure/closet/crate/secure/exp_corps/pointman
	name = "Pointman Crate"
	loadout_desc = "The Pointman's role is to lead the expedition team from the front \
	lines, and has been outfitted with a Shield. Due to the manufacturing costs involved \
	the Pointman kit lacks when it comes to engineering and medical tools."

/obj/structure/closet/crate/secure/exp_corps/field_medic
	name = "Field Medic Crate"
	loadout_desc = "The Field Medic's role is to ensure that the expidition returns at all. \
	Their role as a supportive unit is vital, and they are outfitted with the tools required of \
	their duty. This comes at the cost of any engineering equipment."

/obj/structure/closet/crate/secure/exp_corps/combat_tech
	name = "Combat Tech Crate"
	loadout_desc = "A Combat Tech is always good for an expedition. Having someone with \
	mechanical know-how can mean life or death. A good role to bring along to any expedition. \
	Sadly, this kit is lacking when it comes to medical equipment."

/obj/structure/closet/crate/secure/exp_corps/marksman
	name = "Marksman Crate"
	loadout_desc = "A Combat Tech is always good for an expedition. Having someone with \
	mechanical know-how can mean life or death. A good role to bring along to any expedition. \
	Sadly, this kit is lacking when it comes to medical equipment."

//base, don't use this, but leaving it for admin spawns is probably a good call?
/obj/structure/closet/crate/secure/exp_corps/PopulateContents()
	new /obj/item/storage/medkit/tactical(src)
	new /obj/item/storage/box/expeditionary_survival(src)
	new /obj/item/radio(src)
	new /obj/item/melee/tomahawk(src)
	new /obj/item/clothing/gloves/color/black/expeditionary_corps(src)
	new /obj/item/clothing/head/helmet/expeditionary_corps(src)
	new /obj/item/clothing/suit/armor/vest/expeditionary_corps(src)
	new /obj/item/storage/belt/military/expeditionary_corps(src)
	new /obj/item/storage/backpack/expeditionary_corps(src)

//marksman (has a gun)
/obj/structure/closet/crate/secure/exp_corps/marksman/PopulateContents()
	new /obj/item/storage/medkit/regular(src)
	new /obj/item/storage/box/expeditionary_survival(src)
	new /obj/item/radio(src)
	new /obj/item/melee/tomahawk(src)
	new /obj/item/storage/pouch/ammo/marksman(src)
	new /obj/item/clothing/gloves/color/black/expeditionary_corps(src)
	new /obj/item/clothing/head/helmet/expeditionary_corps(src)
	new /obj/item/clothing/suit/armor/vest/expeditionary_corps(src)
	new /obj/item/storage/belt/military/expeditionary_corps/marksman(src)
	new /obj/item/storage/backpack/expeditionary_corps(src)
	new /obj/item/storage/toolbox/guncase/nova/pistol/trappiste_small_case/skild(src)

//shield guy
/obj/structure/closet/crate/secure/exp_corps/pointman/PopulateContents()
	new /obj/item/storage/medkit/regular(src)
	new /obj/item/storage/box/expeditionary_survival(src)
	new /obj/item/radio(src)
	new /obj/item/melee/tomahawk(src)
	new /obj/item/clothing/gloves/color/black/expeditionary_corps(src)
	new /obj/item/clothing/head/helmet/expeditionary_corps(src)
	new /obj/item/clothing/suit/armor/vest/expeditionary_corps(src)
	new /obj/item/storage/belt/military/expeditionary_corps/pointman(src)
	new /obj/item/storage/backpack/expeditionary_corps(src)
	new /obj/item/shield/riot/pointman(src)

//medic
/obj/structure/closet/crate/secure/exp_corps/field_medic/PopulateContents()
	new /obj/item/storage/medkit/expeditionary(src)
	new /obj/item/storage/box/expeditionary_survival(src)
	new /obj/item/radio(src)
	new /obj/item/melee/tomahawk(src)
	new /obj/item/clothing/gloves/latex/nitrile/expeditionary_corps(src)
	new /obj/item/clothing/head/helmet/expeditionary_corps(src)
	new /obj/item/clothing/suit/armor/vest/expeditionary_corps(src)
	new /obj/item/storage/belt/military/expeditionary_corps/field_medic(src)
	new /obj/item/storage/backpack/expeditionary_corps(src)
	new /obj/item/healthanalyzer(src)

//engineer gaming
/obj/structure/closet/crate/secure/exp_corps/combat_tech/PopulateContents()
	new /obj/item/storage/medkit/emergency(src)
	new /obj/item/storage/box/expeditionary_survival(src)
	new /obj/item/radio(src)
	new /obj/item/melee/tomahawk(src)
	new /obj/item/clothing/gloves/chief_engineer/expeditionary_corps(src)
	new /obj/item/clothing/head/helmet/expeditionary_corps(src)
	new /obj/item/clothing/suit/armor/vest/expeditionary_corps(src)
	new /obj/item/storage/belt/military/expeditionary_corps/combat_tech(src)
	new /obj/item/storage/backpack/expeditionary_corps(src)
	new /obj/item/skillchip/job/engineer(src)

/obj/item/clothing/head/helmet/expeditionary_corps
	flags_inv = NONE // ШОБ ВОЛОСИКИ БЫЛО ВИДНО

/obj/structure/closet/secure_closet/vanguard
	name = "Vanguard locker"
	req_access = list(ACCESS_GATEWAY, ACCESS_CENT_GENERAL)
	icon = 'zov_modular_arkstation/modules/vanguard-revival/icons/obj/closet.dmi'
	icon_state = "exp"

//expeditionary MOD suit

/obj/item/mod/construction/plating/exp
	icon = 'zov_modular_arkstation/modules/vanguard-revival/icons/obj/clothing/mod_construction.dmi'
	icon_state = "exp-plating"
	theme = /datum/mod_theme/exp

/datum/mod_theme/exp
	name = "expeditionary"
	desc = "An Expeditionary Corps armored suit, offering quicker speed at the cost of modules capacity."
	extended_desc = "An Expeditionary Corps classic, this model of MODsuit has been designed for safe moving in \
		dangerous gateways or space."
	default_skin = "exp"
	armor_type = /datum/armor/mod_theme_exp
	complexity_max = DEFAULT_MAX_COMPLEXITY - 5
	slowdown_inactive = 1
	slowdown_active = 0.2
	allowed_suit_storage = list(
		/obj/item/restraints/handcuffs,
		/obj/item/assembly/flash,
		/obj/item/melee/baton,
		/obj/item/melee/energy/sword,
		/obj/item/shield/energy,
	)
	variants = list(
		"exp" = list(
		MOD_ICON_OVERRIDE = 'zov_modular_arkstation/modules/vanguard-revival/icons/obj/clothing/mod_clothing.dmi', // Ark Station 13 Edit
		MOD_WORN_ICON_OVERRIDE = 'zov_modular_arkstation/modules/vanguard-revival/icons/mob/clothing/mod_clothing.dmi', // Ark Station 13 Edit
			/obj/item/clothing/head/mod = list(
				UNSEALED_CLOTHING = SNUG_FIT|THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE|HEADINTERNALS,
				UNSEALED_INVISIBILITY = HIDEFACIALHAIR|HIDEEARS|HIDEHAIR|HIDESNOUT,
				SEALED_INVISIBILITY = HIDEMASK|HIDEEYES|HIDEFACE,
				UNSEALED_COVER = HEADCOVERSMOUTH,
				SEALED_COVER = HEADCOVERSEYES|PEPPERPROOF,
				UNSEALED_MESSAGE = HELMET_UNSEAL_MESSAGE,
				SEALED_MESSAGE = HELMET_SEAL_MESSAGE,
			),
			/obj/item/clothing/suit/mod = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE,
				SEALED_INVISIBILITY = HIDEJUMPSUIT,
				UNSEALED_MESSAGE = CHESTPLATE_UNSEAL_MESSAGE,
				SEALED_MESSAGE = CHESTPLATE_SEAL_MESSAGE,
			),
			/obj/item/clothing/gloves/mod = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE,
				CAN_OVERSLOT = TRUE,
				UNSEALED_MESSAGE = GAUNTLET_UNSEAL_MESSAGE,
				SEALED_MESSAGE = GAUNTLET_SEAL_MESSAGE,
			),
			/obj/item/clothing/shoes/mod = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE,
				CAN_OVERSLOT = TRUE,
				UNSEALED_MESSAGE = BOOT_UNSEAL_MESSAGE,
				SEALED_MESSAGE = BOOT_SEAL_MESSAGE,
			),
		),
	)

/datum/armor/mod_theme_exp
	melee = 20
	bullet = 20
	laser = 20
	energy = 20
	bomb = 20
	bio = 100
	fire = 75
	acid = 75
	wound = 20

/obj/item/mod/control/pre_equipped/exp
	theme = /datum/mod_theme/exp
	applied_cell = /obj/item/stock_parts/power_store/cell/hyper
	applied_modules = list(
		/obj/item/mod/module/storage/large_capacity,
		/obj/item/mod/module/magnetic_harness,
		/obj/item/mod/module/flashlight,
		/obj/item/mod/module/jetpack,
		/obj/item/mod/module/headprotector,
	)
	default_pins = list(
		/obj/item/mod/module/jetpack,
	)
