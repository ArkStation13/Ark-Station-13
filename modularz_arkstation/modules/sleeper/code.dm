// ARK STATION EDIT START
/datum/design/board/sleeper
	name = "Sleeper Board"
	desc = "The circuit board for an sleeper harvester."
	id = "sleeper"
	build_path = /obj/item/circuitboard/machine/sleeper
	category = list(
		RND_CATEGORY_MACHINE + RND_SUBCATEGORY_MACHINE_MEDICAL
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL
// ARK STATION EDIT END

/datum/techweb_node/medbay_equip_adv
	id = TECHWEB_NODE_MEDBAY_EQUIP_ADV
	display_name = "Advanced Medbay Equipment"
	description = "State-of-the-art medical gear for keeping the crew in one piece — mostly."
	prereq_ids = list(TECHWEB_NODE_CHEM_SYNTHESIS)
	design_ids = list(
		"smoke_machine",
		"chem_mass_spec",
		"healthanalyzer_advanced",
		"mod_health_analyzer",
		"crewpinpointer",
		"defibrillator_compact",
		"defibmount",
		"medicalbed_emergency",
		"piercesyringe",
		"sleeper",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_3_POINTS)
	required_experiments = list(/datum/experiment/scanning/reagent/haloperidol)
