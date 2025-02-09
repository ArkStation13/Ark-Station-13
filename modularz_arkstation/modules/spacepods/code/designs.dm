/datum/techweb_node/pods_basic
	id = "pods_basic"
	display_name = "Basic Space Pods"
	description = "To Space!"
	starting_node = TRUE
	prereq_ids = list()
	design_ids = list(
		"spacefab",
		"spacepod_basic",
		"raptor_main",
		"raptor_peri",
		"spacepod_plate_basic",
		"spacepod_plate_sci",
		"spacepod_plate_sec"
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 5000)

/datum/design/board/podfab
	name = "Space Pod Fabricator Board"
	desc = "The circuit board for an Space Pod Fabricator."
	id = "spacefab"
	build_path = /obj/item/circuitboard/machine/podfabricator
	materials = list(/datum/material/glass =HALF_SHEET_MATERIAL_AMOUNT*2)
	category = list(
		RND_CATEGORY_MACHINE + RND_SUBCATEGORY_MACHINE_FAB
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE | DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/spacepodbase
	name = "Space Pod Hull"
	desc = "The body of the Space Pod, the basis for the rest of the parts."
	id = "spacepod_basic"
	build_type = POD_FABRICATOR
	build_path = /obj/item/pods_parts/hull
	materials = list(/datum/material/iron=SHEET_MATERIAL_AMOUNT*50, /datum/material/glass=SHEET_MATERIAL_AMOUNT*10, /datum/material/silver=SHEET_MATERIAL_AMOUNT*5, /datum/material/gold=SHEET_MATERIAL_AMOUNT*5)
	construction_time = 100
	category = list(
		RND_CATEGORY_PODFAB_RAPTOR
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE | DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/spacepod_main
	name = "Space Pod Central Control module"
	desc = "Allows for the construction of a \"Raptor\" Central Control module."
	id = "raptor_main"
	build_type = POD_FABRICATOR
	build_path = /obj/item/circuitboard/mecha/spacepod_main
	materials = list(/datum/material/glass =HALF_SHEET_MATERIAL_AMOUNT*5)
	category = list(
		RND_CATEGORY_PODFAB_RAPTOR + RND_SUBCATEGORY_PODFAB_PLATI
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE | DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/spacepod_peri
	name = "Space Pod Peripherals Control module"
	desc = "Allows for the construction of a \"Raptor\" Peripheral Control module."
	id = "raptor_peri"
	build_type = POD_FABRICATOR
	build_path = /obj/item/circuitboard/mecha/spacepod_peri
	materials = list(/datum/material/glass =HALF_SHEET_MATERIAL_AMOUNT*5)
	category = list(
		RND_CATEGORY_PODFAB_RAPTOR + RND_SUBCATEGORY_PODFAB_PLATI
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE | DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/plate_basic
	name = "Space Pod Standart Plate"
	desc = "The Standart Armor Plate of the Space Pod."
	id = "spacepod_plate_basic"
	build_type = POD_FABRICATOR
	build_path = /obj/item/pods_parts/plate/basic
	materials = list(/datum/material/iron=SHEET_MATERIAL_AMOUNT*20)
	construction_time = 100
	category = list(
		RND_CATEGORY_PODFAB_RAPTOR + RND_SUBCATEGORY_PODFAB_PLATES
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE | DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/plate_sci
	name = "Space Pod Explorer Plate"
	desc = "The Science Armor Plate of the Space Pod. For Vanguard!"
	id = "spacepod_plate_sci"
	build_type = POD_FABRICATOR
	build_path = /obj/item/pods_parts/plate/sci
	materials = list(/datum/material/iron=SHEET_MATERIAL_AMOUNT*30)
	construction_time = 100
	category = list(
		RND_CATEGORY_PODFAB_RAPTOR + RND_SUBCATEGORY_PODFAB_PLATES
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE | DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/plate_sec
	name = "Space Pod Security Plate"
	desc = "The Science Armor Plate of the Space Pod. For Vanguard!"
	id = "spacepod_plate_sec"
	build_type = POD_FABRICATOR
	build_path = /obj/item/pods_parts/plate/sec
	materials = list(/datum/material/iron=SHEET_MATERIAL_AMOUNT*30, /datum/material/titanium=SHEET_MATERIAL_AMOUNT*10)
	construction_time = 100
	category = list(
		RND_CATEGORY_PODFAB_RAPTOR + RND_SUBCATEGORY_PODFAB_PLATES
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE | DEPARTMENT_BITFLAG_ENGINEERING

/obj/item/pods_parts/plate/sec
