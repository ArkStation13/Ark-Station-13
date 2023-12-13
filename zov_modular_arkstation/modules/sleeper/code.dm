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

/datum/techweb_node/adv_biotech
	id = "adv_biotech"
	display_name = "Advanced Biotechnology"
	description = "Advanced Biotechnology"
	prereq_ids = list("biotech")
	design_ids = list(
		"autopsyscanner",
		"crewpinpointer",
		"defibrillator_compact",
		"harvester",
		"healthanalyzer_advanced",
		"holobarrier_med",
		"limbgrower",
		"meta_beaker",
		"ph_meter",
		"piercesyringe",
		"plasmarefiller",
		"smoke_machine",
		"sleeper" // ARK STATION EDIT
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 5000)
	required_experiments = list(/datum/experiment/autopsy/nonhuman)
	discount_experiments = list(/datum/experiment/scanning/random/material/meat = 4000)
