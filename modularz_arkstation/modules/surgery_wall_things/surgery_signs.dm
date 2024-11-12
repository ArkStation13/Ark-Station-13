/obj/machinery/surgery_sign
	name = "surgery electronic board"
	desc = "A wall sign designed to indicate that an operating room is occupied."
	icon = 'modularz_arkstation/modules/surgery_wall_things/sprites/surgery_holosign.dmi'
	base_icon_state = "sign"
	icon_state = "surgery"

	var/overlay_icons_state = "surgery"
	var/is_on = TRUE

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
