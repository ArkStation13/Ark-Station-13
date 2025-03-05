/obj/item/armor_plate // База для остального
	name = "DEBUG armor plate naming (Report This)"
	desc = "DEBUG armor plate description (Report This)"
	icon = 'modularz_arkstation/modules/modular_armor/icons/armor_plates.dmi'
	icon_state = "armor_plate-standart-1"
	base_icon_state = "armor_plate"

	armor_type = /datum/armor/vest_armor_plate

	/// Классификация плиты для иконки.
	var/icon_naming = "standart"
	/// Иконка плиты по степени повреждения | 1 - Стандартная чиненая плита | 2 - Сломана на 15-24% | 3 - Сломана на 26-50% | 4 - Сломана на 51-75% | 5 - Сломана на 76-99% | 6 - Сломана полностью - 100%.
	var/plate_integrity_icon = 1
	/// Количество ХП у пластины. 100 = 100%.
	var/plate_integrity = 100
	var/plate_max_integrity = 100
	/// Модификатор урона по плите (Больше - ХП быстрее тратится. Меньше - ХП медленнее тратится).
	var/plate_damage_multiplier = 0.5
	/// Сломана ли плита в данный момент? | TRUE если сломана на 100% - (plate_integrity = 0).
	var/is_broken = FALSE

/obj/item/armor_plate/update_icon_state()
	if(is_broken == TRUE)
		plate_integrity_icon = 6
	switch(plate_integrity)
		if(86 to 100)
			plate_integrity_icon = 1
		if(76 to 85)
			plate_integrity_icon = 2
		if(51 to 75)
			plate_integrity_icon = 3
		if(26 to 50)
			plate_integrity_icon = 4
		if(1 to 25)
			plate_integrity_icon = 5
	icon_state = "[base_icon_state]-[icon_naming]-[plate_integrity_icon]"
	return ..()

/obj/item/armor_plate/proc/try_broke_the_plate()
	if(plate_integrity <= 0)
		is_broken = TRUE
		update_icon()
		return TRUE
	else if(plate_integrity <= 0)
		stack_trace("The armor plate's health has dropped below 0! This is impossible. Check the code of: [type]")
		qdel(src)
		return FALSE
	return FALSE

/datum/armor/vest_armor_plate
	acid = 10
	bio = 10
	bomb = 10
	bullet = 0
	consume = 0
	energy = 0
	laser = 0
	fire = 0
	melee = 10
	wound = 10

/*
*-* Бронежилет, он же плитник, в который можно сувать сами плиты и цеплять к нему наколенники, налокотники и т.д.
*/

/obj/item/clothing/suit/armor/vest/modular
	name = "standart plate carrier 'Plitnik RH-3'"
	desc = "The 'Red Hawks' plate carrier, which allows you to attach armor plates and additional equipment, such as elbow pads, knee pads, pouches and a harness for equipment. It almost has no protection by itself."
	icon = 'modularz_arkstation/modules/modular_armor/icons/obj/plate_carrier.dmi'
	worn_icon = 'modularz_arkstation/modules/modular_armor/icons/mob/plate_carrier.dmi'
	icon_state = "plate_carrier-sec"
	inhand_icon_state = "armor"
	armor_type = /datum/armor/vest_armor_plate
	body_parts_covered = CHEST
	only_functional = TRUE

	var/list/modular_slots = list(
		"front_slot" = null,
		"elbows_slot" = null,
		"knees_slot" = null,
		"groin_slot" = null,
		"chevron" = null,
		"gorget" = null
	)

	var/obj/item/armor_plate/armor_plate = null

///
/obj/item/clothing/suit/armor/vest/modular/security
	modular_slots = list(
		"front_slot" = /obj/item/modular_armor/loading_vest,
		"elbows_slot" = /obj/item/modular_armor/elbow_pads,
		"knees_slot" = /obj/item/modular_armor/knee_pads,
		"groin_slot" = /obj/item/modular_armor/groin_armor,
		"chevron" = /obj/item/modular_armor/chevron,
		"gorget" = /obj/item/modular_armor/gorget
	)

	armor_plate = /obj/item/armor_plate/standart_security

/obj/item/clothing/suit/armor/vest/modular/examine(mob/user)
	. = ..()
	if(armor_plate)
		. += span_notice("<b>[armor_plate]</b> has next integrity: <b>[armor_plate.plate_integrity]%</b><br>")

/// Добавление модулей или плиты на плитник.
/obj/item/clothing/suit/armor/vest/modular/attackby(obj/item/attacking_item, mob/living/user)
	if(istype(attacking_item, /obj/item/armor_plate))
		var/obj/item/armor_plate/plate = attacking_item
		if(!armor_plate)
			armor_plate = plate
			plate.forceMove(src)
			set_armor(plate.armor_type)
			return

	if(istype(attacking_item, /obj/item/modular_armor))
		var/obj/item/modular_armor/module = attacking_item
		if(!(modular_slots[module.plate_carrier_used_slot]))
			update_modules_on_armor(module, TRUE, user)
			return
	return ..()

/// Обновление модулей (будь то удаление или добавление).
/obj/item/clothing/suit/armor/vest/modular/proc/update_modules_on_armor(obj/item/modular_armor/module, added_or_removed = TRUE, mob/living/user)
	if(added_or_removed == TRUE)
		modular_slots[module.plate_carrier_used_slot] = module
		module.forceMove(src)
		if(module == modular_slots[module.plate_carrier_used_slot])
			armor.add_other_armor(module.armor_type)
			body_parts_covered |= module.body_parts_covered
	else
		if(module == modular_slots[module.plate_carrier_used_slot])
			body_parts_covered &= ~module.body_parts_covered
			armor.subtract_other_armor(module.armor_type)
			modular_slots[module.plate_carrier_used_slot] = null
			user.put_in_active_hand(module)

/// Другое
/obj/item/clothing/suit/armor/vest/modular/click_alt(mob/user)
	if(armor_plate || modular_slots)
		var/tgui_answer = tgui_alert(user, "Remove the Plate or Modules?", "Your option", list("Plate", "Modules"))
		if(tgui_answer == "Plate")
			if(armor_plate)
				user.put_in_active_hand(armor_plate)
				set_armor(initial(armor_type))
				armor_plate = null
				return CLICK_ACTION_SUCCESS
		else
			var/list/choices = list()
			for (var/key in modular_slots)
				var/value = modular_slots[key]
				if(value)
					choices += value
			var/picked_option = show_radial_menu(user, user, choices, require_near = TRUE)
			if(picked_option)
				update_modules_on_armor(picked_option, FALSE, user)
			return CLICK_ACTION_SUCCESS
	..()

/*
*-* Основа для модулей.
*/

/obj/item/modular_armor
	name = "DEBUG modular armor naming (Report This)"
	desc = "DEBUG modular armor description (Report This)"
	icon = 'modularz_arkstation/modules/modular_armor/icons/obj/modular_armor.dmi'
	worn_icon = 'modularz_arkstation/modules/modular_armor/icons/mob/modular_armor.dmi'
	icon_state = "null"
	body_parts_covered = CHEST
	armor_type = /datum/armor/modular_armor

	/// (back_slot, front_slot, elbows_slot, knees_slot, groin_slot, etc.)
	var/plate_carrier_used_slot = null
	/// Количество ХП у модуля. 100 = 100%. Ставьте -1 чтобы сделать нерушимыми.
	var/modular_armor_integrity = -1
	var/modular_armor_max_integrity = -1

/datum/armor/modular_armor
	acid = 10
	bio = 10
	bomb = 10
	bullet = 0
	consume = 0
	energy = 0
	laser = 0
	fire = 0
	melee = 10
	wound = 10

/*
*-* Разгрузка. У разных - разнок кол-во слотов.
*/

/obj/item/modular_armor/loading_vest
	name = "load-bearing vest"
	desc = "Standard two-slot load-bearing vest."
	icon_state = "loading_vest-sec"
	plate_carrier_used_slot = "front_slot"
	armor_type = /datum/armor/modular_armor/loading_vest

	var/vest_slots = 2

/datum/armor/modular_armor/loading_vest
	acid = 10
	bio = 10
	bomb = 10
	bullet = 5
	consume = 0
	energy = 0
	laser = 0
	fire = 5
	melee = 5
	wound = 5

/*
*-* Налокотники. Модуль для плитника, защищающий руки (не ладошки).
*/

/obj/item/modular_armor/elbow_pads
	name = "plastic elbow pads"
	desc = "Standart police elbow pads."
	icon_state = "elbow_pads-sec"
	plate_carrier_used_slot = "elbows_slot"
	body_parts_covered = ARMS
	armor_type = /datum/armor/modular_armor/elbow_pads

/datum/armor/modular_armor/elbow_pads
	acid = 10
	bio = 10
	bomb = 10
	bullet = 10
	consume = 0
	energy = 10
	laser = 10
	fire = 10
	melee = 10
	wound = 10

/*
*-* Наколенники. Модуль для плитника, защищающий ноги (не ступни).
*/

/obj/item/modular_armor/knee_pads
	name = "plastic knee pads"
	desc = "Standart police knee pads."
	icon_state = "knee_pads-sec"
	plate_carrier_used_slot = "knees_slot"
	body_parts_covered = LEGS
	armor_type = /datum/armor/modular_armor/knee_pads

/datum/armor/modular_armor/knee_pads
	acid = 10
	bio = 10
	bomb = 10
	bullet = 10
	consume = 0
	energy = 10
	laser = 10
	fire = 10
	melee = 10
	wound = 10

/*
*-* Защита паха. Напашник.
*/

/obj/item/modular_armor/groin_armor
	name = "plastic groin armor"
	desc = "Police groin armor. Doesn't look like anything serious."
	icon_state = "groin-sec"
	plate_carrier_used_slot = "groin_slot"
	body_parts_covered = GROIN
	armor_type = /datum/armor/modular_armor/groin_armor

/datum/armor/modular_armor/groin_armor
	acid = 10
	bio = 10
	bomb = 10
	bullet = 5
	consume = 0
	energy = 0
	laser = 0
	fire = 5
	melee = 5
	wound = 5


/*
*-* Шеврон. Вешается как на шлема, так и на броню.
*/

/obj/item/modular_armor/chevron
	name = "'Red Hawks' chevron"
	desc = "Red chevron with Hawk on it."
	icon_state = "chevron-rh"
	plate_carrier_used_slot = "chevron"
	armor_type = /datum/armor/none

/*
*-* Горжет. Защита горла.
*/

/obj/item/modular_armor/gorget
	name = "plastic gorget"
	desc = "Police gorget. Doesn't look like anything serious."
	icon_state = "gorget-sec"
	plate_carrier_used_slot = "gorget"
	body_parts_covered = NECK
	armor_type = /datum/armor/modular_armor/gorget

/datum/armor/modular_armor/gorget
	acid = 10
	bio = 10
	bomb = 10
	bullet = 5
	consume = 0
	energy = 0
	laser = 0
	fire = 5
	melee = 5
	wound = 5
