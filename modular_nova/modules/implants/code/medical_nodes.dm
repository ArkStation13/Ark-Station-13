/datum/techweb_node/cyber_implants
	design_ids = list(
		"ci-nutriment",
		"ci-scanner",
		"ci-breather",
		"ci-gloweyes",
		"ci-welding",
		"ci-medhud",
		"ci-sechud",
		"ci-diaghud",
		"ci-botany",
		"ci-janitor",
		"ci-lighter",
		"ci-razor",
		"ci-drill",
		"combat_implant_sandy",
		"combat_implant_hackerman",
		"combat_implant_razorwire",
		"combat_implant_shell_launcher",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 5000)

/datum/techweb_node/adv_cyber_implants
	design_ids = list("ci-nv", "ci-nutrimentplus", "ci-surgery", "ci-toolset")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 7500)

<<<<<<< HEAD
/datum/techweb_node/combat_cyber_implants
	design_ids = list("ci-antidrop", "ci-antistun", "ci-antisleep", "ci-thrusters", "ci-mantis", "ci-flash", "ci-reviver")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 12000)
=======
/datum/techweb_node/cyber/night_vision_implants
	id = TECHWEB_NODE_NIGHT_VISION_IMPLANTS
	display_name = "Night vision implants"
	description = "Now you can work all night, even if you lost your glasses!"
	prereq_ids = list(TECHWEB_NODE_NIGHT_VISION, TECHWEB_NODE_CYBER_IMPLANTS)
	design_ids = list(
		"ci-nv",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_1_POINTS)
>>>>>>> ec9334aac85... [MIRROR] Techweb nodes DEFINED & bug fix [MDB IGNORE] (#3319)

/datum/techweb_node/adv_mining //Here for the integrated drill augments.
	design_ids = list(
		"drill_diamond",
		"hypermod",
		"jackhammer",
		"plasmacutter_adv",
		"ci-drill-diamond"
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 7500)
