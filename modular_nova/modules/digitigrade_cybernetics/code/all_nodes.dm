//digitigrade research

/datum/techweb_node/digitigrade_cyber
	id = TECHWEB_NODE_CYBERNETICS_DIGITIGRADE
	display_name = "Digitigrade Cybernetics"
	description = "Specialized cybernetic limb designs. The shortening of the femur is surely the result of mechanical optimization."
<<<<<<< HEAD
	prereq_ids = list("base")
=======
	prereq_ids = list(TECHWEB_NODE_ROBOTICS)
>>>>>>> ec9334aac85... [MIRROR] Techweb nodes DEFINED & bug fix [MDB IGNORE] (#3319)
	design_ids = list(
		"digitigrade_cyber_l_leg",
		"digitigrade_cyber_r_leg",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1000)


/datum/techweb_node/adv_digitigrade_cyber
	id = TECHWEB_NODE_CYBERNETICS_DIGITIGRADE_ADVANCED
	display_name = "Advanced Digitigrade Cybernetics"
	description = "A step above consumer-grade digitigrade models, these have self-sharpening claws for destroying your footwear much faster."
<<<<<<< HEAD
	prereq_ids = list("adv_robotics", "digitigrade_cyber")
=======
	prereq_ids = list(TECHWEB_NODE_AUGMENTATION)
>>>>>>> ec9334aac85... [MIRROR] Techweb nodes DEFINED & bug fix [MDB IGNORE] (#3319)
	design_ids = list(
		"digitigrade_advanced_l_leg",
		"digitigrade_advanced_r_leg",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 500)
