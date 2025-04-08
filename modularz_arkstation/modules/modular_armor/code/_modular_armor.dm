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
	armor = NONE

	var/list/modular_slots = list(
		/obj/item/modular_armor/front = null,
		/obj/item/modular_armor/elbow = null,
		/obj/item/modular_armor/knee = null,
		/obj/item/modular_armor/groin = null,
		/obj/item/modular_armor/chevron = null,
		/obj/item/modular_armor/gorget = null
	)

	var/obj/item/armor_plate/armor_plate = null

	var/mutable_appearance/modules_overlays = list()

///
/obj/item/clothing/suit/armor/vest/modular/examine(mob/user)
	. = ..()
	if(armor_plate)
		. += span_notice("<b>[armor_plate]</b> has next integrity: <b>[armor_plate.plate_integrity]%</b><br>")

/obj/item/clothing/suit/armor/vest/modular/examine_more(mob/user)
	. = ..()
	. += span_notice("<i>You examine [src] closer, and note the following...</i>")
	var/list/attached_modules = list()
	for(var/key in modular_slots)
		var/value = modular_slots[key]
		if(value)
			attached_modules += value

	. += span_notice("The [src] [length(attached_modules) ? "has [english_list(attached_modules)]" : "doesn't have any"] module[length(attached_modules) > 1 ? "s" : ""] attached.")

/obj/item/clothing/suit/armor/vest/modular/attackby(obj/item/attacking_item, mob/living/user)
	if(istype(attacking_item, /obj/item/armor_plate))
		var/obj/item/armor_plate/plate = attacking_item
		if(!armor_plate)
			armor_plate = plate
			plate.forceMove(src)
			if(src.armor)
				var/datum/armor/current_armor = src.armor
				var/datum/armor/armor_plate_armor = new armor_plate.armor_type
				set_armor(current_armor.add_other_armor(armor_plate_armor))
			else
				set_armor(armor_plate.armor_type)
			return

	if(istype(attacking_item, /obj/item/modular_armor))
		var/obj/item/modular_armor/module = attacking_item
		if(try_attach_module(user, module))
			balloon_alert(user, "attached")
	return ..()

/obj/item/clothing/suit/armor/vest/modular/proc/try_attach_module(mob/user, obj/item/modular_armor/module)
	if(!module || !istype(module, /obj/item/modular_armor))
		return FALSE

	var/module_type = module.type
	for(var/slot_type in modular_slots)
		if(!ispath(module_type, slot_type) || !istype(module, slot_type))
			continue

		if(modular_slots[slot_type])
			to_chat(user, span_warning("This slot is already occupied!"))
			return FALSE

		to_chat(user, span_notice("You attach the [module] to the [src]."))
		module.forceMove(src)
		modular_slots[slot_type] = module
		body_parts_covered |= module.body_parts_covered
		update_module_overlay(module, TRUE)

		if(src.armor)
			var/datum/armor/current_armor = src.armor
			var/datum/armor/module_armor = new module.armor_type
			set_armor(current_armor.add_other_armor(module_armor))
		else
			set_armor(module.armor_type)

		return TRUE
	balloon_alert(user, "doesn't fit!")
	return FALSE

/obj/item/clothing/suit/armor/vest/modular/proc/try_detatch_module(mob/user, obj/item/modular_armor/module)
	if(!module)
		return FALSE

	var/found_slot = null
	for(var/slot in modular_slots)
		if(modular_slots[slot] == module)
			found_slot = slot
			break

	if(!found_slot)
		return FALSE

	body_parts_covered &= ~module.body_parts_covered

	if(src.armor)
		var/datum/armor/current_armor = src.armor
		var/datum/armor/module_armor = new module.armor_type
		set_armor(current_armor.subtract_other_armor(module_armor))

	modular_slots[found_slot] = null
	user.put_in_active_hand(module)
	update_module_overlay(module, FALSE)
	return TRUE

/// Другое
/obj/item/clothing/suit/armor/vest/modular/click_alt(mob/user)
	if(!armor_plate && !length(modular_slots))
		return ..()

	var/option = tgui_alert(user, "Remove the Plate or Modules?", "Your option", list("Plate", "Modules"))
	if(!option)
		return

	if(option == "Plate")
		if(!armor_plate)
			balloon_alert(user, "nothing attached!")
			return

		if(src.armor)
			var/datum/armor/current_armor = src.armor
			var/datum/armor/armor_plate_armor = new armor_plate.armor_type
			set_armor(current_armor.subtract_other_armor(armor_plate_armor))

		user.put_in_active_hand(armor_plate)
		armor_plate = null
		balloon_alert(user, "detached")
		return CLICK_ACTION_SUCCESS
	else
		var/list/choices_list = list()
		for(var/key in modular_slots)
			var/obj/item/modular_armor/value = modular_slots[key]
			if(value)
				var/image/module_image = image(icon = value.icon, icon_state = value.icon_state)
				choices_list[value] = module_image

		if(!length(choices_list))
			balloon_alert(user, "nothing attached!")
			return

		var/obj/item/modular_armor/picked_module = show_radial_menu(user, src, choices_list, require_near = TRUE)
		if(!picked_module)
			return

		if(try_detatch_module(user, picked_module))
			balloon_alert(user, "detached")
			return CLICK_ACTION_SUCCESS
		else
			return CLICK_ACTION_BLOCKING

/// Создаём оверлеи
/obj/item/clothing/suit/armor/vest/modular/proc/create_module_overlay(obj/item/modular_armor/module, attached_or_detached)
	var/mutable_appearance/new_overlay = mutable_appearance(module.worn_icon, module.icon_state)
	if(attached_or_detached == TRUE)
		modules_overlays += new_overlay
	else
		modules_overlays -= new_overlay

/obj/item/clothing/suit/armor/vest/modular/proc/update_module_overlay(obj/item/modular_armor/module, attached_or_detached)
	cut_overlay(modules_overlays)
	create_module_overlay(module, attached_or_detached)
	update_icon(UPDATE_OVERLAYS)

/obj/item/clothing/suit/armor/vest/modular/update_overlays()
	. = ..()
	if(modules_overlays)
		. += modules_overlays

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
*-* Разгрузка/Так.мешки. У разных - разнок кол-во слотов.
*/

/obj/item/modular_armor/front
	name = "security pouches"
	desc = "Standard two-slot pouches."
	icon_state = "loading_vest-sec"
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

/obj/item/modular_armor/elbow
	name = "plastic elbow pads"
	desc = "Standart police elbow pads."
	icon_state = "elbow_pads-sec"
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

/obj/item/modular_armor/knee
	name = "plastic knee pads"
	desc = "Standart police knee pads."
	icon_state = "knee_pads-sec"
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

/obj/item/modular_armor/groin
	name = "plastic groin armor"
	desc = "Police groin armor. Doesn't look like anything serious."
	icon_state = "groin-sec"
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
	armor_type = /datum/armor/none

/*
*-* Горжет. Защита горла.
*/

/obj/item/modular_armor/gorget
	name = "plastic gorget"
	desc = "Police gorget. Doesn't look like anything serious."
	icon_state = "gorget-sec"
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
