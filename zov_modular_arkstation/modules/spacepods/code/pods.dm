//				 BASED ON VECTORCRAFTS FROM SPLURT 					//
// CHECK zov_modular_arkstation\modules\vectorvehicle FOR ALL CODE //


// CONSTRUCTION //
/obj/item/pods_parts/hull/examine(mob/user)
	. = ..()
	if(obj_flags & NO_DEBRIS_AFTER_DECONSTRUCTION)
		return
	switch(state)
		if(POD_MAIN_BORD)
			. += span_notice("Кажется корпус должен содержать в себе электронику. Нужна <b>Основная плата</b> чтобы Подом можно было управлять.")
		if(POD_MAIN_SECURE)
			. += span_notice("Плата на месте, теперь можно <b>вкрутить её</b>.")
		if(POD_SEC_BORD)
			. += span_notice("Первая плата на месте. Теперь нужна и <b>Вторичная плата</b>.")
		if(POD_SEC_SECURE)
			. += span_notice("Плата на месте, теперь можно <b>вкрутить её</b>.")
		if(POD_HULL_METAL)
			. += span_notice("Обе платы на месте. Корпус Пода стоило бы укрепить металлом. <b>15-и листов должно хватить</b>.")
		if(POD_METAL_WRENCH)
			. += span_notice("Корпус укреплён. Но не закреплён. Думаю тут пригодится <b>гаечный ключ</b>.")
		if(POD_HULL_WIRES)
			. += span_notice("<b>Проводкой</b> теперь стоит соединить платы с электроникой и оборудованием.")
		if(POD_WIRES_WIRECUTTERS)
			. += span_notice("Теперь нужно обрезать лишние провода <b>кусачками</b>.")
		if(POD_HULL_WINDOW)
			. += span_notice("Проводка на месте. А вот <b>окно кабины</b> нет.")
		if(POD_WINDOW_WRENCH)
			. += span_notice("Окно стоит как влитое. Но если оно вылетит в космосе - будет не очень классно. Думаю стоит подтянуть болты <b>гаечным ключом</b>.")
		if(POD_PLATE_INSERT)
			. += span_notice("Теперь нужно определиться с <b>Бронированной Плитой</b>.")
		if(POD_ALL_WELD)
			. += span_notice("Под готов. Однако теперь нужно доварить швы <b>сварочным аппаратом</b>.")

/obj/item/pods_parts/hull/attackby(obj/item/tool, mob/user, params)
	if(obj_flags & NO_DEBRIS_AFTER_DECONSTRUCTION)
		return ..()

	switch(state)
		if(POD_MAIN_BORD)
			if(istype(tool, /obj/item/circuitboard/mecha/spacepod_main))
				to_chat(user, span_notice("[tool] успешно установлена на своё место."))
				qdel(tool)
				icon_state = "raptor1"
				update_icon_state()
				state = POD_MAIN_SECURE

		if(POD_MAIN_SECURE)
			if(tool.tool_behaviour == TOOL_SCREWDRIVER)
				user.visible_message(span_notice("[user] вкручивает плату на место..."),
										span_notice("Вы вкручиваете плату на место..."))
				if(tool.use_tool(src, user, 20, volume = 50))
					icon_state = "raptor2"
					update_icon_state()
					state = POD_SEC_BORD
					to_chat(user, span_notice("Болты поддались и встали в отверстия как нужно."))

		if(POD_SEC_BORD)
			if(istype(tool, /obj/item/circuitboard/mecha/spacepod_peri))
				to_chat(user, span_notice("[tool] успешно установлена на своё место."))
				qdel(tool)
				state = POD_SEC_SECURE

		if(POD_SEC_SECURE)
			if(tool.tool_behaviour == TOOL_SCREWDRIVER)
				user.visible_message(span_notice("[user] вкручивает плату на место..."),
										span_notice("Вы вкручиваете плату на место..."))
				if(tool.use_tool(src, user, 20, volume = 50))
					state = POD_HULL_METAL
					to_chat(user, span_notice("Болты поддались и встали в отверстия как нужно."))

		if(POD_HULL_METAL)
			if(istype(tool, /obj/item/stack/sheet/iron))
				var/obj/item/stack/sheet/iron/iron_blyat = tool
				if(iron_blyat.get_amount() < 15)
					to_chat(user, span_warning("Вам нужно больше листов металла!"))
				else
					user.visible_message(span_notice("[user] кладёт 15 листов [tool] на корпус пода..."),
											span_notice("Вы кладёте 15 листов [tool] на корпус пода..."))
					iron_blyat.use(15)
					state = POD_METAL_WRENCH
					to_chat(user, span_notice("Металл встал как нужно."))

		if(POD_METAL_WRENCH)
			if(tool.tool_behaviour == TOOL_WRENCH)
				user.visible_message(span_notice("[user] закручивает болты на листах металла в корпус..."),
										span_notice("Вы вкручиваете болты на место..."))
				if(tool.use_tool(src, user, 20, volume = 50))
					state = POD_HULL_WIRES
					to_chat(user, span_notice("Болты поддались и встали в отверстия как нужно."))

		if(POD_HULL_WIRES)
			if(istype(tool, /obj/item/stack/cable_coil))
				var/obj/item/stack/cable_coil/coil_blyat = tool
				if(coil_blyat.get_amount() < 15)
					to_chat(user, span_warning("Вам нужен провод длиннее!"))
				else
					user.visible_message(span_notice("[user] проводит 15 метров [tool] через весь корпус пода..."),
											span_notice("Вы проводите 15 метров [tool] внутри корпуса..."))
					coil_blyat.use(15)
					icon_state = "raptor3"
					update_icon_state()
					state = POD_WIRES_WIRECUTTERS
					to_chat(user, span_notice("Все детали соединены проводами."))

		if(POD_WIRES_WIRECUTTERS)
			if(tool.tool_behaviour == TOOL_WIRECUTTER)
				user.visible_message(span_notice("[user] обрезает лишние провода..."),
										span_notice("Вы обрезаете лишнюю проводку..."))
				if(tool.use_tool(src, user, 20, volume = 50))
					state = POD_HULL_WINDOW
					icon_state = "raptor14"
					update_icon_state()
					to_chat(user, span_notice("Лишняя проводка успешно обрезана."))

		if(POD_HULL_WINDOW)
			if(istype(tool, /obj/item/stack/sheet/glass))
				var/obj/item/stack/sheet/glass/glass_blyat = tool
				if(glass_blyat.get_amount() < 15)
					to_chat(user, span_warning("Вам нужно больше листов стекла!"))
				else
					user.visible_message(span_notice("[user] ставит 15 листов [tool] в места для окон..."),
											span_notice("Вы ставите [tool] в места для окон..."))
					glass_blyat.use(15)
					icon_state = "raptor19"
					update_icon_state()
					state = POD_WINDOW_WRENCH
					to_chat(user, span_notice("Под успешно остеклён."))

		if(POD_WINDOW_WRENCH)
			if(tool.tool_behaviour == TOOL_WRENCH)
				user.visible_message(span_notice("[user] закручивает болты на листах стекла в корпус..."),
										span_notice("Вы вкручиваете болты на место..."))
				if(tool.use_tool(src, user, 20, volume = 50))
					state = POD_PLATE_INSERT
					icon_state = "raptor21"
					update_icon_state()
					to_chat(user, span_notice("Болты поддались и встали в отверстия как нужно."))

		if(POD_PLATE_INSERT)
			if(istype(tool, /obj/item/pods_parts/plate))
				if(istype(tool, /obj/item/pods_parts/plate/basic))
					pod_tip = /obj/vehicle/sealed/vectorcraft/auto/spacepod
					to_chat(user, span_notice("Стандартная плита встала успешно."))
				else if(istype(tool, /obj/item/pods_parts/plate/sci))
					pod_tip = /obj/vehicle/sealed/vectorcraft/auto/spacepod/sci
					to_chat(user, span_notice("Экспидиционная плита встала успешно."))
				else if(istype(tool, /obj/item/pods_parts/plate/sec))
					pod_tip = /obj/vehicle/sealed/vectorcraft/auto/spacepod/sec
					to_chat(user, span_notice("Охранная плита встала успешно."))
				state = POD_ALL_WELD
				icon_state = "raptor21"
				update_icon_state()
				qdel(tool)

		if(POD_ALL_WELD)
			var/obj/vehicle/sealed/vectorcraft/auto/spacepod/spawned_pod
			if(tool.tool_behaviour == TOOL_WELDER)
				user.visible_message(span_notice("[user] начинает варить швы корпуса..."),
										span_notice("Вы завариваете все лишние отверствия в корпусе..."))
				if(tool.use_tool(src, user, 20, volume = 50))
					to_chat(user, span_notice("Под готов!"))
					spawned_pod = new pod_tip(src.loc)
					spawned_pod.dir = dir
					qdel(src)

	if (tool.tool_behaviour)
		return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN

	return ..()

/obj/vehicle/sealed/vectorcraft/auto/spacepod/preview
	icon = 'zov_modular_arkstation/modules/spacepods/icons/pods/preview.dmi'
	icon_state = "raptor"

/obj/vehicle/sealed/vectorcraft/auto/spacepod/preview/sci
	icon = 'zov_modular_arkstation/modules/spacepods/icons/pods/preview.dmi'
	icon_state = "raptor_sci"

/obj/vehicle/sealed/vectorcraft/auto/spacepod/preview/sec
	icon = 'zov_modular_arkstation/modules/spacepods/icons/pods/preview.dmi'
	icon_state = "raptor_sec"

// Standart //
/obj/vehicle/sealed/vectorcraft/auto/spacepod
	name = "ABP-01 'Aesculapius'"
	desc = "Designed for civilian purposes Pod."
	icon = 'zov_modular_arkstation/modules/spacepods/icons/pods/raptor.dmi'
	base_icon_state = "raptor"
	icon_state = "raptor-off"
	bound_width = 32
	bound_height = 32
	mouse_pointer = 'icons/effects/mouse_pointers/mecha_mouse.dmi'
	var/preview_tip = /obj/vehicle/sealed/vectorcraft/auto/spacepod/preview
	// Fuel //
	// Мнимая емкость с топливом // ЭТО ЕСЛИ ЧТО ЖИДКАЯ ПЛАЗМА
	var/obj/item/reagent_containers/cup/beaker/large/benzobak/benzobak
	// Будет ли полным бак при спавне?
	var/starting_fuel = FALSE
	// Максимум топлива. МЕНЯТЬ НЕ ЭТУ ПЕРЕМЕННУЮ, А volume у бензобака. Но эту тоже меняйте. Чтобы она была равна Volume
	var/max_fuel = 1200

	// Math funcs //
	// Разница
	var/razn
	// Сумма
	var/plus

	// Flags //
	var/pod_flags = HAS_LIGHTS
	// THEME of UI
	var/ui_theme = "ntos"

	// DNA lock
	var/dna_lock
	// UI View for TGUI
	var/atom/movable/screen/map_view/ui_view

/obj/vehicle/sealed/vectorcraft/auto/spacepod/mob_try_enter(mob/M)
	if(!ishuman(M))
		return
	if(HAS_TRAIT(M, TRAIT_PRIMITIVE))
		to_chat(M, span_warning("The knowledge to use this device eludes you!"))
		return
	if(dna_lock && M.has_dna())
		var/mob/living/carbon/entering_carbon = M
		if(entering_carbon.dna.unique_enzymes != dna_lock)
			to_chat(M, span_warning("Access denied. [name] is secured with a DNA lock."))
			return
	if(!allowed(M))
		to_chat(M, span_warning("Access denied. Insufficient operation keycodes."))
		return
	. = ..()
	if(.)
		moved_inside(M)

/obj/vehicle/sealed/vectorcraft/auto/spacepod/proc/moved_inside(mob/living/newoccupant)
	if(!(newoccupant?.client))
		return FALSE
	if(ishuman(newoccupant) && !Adjacent(newoccupant))
		return FALSE
	add_occupant(newoccupant)
	newoccupant.forceMove(src)
	newoccupant.update_mouse_pointer()
	add_fingerprint(newoccupant)
	setDir(SOUTH)
	playsound(src, 'sound/machines/windowdoor.ogg', 50, TRUE)
	set_mouse_pointer()
	SEND_SOUND(newoccupant, sound('sound/mecha/nominal.ogg',volume=50))
	return TRUE

/obj/vehicle/sealed/vectorcraft/auto/spacepod/proc/set_mouse_pointer()
	mouse_pointer = 'icons/effects/mouse_pointers/mecha_mouse.dmi'

	for(var/mob/mob_occupant as anything in occupants)
		mob_occupant.update_mouse_pointer()

/obj/vehicle/sealed/vectorcraft/auto/spacepod/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/shlang))
		var/obj/item/shlang/B = I
		if(B.tank.balance == 0)
			return
		if(B.tank.target_fuel == 0)
			return
		// if(B.tank.target_fuel < B.tank.balance*10)
		// 	return
		if(benzobak.reagents.has_reagent(/datum/reagent/stable_plasma, max_fuel))
			to_chat(user, span_warning("Your [name] is already full!"))
			return
		if(B.use_tool(src, user, 60))
			B.tank.balance -= B.tank.target_fuel
			benzobak.reagents.add_reagent(/datum/reagent/stable_plasma, B.tank.target_fuel)
			user.visible_message(span_notice("[user] refills [user.p_their()] [name]."), span_notice("You refill [src]."))
			playsound(src, 'sound/effects/refill.ogg', 40, TRUE)
			return
	return ..()

/obj/item/reagent_containers/cup/beaker/large/benzobak
	name = "Fuel Tank"
	desc = "A tank designed for vehicles that can hold 1200 units of liquid."
	volume = 1200

/obj/vehicle/sealed/vectorcraft/auto/spacepod/Initialize(mapload)
	. = ..()
	transform = transform.Translate(-32, -32)
	benzobak = new(src)
	benzobak.create_reagents(max_fuel)
	pod_flags &= ~LIGHTS_ON
	set_light_on(pod_flags & LIGHTS_ON)
	if(starting_fuel)
		benzobak.reagents.add_reagent(/datum/reagent/stable_plasma, max_fuel)

/obj/vehicle/sealed/vectorcraft/auto/spacepod/Destroy()
	. = ..()
	for(var/ejectee in occupants)
		mob_exit(ejectee, silent = TRUE)

	stop_engine()
	QDEL_NULL(ui_view)

/obj/vehicle/sealed/vectorcraft/auto/spacepod/proc/getMaxFuel()
	return max_fuel

/obj/vehicle/sealed/vectorcraft/auto/spacepod/proc/get_fuel()
	return benzobak.reagents.get_reagent_amount(/datum/reagent/stable_plasma)

/obj/vehicle/sealed/vectorcraft/auto/spacepod/mob_enter(mob/living/M)
	if(!driver)
		driver = M
	if(get_fuel() >=1)
		start_engine()
		icon_state = base_icon_state + "-on"
	else
		stop_engine()
		icon_state = base_icon_state + "-off"
	return ..()

/obj/vehicle/sealed/vectorcraft/auto/spacepod/mob_exit(mob/living/M, silent = FALSE, randomstep = FALSE)
	. = ..()
	if(!driver)
		stop_engine()
		return
	if(driver.client)
		driver.client.pixel_x = 0
		driver.client.pixel_y = 0
	driver.pixel_x = 0
	driver.pixel_y = 0
	if(M == driver)
		driver = null
	stop_engine()
	icon_state = base_icon_state + "-off"

/obj/vehicle/sealed/vectorcraft/auto/spacepod/vehicle_move(cached_direction)
	if(!driver)
		stop_engine()
	if(driver.stat == DEAD)
		mob_exit(driver)
	if(get_fuel() >=1)
		start_engine()
		icon_state = base_icon_state + "-on"
	else
		stop_engine()
		icon_state = base_icon_state + "-off"
	dir = cached_direction
	check_boost()
	calc_acceleration()
	calc_vector(cached_direction)
	addtimer(CALLBACK(src, PROC_REF(toplivo_minus)), 1 SECONDS)

/obj/vehicle/sealed/vectorcraft/auto/spacepod/proc/toplivo_minus()
	if(benzobak.reagents.has_reagent(/datum/reagent/fuel, 0.1))
		benzobak.reagents.remove_reagent(/datum/reagent/fuel, 0.1)

/obj/vehicle/sealed/vectorcraft/auto/spacepod/start_engine()
	if(dead_check())
		return
	START_PROCESSING(SSvectorcraft, src)
	if(!driver)
		stop_engine()

/obj/vehicle/sealed/vectorcraft/auto/spacepod/proc/toggle_lights(forced_state = null, mob/user)

	pod_flags ^= LIGHTS_ON
	set_light_on(pod_flags & LIGHTS_ON)
	playsound(src,'sound/machines/clockcult/brass_skewer.ogg', 40, TRUE)
	for(var/mob/occupant as anything in occupants)
		var/datum/action/act = locate(/datum/action/vehicle/sealed/pod/mech_toggle_lights) in occupant.actions
		if(pod_flags & LIGHTS_ON)
			act.button_icon_state = "mech_lights_on"
		else
			act.button_icon_state = "mech_lights_off"
		balloon_alert(occupant, "lights [pod_flags & LIGHTS_ON ? "on":"off"]")
		act.build_all_button_icons()

///Sets the chassis var of our mecha action to the referenced mecha. Used during actions generation in
///generate_action_type() chain.

/datum/action/vehicle/sealed/pod
	button_icon = 'icons/mob/actions/actions_mecha.dmi'
	var/obj/vehicle/sealed/vectorcraft/auto/spacepod/chassis

/datum/action/vehicle/sealed/pod/Destroy()
	chassis = null
	return ..()

/obj/vehicle/sealed/vectorcraft/auto/spacepod/generate_action_type()
	. = ..()
	if(istype(., /datum/action/vehicle/sealed/pod))
		var/datum/action/vehicle/sealed/pod/mecha_action = .
		mecha_action.set_chassis(src)

/obj/vehicle/sealed/vectorcraft/auto/spacepod/generate_actions()
	. = ..()
	initialize_passenger_action_type(/datum/action/vehicle/sealed/pod/mech_toggle_lights)
	initialize_passenger_action_type(/datum/action/vehicle/sealed/pod/mech_view_stats)

/datum/action/vehicle/sealed/pod/proc/set_chassis(passed_chassis)
	chassis = passed_chassis

/datum/action/vehicle/sealed/pod/mech_toggle_lights
	name = "Toggle Lights"
	button_icon_state = "mech_lights_off"

/datum/action/vehicle/sealed/pod/mech_toggle_lights/Trigger(trigger_flags)
	if(!owner || !chassis)
		return
	chassis.toggle_lights(user = owner)

/datum/action/vehicle/sealed/pod/mech_view_stats
	name = "View Stats"
	button_icon_state = "mech_view_stats"

/datum/action/vehicle/sealed/pod/mech_view_stats/Trigger(trigger_flags)
	if(!owner || !chassis)
		return

	chassis.ui_interact(owner)

///////////////////// UI /////////////////////////////
/obj/vehicle/sealed/vectorcraft/auto/spacepod/ui_close(mob/user)
	. = ..()
	ui_view.hide_from(user)

/obj/vehicle/sealed/vectorcraft/auto/spacepod/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui_view = create_pod_preview_view(user)
		ui = new(user, src, "Pod", name)
		ui.open()
		ui_view.display_to(user)

/obj/vehicle/sealed/vectorcraft/auto/spacepod/proc/create_pod_preview_view(mob/user)
	ui_view = new(null, preview_tip)
	ui_view.generate_view("space_pod_preview_[REF(ui_view)]")
	ui_view.display_to(user)

	return ui_view

/obj/vehicle/sealed/vectorcraft/auto/spacepod/ui_status(mob/user)
	if(contains(user))
		return UI_INTERACTIVE
	return min(
		ui_status_user_is_abled(user, src),
		ui_status_user_has_free_hands(user, src),
		ui_status_user_is_advanced_tool_user(user),
		ui_status_only_living(user),
		max(
			ui_status_user_is_adjacent(user, src),
			ui_status_silicon_has_access(user, src),
		)
	)

/obj/vehicle/sealed/vectorcraft/auto/spacepod/ui_assets(mob/user)
	return list(
		get_asset_datum(/datum/asset/spritesheet/mecha_equipment),
	)

/obj/vehicle/sealed/vectorcraft/auto/spacepod/ui_static_data(mob/user)
	var/list/data = list()
	data["ui_theme"] = ui_theme
	//same thresholds as in air alarm
	data["cabin_pressure_warning_min"] = WARNING_LOW_PRESSURE
	data["cabin_pressure_hazard_min"] = HAZARD_LOW_PRESSURE
	data["cabin_pressure_warning_max"] = WARNING_HIGH_PRESSURE
	data["cabin_pressure_hazard_max"] = HAZARD_HIGH_PRESSURE
	data["cabin_temp_warning_min"] = BODYTEMP_COLD_WARNING_1 + 10 - T0C
	data["cabin_temp_hazard_min"] = BODYTEMP_COLD_WARNING_1 - T0C
	data["cabin_temp_warning_max"] = BODYTEMP_HEAT_WARNING_1 - 27 - T0C
	data["cabin_temp_hazard_max"] = BODYTEMP_HEAT_WARNING_1 - T0C
	data["one_atmosphere"] = ONE_ATMOSPHERE

	data["sheet_material_amount"] = SHEET_MATERIAL_AMOUNT
	//map of relevant flags to check tgui side, not every flag needs to be here
	data["mechflag_keys"] = list(
		"LIGHTS_ON" = LIGHTS_ON,
	)
	return data

/obj/vehicle/sealed/vectorcraft/auto/spacepod/ui_data(mob/user)
	var/list/data = list()
	var/isoperator = (user in occupants) //maintenance mode outside of mech
	data["isoperator"] = isoperator
	ui_view.appearance = appearance
	data["name"] = name
	data["integrity"] = atom_integrity
	data["integrity_max"] = max_integrity
	data["power_level"] = benzobak.reagents.total_volume
	data["power_max"] = max_fuel
	data["mecha_flags"] = pod_flags

	data["dna_lock"] = dna_lock

	data["pod_view"] = ui_view.assigned_map
	return data

/obj/vehicle/sealed/vectorcraft/auto/spacepod/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return
	switch(action)
		if("changename")
			var/userinput = tgui_input_text(usr, "Choose a new exosuit name", "Rename exosuit", max_length = MAX_NAME_LEN, default = name)
			if(!userinput)
				return
			if(is_ic_filtered(userinput) || is_soft_ic_filtered(userinput))
				tgui_alert(usr, "You cannot set a name that contains a word prohibited in IC chat!")
				return
			if(userinput == format_text(name)) //default mecha names may have improper span artefacts in their name, so we format the name
				to_chat(usr, span_notice("You rename [name] to... well, [userinput]."))
				return
			name = userinput
		if("dna_lock")
			var/mob/living/carbon/user = usr
			if(!istype(user) || !user.dna)
				to_chat(user, "[icon2html(src, occupants)][span_notice("You can't create a DNA lock with no DNA!.")]")
				return
			dna_lock = user.dna.unique_enzymes
			to_chat(user, "[icon2html(src, occupants)][span_notice("You feel a prick as the needle takes your DNA sample.")]")
		if("reset_dna")
			dna_lock = null
		if("toggle_lights")
			toggle_lights(user = usr)
	return TRUE

/////////////////////////////////////////////////////

/obj/vehicle/sealed/vectorcraft/auto/spacepod/sci
	name = "AVP-02 'Athena'"
	icon = 'zov_modular_arkstation/modules/spacepods/icons/pods/raptor_sci.dmi'
	base_icon_state = "raptor_sci"
	icon_state = "raptor_sci-off"
	desc = "Designed for space exploration Pod."
	max_integrity = 150
	preview_tip = /obj/vehicle/sealed/vectorcraft/auto/spacepod/preview/sci

/obj/vehicle/sealed/vectorcraft/auto/spacepod/sec
	name = "ASP-03 'Themis'"
	icon = 'zov_modular_arkstation/modules/spacepods/icons/pods/raptor_sec.dmi'
	base_icon_state = "raptor_sec"
	icon_state = "raptor_sec-off"
	desc = "Designed for perimeter security Pod."
	max_integrity = 200
	preview_tip = /obj/vehicle/sealed/vectorcraft/auto/spacepod/preview/sec
