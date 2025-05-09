#define LITER_PRICE 1
#define NOZZLE_RANGE 2

///////////////////////////////////////////////////////// ZAPRAVKA //////////////////////////////////////////////////////////////////

/obj/machinery/walltank
	name = "gas station"
	desc = "A tank full of industrial welding fuel. Do not consume."
	icon = 'modularz_arkstation/modules/spacepods/icons/structures/spacegas_dolbajob.dmi'
	icon_state = "spacegas"
	anchored = TRUE
	layer = ABOVE_WINDOW_LAYER

	var/balance = 0
	var/target_fuel = 0

	var/obj/item/nozzle/nozzle
	var/datum/beam/current_beam

/obj/machinery/walltank/update_icon_state()
	icon_state = "[initial(icon_state)]"
	if(machine_stat & BROKEN)
		icon_state += "-broken"
	else if(!powered())
		icon_state += "-off"
	return ..()

/obj/machinery/walltank/update_overlays()
	. = ..()
	if(!(machine_stat & (NOPOWER|BROKEN)) && !panel_open)
		. += emissive_appearance(icon, "spacegas-light-mask", src, alpha = alpha)

/obj/machinery/walltank/update_appearance(updates=ALL)
	. = ..()

	set_light((!(machine_stat & BROKEN) && powered()) ? MINIMUM_USEFUL_LIGHT_RANGE : 0)

/obj/machinery/walltank/Destroy()
	. = ..()

	QDEL_NULL(nozzle)
	QDEL_NULL(current_beam)

/obj/machinery/walltank/Initialize(mapload)
	. = ..()

	nozzle = new(src)

	register_context()

/obj/machinery/walltank/examine(mob/user)
	. = ..()
	. += span_green("Has [src.balance] credits on [src.name] balance.")
	. += span_yellow("[LITER_PRICE] credits for 1 liter of Fuel!")

/obj/machinery/walltank/add_context(atom/source, list/context, obj/item/held_item, mob/user)
	. = ..()

	if (nozzle && !held_item)
		context[SCREENTIP_CONTEXT_CTRL_LMB] = "Grab pump nozzle"

	if (held_item == nozzle)
		context[SCREENTIP_CONTEXT_LMB] = "Insert pump nozzle"

	return CONTEXTUAL_SCREENTIP_SET

/obj/machinery/walltank/item_interaction(mob/living/user, obj/item/tool, list/modifiers)
	if (tool == nozzle)
		nozzle.snap_back()
		return ITEM_INTERACT_SUCCESS

	if (istype(tool, /obj/item/holochip))
		if (!user.dropItemToGround(tool))
			return ITEM_INTERACT_FAILURE

		var/obj/item/holochip/chip = tool
		balance += chip.credits

		balloon_alert(user, "credits deposited")
		qdel(chip)

		return ITEM_INTERACT_SUCCESS

	return NONE

/obj/machinery/walltank/click_alt(mob/user)
	if (nozzle.loc != src)
		return CLICK_ACTION_BLOCKING

	if (!user.put_in_active_hand(nozzle))
		return CLICK_ACTION_BLOCKING

	current_beam = user.Beam(
		src,
		"hose",
		'modularz_arkstation/modules/spacepods/icons/structures/beam.dmi',
		emissive = FALSE,
		layer = ABOVE_WINDOW_LAYER,
	)

	return CLICK_ACTION_SUCCESS

/obj/machinery/walltank/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "FuelTank", name)
		ui.set_autoupdate(FALSE)
		ui.open()

/obj/machinery/walltank/ui_data(mob/user)
	var/list/data = list()
	data["balance"] = balance
	data["fuel"] = round(target_fuel)
	data["maxfuel"] = round(balance)
	data["price"] = LITER_PRICE

	return data

/obj/machinery/walltank/ui_act(action, params)
	. = ..()
	if(.)
		return
	switch(action)
		if("fuel")
			var/pressure = params["fuel"]
			if(pressure == "max")
				pressure = balance
				. = TRUE
			else if(text2num(pressure) != null)
				pressure = text2num(pressure)
				. = TRUE
			if(.)
				target_fuel = clamp(pressure, 0, balance)

/obj/machinery/walltank/proc/detach_nozzle()
	nozzle = null

	QDEL_NULL(current_beam)

/obj/item/nozzle
	name = "fuel hose"
	desc = "A device help to transport fuel."
	icon = 'modularz_arkstation/modules/spacepods/icons/structures/spacegas_dolbajob.dmi'
	icon_state = "spacegas-pistol-unhands"
	inhand_icon_state = "atropen"
	lefthand_file = 'icons/mob/inhands/equipment/medical_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/medical_righthand.dmi'
	force = 5
	w_class = WEIGHT_CLASS_BULKY
	var/obj/machinery/walltank/tank

/obj/item/nozzle/examine(mob/user)
	. = ..()

	if (tank)
		. += span_notice("Has [tank.target_fuel] liters of the fuel in.")

/obj/item/nozzle/Destroy(force)
	. = ..()

	if (tank)
		tank.detach_nozzle()
		tank = null

/obj/item/nozzle/proc/snap_back()
	if(!tank)
		return

	forceMove(tank)
	qdel(tank.current_beam)

/obj/item/nozzle/proc/check_range()
	SIGNAL_HANDLER

	if(!tank)
		return

	if(!IN_GIVEN_RANGE(src, tank, NOZZLE_RANGE))
		if(isliving(loc))
			var/mob/living/user = loc
			to_chat(user, span_warning("[tank]'s hose overextend and come out of your hands!"))
		else
			visible_message(span_notice("[src] snap back into [tank]."))
		snap_back()

/obj/item/nozzle/Initialize(mapload)
	. = ..()

	ADD_TRAIT(src, TRAIT_NO_STORAGE_INSERT, TRAIT_GENERIC)

	if (!loc || !istype(loc, /obj/machinery/walltank))
		return INITIALIZE_HINT_QDEL

	tank = loc

/obj/item/nozzle/dropped(mob/user)
	. = ..()
	if(user)
		UnregisterSignal(user, COMSIG_MOVABLE_MOVED)
		to_chat(user, span_notice("The hose snap back into the tank."))
	snap_back()

/obj/item/nozzle/equipped(mob/user, slot)
	. = ..()

	RegisterSignal(user, COMSIG_MOVABLE_MOVED, PROC_REF(check_range))

/obj/item/nozzle/Moved(atom/old_loc, movement_dir, forced, list/old_locs, momentum_change = TRUE)
	. = ..()

	check_range()

///////////////////////////////////////////////////////// FABRICATOR //////////////////////////////////////////////////////////////////

/obj/machinery/rnd/production/protolathe/podfabricator
	name = "space pod fabricator"
	desc = "Converts raw materials into useful objects."
	circuit = /obj/item/circuitboard/machine/podfabricator
	allowed_buildtypes = POD_FABRICATOR

/obj/item/circuitboard/machine/podfabricator
	name = "\improper Space Pod Fabricator - Engineering"
	greyscale_colors = CIRCUIT_COLOR_ENGINEERING
	build_path = /obj/machinery/rnd/production/protolathe/podfabricator
	req_components = list(
		/datum/stock_part/matter_bin = 2,
		/datum/stock_part/servo = 1,
		/datum/stock_part/micro_laser = 1,
		/obj/item/stack/sheet/glass = 1
	)

#undef LITER_PRICE
#undef NOZZLE_RANGE
