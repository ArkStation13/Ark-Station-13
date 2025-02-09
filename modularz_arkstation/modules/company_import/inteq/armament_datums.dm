// Старые пушки Терры, оставшиеся со времен Гражданской Войны в Старой Империи между НРИ и СолФедов.
/datum/cargo_company/inteq
	name = INTEQ_WEAPONS_NAME
	company_flag = CARGO_COMPANY_INTEQ_WEAPONS
	cost = 6000
	cost_change_lower = -1000
	cost_change_upper = 4000
	can_roundstart_pick = FALSE

//
/datum/armament_entry/company_import/inteq
	category = INTEQ_WEAPONS_NAME
	company_bitflag = CARGO_COMPANY_INTEQ_WEAPONS
	cost = PAYCHECK_COMMAND * 4

/// ПП ///
/datum/armament_entry/company_import/inteq/submachine_guns
	subcategory = "Submachine Guns"
	cost = PAYCHECK_COMMAND * 8
//////////

// МП5
/datum/armament_entry/company_import/inteq/submachine_guns/mp5
	name = "SPG-Q-5 submachune gun"
	item_type = /obj/item/gun/ballistic/automatic/mp5
// Бизон Интекью
/datum/armament_entry/company_import/inteq/submachine_guns/bison
	name = "SPG-Q-19 Bizon submachune gun"
	item_type = /obj/item/gun/ballistic/automatic/bison
// П90 - Петух
/datum/armament_entry/company_import/inteq/submachine_guns/p90
	name = "SPG-Q-90 submachune gun"
	item_type = /obj/item/gun/ballistic/automatic/p90
// ППШ
/datum/armament_entry/company_import/inteq/submachine_guns/ppsh_modern
	name = "SPG-Q-79 submachune gun"
	item_type = /obj/item/gun/ballistic/automatic/ppsh/modern

/// Штурмовые Винтовки //
/datum/armament_entry/company_import/inteq/assault_rifles
	subcategory = "Assault Rifles"
	cost = PAYCHECK_COMMAND * 12
/////////////////////////

// Калашников 74
/datum/armament_entry/company_import/inteq/assault_rifles/ak74
	name = "KR-Q-74 carbine"
	item_type = /obj/item/gun/ballistic/automatic/akm
// Калашников 12
/datum/armament_entry/company_import/inteq/assault_rifles/ak19
	name = "KR-Q-19 carbine"
	cost = PAYCHECK_COMMAND * 14
	item_type = /obj/item/gun/ballistic/automatic/akm/modern
// Калашников Гражданский
/datum/armament_entry/company_import/inteq/assault_rifles/ak_civ
	name = "TR-Q-12 carbine"
	cost = PAYCHECK_COMMAND * 8
	item_type = /obj/item/gun/ballistic/automatic/akm/civvie
// М-16
/datum/armament_entry/company_import/inteq/assault_rifles/m16
	name = "XM-2537 rifle"
	item_type = /obj/item/gun/ballistic/automatic/m16
// М-16 Короткий
/datum/armament_entry/company_import/inteq/assault_rifles/m16_short
	name = "XM-2537-SH rifle"
	item_type = /obj/item/gun/ballistic/automatic/m16/modern/v2
// Скар-Л
/datum/armament_entry/company_import/inteq/assault_rifles/scar
	name = "SCAR-L rifle"
	item_type = /obj/item/gun/ballistic/automatic/scar
// ФГ-42
/datum/armament_entry/company_import/inteq/assault_rifles/fg42
	name = "LBR-90 rifle"
	item_type = /obj/item/gun/ballistic/automatic/fg42

/// Пулемёты ///
/datum/armament_entry/company_import/inteq/machineguns
	subcategory = "Machineguns"
	cost = PAYCHECK_COMMAND * 16
////////////////

// МГ34
/datum/armament_entry/company_import/inteq/machineguns/mg34
	name = "MGQ-62 machinegun"
	item_type = /obj/item/gun/ballistic/automatic/mg34
// МГ42
/datum/armament_entry/company_import/inteq/machineguns/mg42
	name = "MGQ-64V machinegun"
	item_type = /obj/item/gun/ballistic/automatic/mg34/mg42

/// Патроны ///
/datum/armament_entry/company_import/inteq/ammo
	subcategory = "Ammo"
	cost = PAYCHECK_CREW * 3
///////////////

//
/datum/armament_entry/company_import/inteq/ammo/mp5_lethal
	name = "SPG-Q-5 magazine (Lethal)"
	item_type = /obj/item/ammo_box/magazine/mp5
//
/datum/armament_entry/company_import/inteq/ammo/bison_lethal
	name = "SPG-Q-19 Bizon magazine (Lethal)"
	item_type = /obj/item/ammo_box/magazine/bison
//
/datum/armament_entry/company_import/inteq/ammo/p90_lethal
	name = "SPG-Q-90 magazine (Lethal)"
	item_type = /obj/item/ammo_box/magazine/p90
//
/datum/armament_entry/company_import/inteq/ammo/ppsh_lethal
	name = "SPG-Q-79 magazine (Lethal)"
	item_type = /obj/item/ammo_box/magazine/ppsh
//
/datum/armament_entry/company_import/inteq/ammo/akm_lethal
	name = "KR-Q magazine (Lethal)"
	item_type = /obj/item/ammo_box/magazine/akm
//
/datum/armament_entry/company_import/inteq/ammo/akm_extended
	name = "KR-Q magazine (Extended-Lethal)"
	item_type = /obj/item/ammo_box/magazine/akm/banana
	cost = PAYCHECK_CREW * 4
//
/datum/armament_entry/company_import/inteq/ammo/akm_ricochet
	name = "KR-Q magazine (Match)"
	item_type = /obj/item/ammo_box/magazine/akm/ricochet
	cost = PAYCHECK_CREW * 4
//
/datum/armament_entry/company_import/inteq/ammo/akm_fire
	name = "KR-Q magazine (Incendiary)"
	item_type = /obj/item/ammo_box/magazine/akm/fire
	cost = PAYCHECK_CREW * 4
//
/datum/armament_entry/company_import/inteq/ammo/akm_ap
	name = "KR-Q magazine (Armor-Piercieng)"
	item_type = /obj/item/ammo_box/magazine/akm/ap
	cost = PAYCHECK_CREW * 4
//
/datum/armament_entry/company_import/inteq/ammo/akm_emp
	name = "KR-Q magazine (EMP)"
	item_type = /obj/item/ammo_box/magazine/akm/emp
	cost = PAYCHECK_CREW * 5
//
/datum/armament_entry/company_import/inteq/ammo/akm_rubber
	name = "KR-Q magazine (Rubber)"
	item_type = /obj/item/ammo_box/magazine/akm/rubber
	cost = PAYCHECK_CREW * 2
//
/datum/armament_entry/company_import/inteq/ammo/akm_civ
	name = "TR-Q-12 magazine (Civilian)"
	item_type = /obj/item/ammo_box/magazine/akm/civvie
//
/datum/armament_entry/company_import/inteq/ammo/m16
	name = "XM-2537 magazine (Lethal)"
	item_type = /obj/item/ammo_box/magazine/m16
//
/datum/armament_entry/company_import/inteq/ammo/m16_short
	name = "XM-2537-SH drum magazine (Lethal)"
	item_type = /obj/item/ammo_box/magazine/m16/patriot
//
/datum/armament_entry/company_import/inteq/ammo/scar
	name = "SCAR-L magazine (Lethal)"
	item_type = /obj/item/ammo_box/magazine/scar
//
/datum/armament_entry/company_import/inteq/ammo/fg42
	name = "LBR-90 magazine (Lethal)"
	item_type = /obj/item/ammo_box/magazine/fg42
//
/datum/armament_entry/company_import/inteq/ammo/mg34
	name = "MGQ-62 drum magazine (Lethal)"
	item_type = /obj/item/ammo_box/magazine/mg34
	cost = PAYCHECK_CREW * 3
//
/datum/armament_entry/company_import/inteq/ammo/mg42
	name = "MGQ-64V drum magazine (Lethal)"
	item_type = /obj/item/ammo_box/magazine/mg42
	cost = PAYCHECK_CREW * 4
