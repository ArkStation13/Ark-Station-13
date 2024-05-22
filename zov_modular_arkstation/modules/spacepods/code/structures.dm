#define LITER_PRICE 1
#define SHLANG_RANGE 2

///////////////////////////////////////////////////////// ZAPRAVKA //////////////////////////////////////////////////////////////////

/obj/machinery/walltank
	name = "gas station"
	desc = "A tank full of industrial welding fuel. Do not consume."
	icon = 'zov_modular_arkstation/modules/spacepods/icons/structures/spacegas_dolbajob.dmi'
	icon_state = "spacegas"
	anchored = TRUE
	layer = ABOVE_WINDOW_LAYER
	var/balance = 0
	var/target_fuel = 0
	var/shlang_na_meste = TRUE
	var/obj/item/shlang/shlang
	//var/light_mask = "spacegas-light-mask"
	//var/datum/beam/current_beam

/obj/effect/ebeam/fuel_hose
	name = "fuel hose"
	layer = ABOVE_WINDOW_LAYER

/obj/machinery/walltank/update_icon_state()
	icon_state = "[initial(icon_state)]"
	if(machine_stat & BROKEN)
		icon_state += "-broken"
	else if(!powered())
		icon_state += "-off"
	return ..()

/obj/machinery/walltank/update_overlays()
	. = ..()
	/*
	if(light_mask && !(machine_stat & BROKEN) && powered())
		. += emissive_appearance(icon, light_mask, src)
	if(shlang_na_meste == TRUE)
		. += mutable_appearance(icon, "spacegas-pistol-inmachine", src)
	else
		. -= mutable_appearance(icon, "spacegas-pistol-inmachine", src)
	*/

/obj/machinery/walltank/update_appearance(updates=ALL)
	. = ..()

	set_light((!(machine_stat & BROKEN) && powered()) ? MINIMUM_USEFUL_LIGHT_RANGE : 0)

/obj/machinery/walltank/Destroy()
	. = ..()
	//qdel(shlang)
	//qdel(current_beam)
	//qdel(light_mask)

/obj/item/shlang
	name = "fuel hose"
	desc = "A device help to transport fuel."
	icon = 'zov_modular_arkstation/modules/spacepods/icons/structures/spacegas_dolbajob.dmi'
	icon_state = "spacegas-pistol-unhands"
	inhand_icon_state = "atropen"
	lefthand_file = 'icons/mob/inhands/equipment/medical_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/medical_righthand.dmi'
	force = 5
	w_class = WEIGHT_CLASS_BULKY
	var/obj/machinery/walltank/tank

/obj/machinery/walltank/Initialize(mapload) //starts without a cell for rnd
	. = ..()
	//shlang = new(src)

/obj/item/shlang/examine(mob/user)
	. += span_notice("Has [tank.target_fuel] liters of the fuel in.")

/obj/item/shlang/Destroy(force)
	. = ..()
	//qdel(tank.current_beam)

/obj/machinery/walltank/examine(mob/user)
	. = ..()
	. += span_green("Has [src.balance] credits on [src.name] balance.")
	. += span_yellow("[LITER_PRICE] credits for 1 liter of Fuel!")

/obj/machinery/walltank/attackby(obj/item/I, mob/living/user, params)
	if(I == src.shlang)
		src.shlang.snap_back()
		return
	if(istype(I, /obj/item/holochip))
		var/obj/item/holochip/H = I
		balance += H.credits
		to_chat(user, span_notice("You insert the credits into [src]."))
		update_appearance()
		qdel(H)
		return
	..()

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
	update_appearance()

//defib interaction
/obj/machinery/walltank/attack_hand(mob/living/user, list/modifiers)
	. = ..()
	if(!IN_GIVEN_RANGE(src, user, SHLANG_RANGE))
		to_chat(user, span_warning("[shlang] overextend and come out of your hands!"))
		return
	user.put_in_hands(shlang)
	shlang_na_meste = FALSE
	//current_beam = new(user, src, icon = 'zov_modular_arkstation/modules/spacepods/icons/structures/beam.dmi', icon_state = "hose", beam_type = /obj/effect/ebeam/fuel_hose)
	//INVOKE_ASYNC(current_beam, TYPE_PROC_REF(/datum/beam, Start))

/obj/item/shlang/proc/snap_back()
	if(!tank)
		return
	forceMove(tank)
	tank.shlang_na_meste = TRUE
	//qdel(tank.current_beam)

/obj/item/shlang/proc/check_range()
	SIGNAL_HANDLER
	if(!tank)
		return
	if(!IN_GIVEN_RANGE(src, tank, SHLANG_RANGE))
		if(isliving(loc))
			var/mob/living/user = loc
			to_chat(user, span_warning("[tank]'s hose overextend and come out of your hands!"))
		else
			visible_message(span_notice("[src] snap back into [tank]."))
		snap_back()

/obj/item/shlang/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_NO_STORAGE_INSERT, TRAIT_GENERIC) //stops shockpaddles from being inserted in BoH
	if (!loc || !istype(loc, /obj/machinery/walltank)) //To avoid weird issues from admin spawns
		return INITIALIZE_HINT_QDEL
	tank = loc
	update_appearance()

/obj/item/shlang/dropped(mob/user)
	. = ..()
	if(user)
		UnregisterSignal(user, COMSIG_MOVABLE_MOVED)
		to_chat(user, span_notice("The hose snap back into the tank."))
	snap_back()

/obj/item/shlang/equipped(mob/user, slot)
	. = ..()
	RegisterSignal(user, COMSIG_MOVABLE_MOVED, PROC_REF(check_range))

/obj/item/shlang/Moved(atom/old_loc, movement_dir, forced, list/old_locs, momentum_change = TRUE)
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
#undef SHLANG_RANGE
