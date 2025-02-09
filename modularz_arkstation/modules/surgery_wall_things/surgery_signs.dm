/obj/machinery/surgery_sign
	name = "surgery electronic holoboard"
	desc = "A wall holosign designed to indicate that an operating room is occupied."
	icon = 'modularz_arkstation/modules/surgery_wall_things/sprites/surgery_holosign.dmi'
	base_icon_state = "sign"
	icon_state = "surgery"
	layer = 4

	var/overlay_icons_state = "surgery"
	var/is_on = TRUE
	var/id = null

MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/surgery_sign, 10)

/obj/machinery/surgery_sign/attack_hand(mob/living/user, list/modifiers)
	. = ..()
	on_interact(user)

/obj/machinery/surgery_sign/proc/on_interact(mob/living/user)
	if(!iscarbon(user))
		return
	is_on = !is_on
	update_appearance()

/obj/machinery/surgery_sign/update_icon_state()
	icon_state = "[initial(icon_state)]"
	if(!powered() || is_on == FALSE)
		icon_state = base_icon_state + "_off"
	return ..()

/obj/machinery/surgery_sign/update_appearance(updates=ALL)
	. = ..()

	set_light((!(machine_stat & BROKEN) && powered() && is_on) ? MINIMUM_USEFUL_LIGHT_RANGE : 0)

// Button //
/obj/machinery/button/surgery
	name = "surgery holosign button"
	desc = "A remote control switch for a surgery sign."
	icon_state= "button-warning"
	skin = "-warning"
	device_type = /obj/item/assembly/control/surgery

/obj/item/assembly/control/surgery
	name = "surgery holosign controller"
	desc = "Remote controller for a surgery holosign."

/obj/item/assembly/control/surgery/activate()
	if(cooldown)
		return
	cooldown = TRUE
	for(var/obj/machinery/surgery_sign/M as anything in SSmachines.get_machines_by_type_and_subtypes(/obj/machinery/surgery_sign))
		if(M.id == src.id)
			INVOKE_ASYNC(M, TYPE_PROC_REF(/obj/machinery/surgery_sign, on_interact), usr)

	addtimer(VARSET_CALLBACK(src, cooldown, FALSE), 1 SECONDS)

MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/button/surgery, 24)
