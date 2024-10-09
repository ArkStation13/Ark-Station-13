/datum/armament_entry/company_import/microstar/basic_energy_long_weapons/basic_mcr
	item_type = /obj/item/gun/microfusion/mcr01
	cost = PAYCHECK_COMMAND * 4

// Preset 'loadout' kits built around a barrel attachment

/datum/armament_entry/company_import/microstar/mcr_attachments
	subcategory = "Microfusion Attachment Kits"
	cost = PAYCHECK_COMMAND * 4

/datum/armament_entry/company_import/microstar/mcr_attachments/hellfire
	name = "microfusion hellfire kit"
	item_type = /obj/item/storage/briefcase/secure/white/mcr_loadout/hellfire

/datum/armament_entry/company_import/microstar/mcr_attachments/scatter
	name = "microfusion scatter kit"
	item_type = /obj/item/storage/briefcase/secure/white/mcr_loadout/scatter

/datum/armament_entry/company_import/microstar/mcr_attachments/lance
	name = "microfusion lance kit"
	item_type = /obj/item/storage/briefcase/secure/white/mcr_loadout/lance

/datum/armament_entry/company_import/microstar/mcr_attachments/repeater
	name = "microfusion repeater kit"
	item_type = /obj/item/storage/briefcase/secure/white/mcr_loadout/repeater

/datum/armament_entry/company_import/microstar/mcr_attachments/tacticool
	name = "microfusion suppressor kit"
	item_type = /obj/item/storage/briefcase/secure/white/mcr_loadout/tacticool

// Improved phase emitters, cells, and cell attachments

/datum/armament_entry/company_import/microstar/mcr_upgrades
	subcategory = "Microfusion Upgrade Kits"

/datum/armament_entry/company_import/microstar/mcr_upgrades/stabilizer
	item_type = /obj/item/microfusion_cell_attachment/stabiliser
	cost = PAYCHECK_COMMAND

/datum/armament_entry/company_import/microstar/mcr_upgrades/enhanced_part_kit
	name = "microfusion enhanced parts"
	item_type = /obj/item/storage/briefcase/secure/white/mcr_parts/enhanced
	cost = PAYCHECK_COMMAND * 2

/datum/armament_entry/company_import/microstar/mcr_upgrades/capacity_booster
	item_type = /obj/item/microfusion_cell_attachment/overcapacity
	cost = PAYCHECK_COMMAND

/datum/armament_entry/company_import/microstar/mcr_upgrades/advanced_part_kit
	name = "microfusion advanced parts"
	item_type = /obj/item/storage/briefcase/secure/white/mcr_parts/advanced
	cost = PAYCHECK_COMMAND * 2

/datum/armament_entry/company_import/microstar/mcr_upgrades/selfcharge
	item_type = /obj/item/microfusion_cell_attachment/selfcharging
	cost = PAYCHECK_COMMAND * 4

/datum/armament_entry/company_import/microstar/mcr_upgrades/bluespace_part_kit
	name = "microfusion bluespace parts"
	item_type = /obj/item/storage/briefcase/secure/white/mcr_parts/bluespace
	cost = PAYCHECK_COMMAND * 6
