/datum/techweb_node/mech_assembly
	id = "mech_assembly"
	starting_node = TRUE
<<<<<<< HEAD
	display_name = "Mech Assembly"
	description = "Development of mech designed to contend with artificial gravity while transporting cargo."
	prereq_ids = list("robotics")
=======
	display_name = "Exosuit Assembly"
	description = "Development of mechanical exosuits designed to contend with artificial gravity while transporting cargo."
	prereq_ids = list(TECHWEB_NODE_ROBOTICS)
>>>>>>> 5e9de4515ba3... Handful of missed mirrors (#3739)
	design_ids = list(
		"mechapower",
		"mech_recharger",
		"ripley_chassis",
		"ripley_torso",
		"ripley_left_arm",
		"ripley_right_arm",
		"ripley_left_leg",
		"ripley_right_leg",
		"ripley_main",
		"ripley_peri",
		"mech_hydraulic_clamp",
	)

/datum/techweb_node/mech_equipment
	id = "mech_equipment"
	display_name = "Expedition Equipment"
<<<<<<< HEAD
	description = "Specialized mech gear tailored for navigating space and celestial bodies, ensuring durability and functionality in the harshest conditions."
	prereq_ids = list("mech_assembly")
=======
	description = "Specialized exosuit gear tailored for navigating space and celestial bodies, ensuring durability and functionality in the harshest conditions."
	prereq_ids = list(TECHWEB_NODE_MECH_ASSEMBLY)
>>>>>>> 5e9de4515ba3... Handful of missed mirrors (#3739)
	design_ids = list(
		"mechacontrol",
		"botpad",
		"botpad_remote",
		"ripleyupgrade",
		"mech_air_tank",
		"mech_thrusters",
		"mech_extinguisher",
		"mecha_camera",
		"mecha_tracking",
		"mech_radio",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_1_POINTS)

/datum/techweb_node/mech_clown
	id = "mech_clown"
	display_name = "Funny Robots"
	description = "Fueled by laughter."
	prereq_ids = list("mech_assembly")
	design_ids = list(
		"honk_chassis",
		"honk_torso",
		"honk_head",
		"honk_left_arm",
		"honk_right_arm",
		"honk_left_leg",
		"honk_right_leg",
		"honker_main",
		"honker_peri",
		"honker_targ",
		"mech_banana_mortar",
		"mech_honker",
		"mech_mousetrap_mortar",
		"mech_punching_face",
		"borg_transform_clown",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_1_POINTS)

/datum/techweb_node/mech_medical
<<<<<<< HEAD
	id = "mech_medical"
	display_name = "Medical Mech"
=======
	id = TECHWEB_NODE_MECH_MEDICAL
	display_name = "Medical Exosuit"
>>>>>>> 5e9de4515ba3... Handful of missed mirrors (#3739)
	description = "Advanced robotic unit equipped with syringe guns and healing beams, revolutionizing medical assistance in hazardous environments."
	prereq_ids = list("mech_assembly", "chem_synthesis")
	design_ids = list(
		"odysseus_chassis",
		"odysseus_torso",
		"odysseus_head",
		"odysseus_left_arm",
		"odysseus_right_arm",
		"odysseus_left_leg",
		"odysseus_right_leg",
		"odysseus_main",
		"odysseus_peri",
		"mech_medi_beam",
		"mech_syringe_gun",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_2_POINTS)

/datum/techweb_node/mech_mining
<<<<<<< HEAD
	id = "mech_mining"
	display_name = "Mining Mech"
	description = "Robust mech engineered to withstand lava and storms for continuous off-station mining operations."
	prereq_ids = list("mech_equipment", "mining")
=======
	id = TECHWEB_NODE_MECH_MINING
	display_name = "Mining Exosuit"
	description = "Robust exosuit engineered to withstand lava and storms for continuous off-station mining operations."
	prereq_ids = list(TECHWEB_NODE_MECH_EQUIPMENT, TECHWEB_NODE_MINING)
>>>>>>> 5e9de4515ba3... Handful of missed mirrors (#3739)
	design_ids = list(
		"clarke_chassis",
		"clarke_torso",
		"clarke_head",
		"clarke_left_arm",
		"clarke_right_arm",
		"clarke_main",
		"clarke_peri",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_2_POINTS)

/datum/techweb_node/mech_combat
<<<<<<< HEAD
	id = "mech_combat"
	display_name = "Combat Mechs"
	description = "Modular armor upgrades and specialized equipment for security mechs."
	prereq_ids = list("mech_equipment")
=======
	id = TECHWEB_NODE_MECH_COMBAT
	display_name = "Combat Exosuits"
	description = "Modular armor upgrades and specialized equipment for security exosuits."
	prereq_ids = list(TECHWEB_NODE_MECH_EQUIPMENT)
>>>>>>> 5e9de4515ba3... Handful of missed mirrors (#3739)
	design_ids = list(
		"mech_ccw_armor",
		"mech_proj_armor",
		"paddyupgrade",
		"mech_hydraulic_claw",
		"mech_disabler",
		"mech_repair_droid",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_2_POINTS)
	required_experiments = list(/datum/experiment/scanning/random/mecha_equipped_scan)
	discount_experiments = list(/datum/experiment/scanning/random/mecha_damage_scan = TECHWEB_TIER_2_POINTS)

/datum/techweb_node/mech_assault
<<<<<<< HEAD
	id = "mech_assault"
	display_name = "Assault Mech"
	description = "Heavy battle mech boasting robust armor but sacrificing speed for enhanced durability."
	prereq_ids = list("mech_combat")
=======
	id = TECHWEB_NODE_MECH_ASSAULT
	display_name = "Assault Exosuits"
	description = "Heavy battle exosuits boasting robust armor but sacrificing speed for enhanced durability."
	prereq_ids = list(TECHWEB_NODE_MECH_COMBAT)
>>>>>>> 5e9de4515ba3... Handful of missed mirrors (#3739)
	design_ids = list(
		"durand_armor",
		"durand_chassis",
		"durand_torso",
		"durand_head",
		"durand_left_arm",
		"durand_right_arm",
		"durand_left_leg",
		"durand_right_leg",
		"durand_main",
		"durand_peri",
		"durand_targ",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_3_POINTS)

/datum/techweb_node/mech_light
<<<<<<< HEAD
	id = "mech_light"
	display_name = "Light Combat Mech"
	description = "Agile combat mech equipped with overclocking capabilities for temporary speed boosts, prioritizing speed over durability on the battlefield."
	prereq_ids = list("mech_combat")
=======
	id = TECHWEB_NODE_MECH_LIGHT
	display_name = "Light Combat Exosuits"
	description = "Agile combat exosuits equipped with overclocking capabilities for temporary speed boosts, prioritizing speed over durability on the battlefield."
	prereq_ids = list(TECHWEB_NODE_MECH_COMBAT)
>>>>>>> 5e9de4515ba3... Handful of missed mirrors (#3739)
	design_ids = list(
		"gygax_armor",
		"gygax_chassis",
		"gygax_torso",
		"gygax_head",
		"gygax_left_arm",
		"gygax_right_arm",
		"gygax_left_leg",
		"gygax_right_leg",
		"gygax_main",
		"gygax_peri",
		"gygax_targ",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_3_POINTS)

/datum/techweb_node/mech_heavy
<<<<<<< HEAD
	id = "mech_heavy"
	display_name = "Heavy Mech"
=======
	id = TECHWEB_NODE_MECH_HEAVY
	display_name = "Heavy Exosuits"
>>>>>>> 5e9de4515ba3... Handful of missed mirrors (#3739)
	description = "Advanced heavy mechanized unit with dual pilot capability, designed for robust battlefield performance and increased tactical versatility."
	prereq_ids = list("mech_assault")
	design_ids = list(
		"savannah_ivanov_armor",
		"savannah_ivanov_chassis",
		"savannah_ivanov_torso",
		"savannah_ivanov_head",
		"savannah_ivanov_left_arm",
		"savannah_ivanov_right_arm",
		"savannah_ivanov_left_leg",
		"savannah_ivanov_right_leg",
		"savannah_ivanov_main",
		"savannah_ivanov_peri",
		"savannah_ivanov_targ",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_4_POINTS)

/datum/techweb_node/mech_infiltrator
<<<<<<< HEAD
	id = "mech_infiltrator"
	display_name = "Infiltration Mech"
	description = "Advanced mech with phasing capabilities, allowing it to move through walls and obstacles, ideal for covert and special operations."
	prereq_ids = list("mech_light", "anomaly_research")
=======
	id = TECHWEB_NODE_MECH_INFILTRATOR
	display_name = "Infiltration Exosuits"
	description = "Advanced exosuit with phasing capabilities, allowing it to move through walls and obstacles, ideal for covert and special operations."
	prereq_ids = list(TECHWEB_NODE_MECH_LIGHT, TECHWEB_NODE_ANOMALY_RESEARCH)
>>>>>>> 5e9de4515ba3... Handful of missed mirrors (#3739)
	design_ids = list(
		"phazon_armor",
		"phazon_chassis",
		"phazon_torso",
		"phazon_head",
		"phazon_left_arm",
		"phazon_right_arm",
		"phazon_left_leg",
		"phazon_right_leg",
		"phazon_main",
		"phazon_peri",
		"phazon_targ",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_4_POINTS)

/datum/techweb_node/mech_energy_guns
<<<<<<< HEAD
	id = "mech_energy_guns"
	display_name = "Mech Energy Guns"
	description = "Scaled-up versions of electric weapons optimized for mech deployment."
	prereq_ids = list("mech_combat", "electric_weapons")
=======
	id = TECHWEB_NODE_MECH_ENERGY_GUNS
	display_name = "Exosuit Energy Guns"
	description = "Scaled-up versions of electric weapons optimized for exosuit deployment."
	prereq_ids = list(TECHWEB_NODE_MECH_COMBAT, TECHWEB_NODE_ELECTRIC_WEAPONS)
>>>>>>> 5e9de4515ba3... Handful of missed mirrors (#3739)
	design_ids = list(
		"mech_laser",
		"mech_laser_heavy",
		"mech_ion",
		"mech_tesla",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_4_POINTS)

/datum/techweb_node/mech_firearms
<<<<<<< HEAD
	id = "mech_firearms"
	display_name = "Mech Firearms"
=======
	id = TECHWEB_NODE_MECH_FIREARMS
	display_name = "Exosuit Firearms"
>>>>>>> 5e9de4515ba3... Handful of missed mirrors (#3739)
	description = "Mounted ballistic weaponry, enhancing combat capabilities for mechanized units."
	prereq_ids = list("mech_energy_guns", "exotic_ammo")
	design_ids = list(
		"mech_lmg",
		"mech_lmg_ammo",
		"mech_scattershot",
		"mech_scattershot_ammo",
		"mech_carbine",
		"mech_carbine_ammo",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_5_POINTS)

/datum/techweb_node/mech_heavy_arms
<<<<<<< HEAD
	id = "mech_heavy_arms"
	display_name = "Heavy Mech Firearms"
=======
	id = TECHWEB_NODE_MECH_HEAVY_ARMS
	display_name = "Heavy Exosuit Firearms"
>>>>>>> 5e9de4515ba3... Handful of missed mirrors (#3739)
	description = "High-impact weaponry integrated into mechs, optimized for maximum firepower."
	prereq_ids = list("mech_heavy", "exotic_ammo")
	design_ids = list(
		"clusterbang_launcher",
		"clusterbang_launcher_ammo",
		"mech_grenade_launcher",
		"mech_grenade_launcher_ammo",
		"mech_missile_rack",
		"mech_missile_rack_ammo",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_5_POINTS)

/datum/techweb_node/mech_equip_bluespace
<<<<<<< HEAD
	id = "mech_equip_bluespace"
	display_name = "Bluespace Mech Equipment"
=======
	id = TECHWEB_NODE_BLUESPACE
	display_name = "Bluespace Exosuit Equipment"
>>>>>>> 5e9de4515ba3... Handful of missed mirrors (#3739)
	description = "An array of equipment empowered by bluespace, providing unmatched mobility and utility."
	prereq_ids = list("mech_infiltrator", "bluespace_travel")
	design_ids = list(
		"mech_gravcatapult",
		"mech_teleporter",
		"mech_wormhole_gen",
		"mech_rcd",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_5_POINTS)
