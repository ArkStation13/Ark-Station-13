#define PA_CONSTRUCTION_UNSECURED	0
#define PA_CONSTRUCTION_UNWIRED		1
#define PA_CONSTRUCTION_PANEL_OPEN	2
#define PA_CONSTRUCTION_COMPLETE	3

/*
*	SINGULARITY SPAWNER
*/

/obj/machinery/the_singularitygen
	name = "gravitational singularity generator"
	desc = "An odd device which produces a Gravitational Singularity when set up."
	icon = 'modularz_arkstation/modules/singulo-and-tesla/sing_gen.dmi'
	icon_state = "TheSingGen"
	anchored = FALSE
	density = TRUE
	use_power = NO_POWER_USE
	resistance_flags = FIRE_PROOF

	// You can buckle someone to the singularity generator, then start the engine. Fun!
	can_buckle = TRUE
	buckle_lying = FALSE
	buckle_requires_restraints = TRUE

	var/energy = 0
	var/creation_type = /obj/singularity

/obj/machinery/the_singularitygen/attackby(obj/item/W, mob/user, params)
	if(W.tool_behaviour == TOOL_WRENCH)
		default_unfasten_wrench(user, W, 0)
	else
		return ..()

/obj/machinery/the_singularitygen/process()
	if(energy > 0)
		if(energy >= 200)
			var/turf/T = get_turf(src)
			SSblackbox.record_feedback("tally", "engine_started", 1, type)
			var/obj/singularity/S = new creation_type(T, 50)
			transfer_fingerprints_to(S)
			qdel(src)
		else
			energy -= 1

/obj/machinery/the_singularitygen/tesla
	name = "energy ball generator"
	desc = "Makes the wardenclyffe look like a child's plaything when shot with a particle accelerator."
	icon = 'modularz_arkstation/modules/singulo-and-tesla/sing_gen.dmi'
	icon_state = "TheSingGen"
	creation_type = /obj/energy_ball

/obj/machinery/the_singularitygen/tesla/zap_act(power, zap_flags)
	if(zap_flags & ZAP_MACHINE_EXPLOSIVE)
		energy += power
	zap_flags &= ~(ZAP_MACHINE_EXPLOSIVE | ZAP_OBJ_DAMAGE) // Don't blow yourself up yeah?
	return ..()

/obj/effect/accelerated_particle
	name = "accelerated particles"
	desc = "Small things moving very fast."
	icon = 'modularz_arkstation/modules/singulo-and-tesla/particle_accelerator.dmi'
	icon_state = "particle"
	anchored = TRUE
	density = FALSE
	var/movement_range = 10
	var/energy = 10
	var/speed = 1

/obj/effect/accelerated_particle/weak
	movement_range = 8
	energy = 5

/obj/effect/accelerated_particle/strong
	movement_range = 15
	energy = 15

/obj/effect/accelerated_particle/powerful
	movement_range = 20
	energy = 50
	color = COLOR_RED

/obj/effect/accelerated_particle/Initialize(mapload)
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(move)), 1)
	var/static/list/loc_connections = list(
		COMSIG_ATOM_ENTERED = PROC_REF(on_entered),
	)
	AddElement(/datum/element/connect_loc, loc_connections)


/obj/effect/accelerated_particle/Bump(atom/A)
	if(A)
		if(isliving(A))
			toxmob(A)
		else if(istype(A, /obj/machinery/the_singularitygen))
			var/obj/machinery/the_singularitygen/S = A
			S.energy += energy
		else if(istype(A, /obj/singularity))
			var/obj/singularity/S = A
			S.energy += energy
		else if(istype(A, /obj/energy_ball))
			var/obj/energy_ball/E = A
			E.energy += energy
		else if(istype(A, /obj/structure/blob))
			var/obj/structure/blob/B = A
			B.take_damage(energy*0.6)
			movement_range = 0

/obj/effect/accelerated_particle/proc/on_entered(datum/source, atom/movable/AM)
	SIGNAL_HANDLER
	if(isliving(AM))
		toxmob(AM)


/obj/effect/accelerated_particle/ex_act(severity, target)
	qdel(src)

/obj/effect/accelerated_particle/singularity_pull()
	return

/obj/effect/accelerated_particle/proc/toxmob(mob/living/M)
	M.adjustToxLoss(energy / 10)

/obj/effect/accelerated_particle/proc/move()
	if(!step(src,dir))
		forceMove(get_step(src,dir))
	movement_range--
	if(movement_range == 0)
		qdel(src)
	else
		sleep(speed)
		move()

/*
 *	Composed of 7 parts:
 *	3 Particle Emitters
 *	1 Power Box
 *	1 Fuel Chamber
 *	1 End Cap
 *	1 Control computer
 *	Setup map
 *	  |EC|
 *	CC|FC|
 *	  |PB|
 *	PE|PE|PE
*/

/obj/structure/particle_accelerator
	name = "particle accelerator"
	desc = "Part of a Particle Accelerator."
	icon = 'modularz_arkstation/modules/singulo-and-tesla/particle_accelerator.dmi'
	icon_state = "power_box"
	anchored = FALSE
	density = TRUE
	max_integrity = 500
	armor_type = /datum/armor/structure_particle_accelerator

	var/obj/machinery/particle_accelerator/control_box/master = null
	var/construction_state = PA_CONSTRUCTION_UNSECURED
	var/reference = null
	var/powered = 0
	var/strength = null

/datum/armor/structure_particle_accelerator
	melee = 30
	melee = 20
	laser = 20
	fire = 90
	acid = 80

/obj/structure/particle_accelerator/examine(mob/user)
	. = ..()

	switch(construction_state)
		if(PA_CONSTRUCTION_UNSECURED)
			. += "Looks like it's not attached to the flooring."
		if(PA_CONSTRUCTION_UNWIRED)
			. += "It is missing some cables."
		if(PA_CONSTRUCTION_PANEL_OPEN)
			. += "The panel is open."

/obj/structure/particle_accelerator/Destroy()
	construction_state = PA_CONSTRUCTION_UNSECURED
	if(master)
		master.connected_parts -= src
		master.assembled = 0
		master = null
	return ..()

/obj/structure/particle_accelerator/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/simple_rotation)


/obj/structure/particle_accelerator/set_anchored(anchorvalue)
	. = ..()
	if(isnull(.))
		return
	construction_state = anchorvalue ? PA_CONSTRUCTION_UNWIRED : PA_CONSTRUCTION_UNSECURED
	update_state()
	update_appearance()

/obj/structure/particle_accelerator/attackby(obj/item/W, mob/user, params)
	var/did_something = FALSE

	switch(construction_state)
		if(PA_CONSTRUCTION_UNSECURED)
			if(W.tool_behaviour == TOOL_WRENCH && !isinspace())
				W.play_tool_sound(src, 75)
				set_anchored(TRUE)
				user.visible_message(span_notice("[user.name] secures the [name] to the floor."), \
					span_notice("You secure the external bolts."))
				user.changeNext_move(CLICK_CD_MELEE)
				return //set_anchored handles the rest of the stuff we need to do.
		if(PA_CONSTRUCTION_UNWIRED)
			if(W.tool_behaviour == TOOL_WRENCH)
				W.play_tool_sound(src, 75)
				set_anchored(FALSE)
				user.visible_message(span_notice("[user.name] detaches the [name] from the floor."), \
					span_notice("You remove the external bolts."))
				user.changeNext_move(CLICK_CD_MELEE)
				return //set_anchored handles the rest of the stuff we need to do.
			else if(istype(W, /obj/item/stack/cable_coil))
				var/obj/item/stack/cable_coil/CC = W
				if(CC.use(1))
					user.visible_message(span_notice("[user.name] adds wires to the [name]."), \
						span_notice("You add some wires."))
					construction_state = PA_CONSTRUCTION_PANEL_OPEN
					did_something = TRUE
		if(PA_CONSTRUCTION_PANEL_OPEN)
			if(W.tool_behaviour == TOOL_WIRECUTTER)//TODO:Shock user if its on?
				user.visible_message(span_notice("[user.name] removes some wires from the [name]."), \
					span_notice("You remove some wires."))
				construction_state = PA_CONSTRUCTION_UNWIRED
				did_something = TRUE
			else if(W.tool_behaviour == TOOL_SCREWDRIVER)
				user.visible_message(span_notice("[user.name] closes the [name]'s access panel."), \
					span_notice("You close the access panel."))
				construction_state = PA_CONSTRUCTION_COMPLETE
				did_something = TRUE
		if(PA_CONSTRUCTION_COMPLETE)
			if(W.tool_behaviour == TOOL_SCREWDRIVER)
				user.visible_message(span_notice("[user.name] opens the [name]'s access panel."), \
					span_notice("You open the access panel."))
				construction_state = PA_CONSTRUCTION_PANEL_OPEN
				did_something = TRUE

	if(did_something)
		user.changeNext_move(CLICK_CD_MELEE)
		update_state()
		update_appearance()
		return

	return ..()


/obj/structure/particle_accelerator/atom_deconstruct(disassembled = TRUE)
	if(!(flags_1 & NO_DEBRIS_AFTER_DECONSTRUCTION))
		new /obj/item/stack/sheet/iron (loc, 5)
	qdel(src)

/obj/structure/particle_accelerator/Move()
	. = ..()
	if(master && master.active)
		master.toggle_power()
		investigate_log("was moved whilst active; it <font color='red'>powered down</font>.", INVESTIGATE_ENGINE)


/obj/structure/particle_accelerator/update_icon_state()
	. = ..()
	switch(construction_state)
		if(PA_CONSTRUCTION_UNSECURED,PA_CONSTRUCTION_UNWIRED)
			icon_state="[reference]"
		if(PA_CONSTRUCTION_PANEL_OPEN)
			icon_state="[reference]w"
		if(PA_CONSTRUCTION_COMPLETE)
			if(powered)
				icon_state="[reference]p[strength]"
			else
				icon_state="[reference]c"

/obj/structure/particle_accelerator/proc/update_state()
	if(master)
		master.update_state()

/obj/structure/particle_accelerator/proc/connect_master(obj/O)
	if(O.dir == dir)
		master = O
		return 1
	return 0

/*
*	PARTS
*/

/obj/structure/particle_accelerator/end_cap
	name = "alpha particle generation array"
	desc = "This is where alpha particles are generated from \[REDACTED\]."
	icon_state = "end_cap"
	reference = "end_cap"

/obj/structure/particle_accelerator/power_box
	name = "particle focusing EM lens"
	desc = "This uses electromagnetic waves to focus the alpha particles."
	icon = 'modularz_arkstation/modules/singulo-and-tesla/particle_accelerator.dmi'
	icon_state = "power_box"
	reference = "power_box"

/obj/structure/particle_accelerator/fuel_chamber
	name = "EM acceleration chamber"
	desc = "This is where the alpha particles are accelerated to <b><i>radical speeds</i></b>."
	icon = 'modularz_arkstation/modules/singulo-and-tesla/particle_accelerator.dmi'
	icon_state = "fuel_chamber"
	reference = "fuel_chamber"

/obj/machinery/particle_accelerator/control_box
	name = "particle accelerator control console"
	desc = "This controls the density of the particles."
	icon = 'modularz_arkstation/modules/singulo-and-tesla/particle_accelerator_controlbox.dmi'
	icon_state = "control_box"
	anchored = FALSE
	density = TRUE
	use_power = NO_POWER_USE
	idle_power_usage = 500
	active_power_usage = 10000
	dir = NORTH
	mouse_opacity = MOUSE_OPACITY_OPAQUE
	var/strength_upper_limit = 2
	var/interface_control = TRUE
	var/list/obj/structure/particle_accelerator/connected_parts
	var/assembled = FALSE
	var/construction_state = PA_CONSTRUCTION_UNSECURED
	var/active = FALSE
	var/strength = 0
	var/powered = FALSE

/obj/machinery/particle_accelerator/control_box/Initialize(mapload)
	. = ..()
	wires = new /datum/wires/particle_accelerator/control_box(src)
	connected_parts = list()

/obj/machinery/particle_accelerator/control_box/Destroy()
	if(active)
		toggle_power()
	for(var/CP in connected_parts)
		var/obj/structure/particle_accelerator/part = CP
		part.master = null
	connected_parts.Cut()
	QDEL_NULL(wires)
	return ..()

/obj/machinery/particle_accelerator/control_box/multitool_act(mob/living/user, obj/item/I)
	. = ..()
	if(construction_state == PA_CONSTRUCTION_PANEL_OPEN)
		wires.interact(user)
		return TRUE

/obj/machinery/particle_accelerator/control_box/proc/update_state()
	if(construction_state < PA_CONSTRUCTION_COMPLETE)
		use_power = NO_POWER_USE
		assembled = FALSE
		active = FALSE
		for(var/CP in connected_parts)
			var/obj/structure/particle_accelerator/part = CP
			part.strength = null
			part.powered = FALSE
			part.update_icon()
		connected_parts.Cut()
		return
	if(!part_scan())
		use_power = IDLE_POWER_USE
		active = FALSE
		connected_parts.Cut()

/obj/machinery/particle_accelerator/control_box/update_icon_state()
	. = ..()
	if(active)
		icon_state = "control_boxp[strength]"
	else
		if(use_power)
			if(assembled)
				icon_state = "control_boxp"
			else
				icon_state = "ucontrol_boxp"
		else
			switch(construction_state)
				if(PA_CONSTRUCTION_UNSECURED, PA_CONSTRUCTION_UNWIRED)
					icon_state = "control_box"
				if(PA_CONSTRUCTION_PANEL_OPEN)
					icon_state = "control_boxw"
				else
					icon_state = "control_boxc"

/obj/machinery/particle_accelerator/control_box/proc/strength_change()
	for(var/CP in connected_parts)
		var/obj/structure/particle_accelerator/part = CP
		part.strength = strength
		part.update_icon()
		update_appearance()

/obj/machinery/particle_accelerator/control_box/proc/add_strength(s)
	if(assembled && (strength < strength_upper_limit))
		strength++
		strength_change()

		log_game("PA Control Computer increased to [strength] by [key_name(usr)] in [AREACOORD(src)]")
		investigate_log("increased to <font color='red'>[strength]</font> by [key_name(usr)] at [AREACOORD(src)]", INVESTIGATE_ENGINE)

/obj/machinery/particle_accelerator/control_box/proc/remove_strength(s)
	if(assembled && (strength > 0))
		strength--
		strength_change()

		log_game("PA Control Computer decreased to [strength] by [key_name(usr)] in [AREACOORD(src)]")
		investigate_log("decreased to <font color='green'>[strength]</font> by [key_name(usr)] at [AREACOORD(src)]", INVESTIGATE_ENGINE)

/obj/machinery/particle_accelerator/control_box/power_change()
	. = ..()
	if(machine_stat & NOPOWER)
		active = FALSE
		use_power = NO_POWER_USE
	else if(!machine_stat && construction_state == PA_CONSTRUCTION_COMPLETE)
		use_power = IDLE_POWER_USE

/obj/machinery/particle_accelerator/control_box/process()
	if(active)
		//a part is missing!
		if(connected_parts.len < 6)
			investigate_log("lost a connected part; It <font color='red'>powered down</font>.", INVESTIGATE_ENGINE)
			toggle_power()
			update_appearance()
			return
		//emit some particles
		for(var/obj/structure/particle_accelerator/particle_emitter/PE in connected_parts)
			PE.emit_particle(strength)

/obj/machinery/particle_accelerator/control_box/proc/part_scan()
	var/ldir = turn(dir,-90)
	var/rdir = turn(dir,90)
	var/odir = turn(dir,180)
	var/turf/T = loc

	assembled = FALSE
	critical_machine = FALSE

	var/obj/structure/particle_accelerator/fuel_chamber/F = locate() in orange(1,src)
	if(!F)
		return FALSE

	setDir(F.dir)
	connected_parts.Cut()

	T = get_step(T,rdir)
	if(!check_part(T, /obj/structure/particle_accelerator/fuel_chamber))
		return FALSE
	T = get_step(T,odir)
	if(!check_part(T, /obj/structure/particle_accelerator/end_cap))
		return FALSE
	T = get_step(T,dir)
	T = get_step(T,dir)
	if(!check_part(T, /obj/structure/particle_accelerator/power_box))
		return FALSE
	T = get_step(T,dir)
	if(!check_part(T, /obj/structure/particle_accelerator/particle_emitter/center))
		return FALSE
	T = get_step(T,ldir)
	if(!check_part(T, /obj/structure/particle_accelerator/particle_emitter/left))
		return FALSE
	T = get_step(T,rdir)
	T = get_step(T,rdir)
	if(!check_part(T, /obj/structure/particle_accelerator/particle_emitter/right))
		return FALSE

	assembled = TRUE
	critical_machine = TRUE	//Only counts if the PA is actually assembled.
	return TRUE

/obj/machinery/particle_accelerator/control_box/proc/check_part(turf/T, type)
	var/obj/structure/particle_accelerator/PA = locate(/obj/structure/particle_accelerator) in T
	if(istype(PA, type) && (PA.construction_state == PA_CONSTRUCTION_COMPLETE))
		if(PA.connect_master(src))
			connected_parts.Add(PA)
			return TRUE
	return FALSE

/obj/machinery/particle_accelerator/control_box/proc/toggle_power()
	active = !active
	investigate_log("turned [active?"<font color='green'>ON</font>":"<font color='red'>OFF</font>"] by [usr ? key_name(usr) : "outside forces"] at [AREACOORD(src)]", INVESTIGATE_ENGINE)
	message_admins("PA Control Computer turned [active ?"ON":"OFF"] by [usr ? ADMIN_LOOKUPFLW(usr) : "outside forces"] in [ADMIN_VERBOSEJMP(src)]")
	log_game("PA Control Computer turned [active ?"ON":"OFF"] by [usr ? "[key_name(usr)]" : "outside forces"] at [AREACOORD(src)]")
	if(active)
		use_power = ACTIVE_POWER_USE
		for(var/CP in connected_parts)
			var/obj/structure/particle_accelerator/part = CP
			part.strength = strength
			part.powered = TRUE
			part.update_icon()
	else
		use_power = IDLE_POWER_USE
		for(var/CP in connected_parts)
			var/obj/structure/particle_accelerator/part = CP
			part.strength = null
			part.powered = FALSE
			part.update_icon()
	return TRUE

/obj/machinery/particle_accelerator/control_box/examine(mob/user)
	. = ..()
	switch(construction_state)
		if(PA_CONSTRUCTION_UNSECURED)
			. += "Looks like it's not attached to the flooring."
		if(PA_CONSTRUCTION_UNWIRED)
			. += "It is missing some cables."
		if(PA_CONSTRUCTION_PANEL_OPEN)
			. += "The panel is open."

/obj/machinery/particle_accelerator/control_box/set_anchored(anchorvalue)
	. = ..()
	if(isnull(.))
		return
	construction_state = anchorvalue ? PA_CONSTRUCTION_UNWIRED : PA_CONSTRUCTION_UNSECURED
	update_state()
	update_icon()

/obj/machinery/particle_accelerator/control_box/attackby(obj/item/W, mob/user, params)
	var/did_something = FALSE

	switch(construction_state)
		if(PA_CONSTRUCTION_UNSECURED)
			if(W.tool_behaviour == TOOL_WRENCH && !isinspace())
				W.play_tool_sound(src, 75)
				set_anchored(TRUE)
				user.visible_message(span_notice("[user.name] secures the [name] to the floor."), \
					span_notice("You secure the external bolts."))
				user.changeNext_move(CLICK_CD_MELEE)
				return //set_anchored handles the rest of the stuff we need to do.
		if(PA_CONSTRUCTION_UNWIRED)
			if(W.tool_behaviour == TOOL_WRENCH)
				W.play_tool_sound(src, 75)
				set_anchored(FALSE)
				user.visible_message(span_notice("[user.name] detaches the [name] from the floor."), \
					span_notice("You remove the external bolts."))
				user.changeNext_move(CLICK_CD_MELEE)
				return //set_anchored handles the rest of the stuff we need to do.
			else if(istype(W, /obj/item/stack/cable_coil))
				var/obj/item/stack/cable_coil/CC = W
				if(CC.use(1))
					user.visible_message(span_notice("[user.name] adds wires to the [name]."), \
						span_notice("You add some wires."))
					construction_state = PA_CONSTRUCTION_PANEL_OPEN
					did_something = TRUE
		if(PA_CONSTRUCTION_PANEL_OPEN)
			if(W.tool_behaviour == TOOL_WIRECUTTER)//TODO:Shock user if its on?
				user.visible_message(span_notice("[user.name] removes some wires from the [name]."), \
					span_notice("You remove some wires."))
				construction_state = PA_CONSTRUCTION_UNWIRED
				did_something = TRUE
			else if(W.tool_behaviour == TOOL_SCREWDRIVER)
				user.visible_message(span_notice("[user.name] closes the [name]'s access panel."), \
					span_notice("You close the access panel."))
				construction_state = PA_CONSTRUCTION_COMPLETE
				did_something = TRUE
		if(PA_CONSTRUCTION_COMPLETE)
			if(W.tool_behaviour == TOOL_SCREWDRIVER)
				user.visible_message(span_notice("[user.name] opens the [name]'s access panel."), \
					span_notice("You open the access panel."))
				construction_state = PA_CONSTRUCTION_PANEL_OPEN
				did_something = TRUE

	if(did_something)
		user.changeNext_move(CLICK_CD_MELEE)
		update_state()
		update_icon()
		return

	return ..()

/obj/machinery/particle_accelerator/control_box/blob_act(obj/structure/blob/B)
	if(prob(50))
		qdel(src)

/obj/machinery/particle_accelerator/control_box/interact(mob/user)
	if(construction_state == PA_CONSTRUCTION_PANEL_OPEN)
		wires.interact(user)
	else
		..()

/obj/machinery/particle_accelerator/control_box/proc/is_interactive(mob/user)
	if(!interface_control)
		to_chat(user, span_alert("ERROR: Request timed out. Check wire contacts."))
		return FALSE
	if(construction_state != PA_CONSTRUCTION_COMPLETE)
		return FALSE
	return TRUE

/obj/machinery/particle_accelerator/control_box/ui_status(mob/user)
	if(is_interactive(user))
		return ..()
	return UI_CLOSE

/obj/machinery/particle_accelerator/control_box/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "ParticleAccelerator", name)
		ui.open()

/obj/machinery/particle_accelerator/control_box/ui_data(mob/user)
	var/list/data = list()
	data["assembled"] = assembled
	data["power"] = active
	data["strength"] = strength
	return data

/obj/machinery/particle_accelerator/control_box/ui_act(action, params)
	if(..())
		return

	switch(action)
		if("power")
			if(wires.is_cut(WIRE_POWER))
				return
			toggle_power()
			. = TRUE
		if("scan")
			part_scan()
			. = TRUE
		if("add_strength")
			if(wires.is_cut(WIRE_STRENGTH))
				return
			add_strength()
			. = TRUE
		if("remove_strength")
			if(wires.is_cut(WIRE_STRENGTH))
				return
			remove_strength()
			. = TRUE

	update_icon()

/obj/structure/particle_accelerator/particle_emitter
	name = "EM containment grid"
	desc = "This launches the alpha particles, might not want to stand near this end."
	icon = 'modularz_arkstation/modules/singulo-and-tesla/particle_accelerator.dmi'
	icon_state = "emitter_center"
	var/fire_delay = 50
	var/last_shot = 0

/obj/structure/particle_accelerator/particle_emitter/center
	icon_state = "emitter_center"
	reference = "emitter_center"

/obj/structure/particle_accelerator/particle_emitter/left
	icon_state = "emitter_left"
	reference = "emitter_left"

/obj/structure/particle_accelerator/particle_emitter/right
	icon_state = "emitter_right"
	reference = "emitter_right"

/obj/structure/particle_accelerator/particle_emitter/proc/set_delay(delay)
	if(delay >= 0)
		fire_delay = delay
		return 1
	return 0

/obj/structure/particle_accelerator/particle_emitter/proc/emit_particle(strength = 0)
	if((last_shot + fire_delay) <= world.time)
		last_shot = world.time
		var/turf/T = get_turf(src)
		var/obj/effect/accelerated_particle/P
		switch(strength)
			if(0)
				P = new/obj/effect/accelerated_particle/weak(T)
				playsound(src, 'modularz_arkstation/modules/singulo-and-tesla/cyclotron.ogg', 30, FALSE)
			if(1)
				P = new/obj/effect/accelerated_particle(T)
				playsound(src, 'modularz_arkstation/modules/singulo-and-tesla/cyclotron.ogg', 70, FALSE)
			if(2)
				P = new/obj/effect/accelerated_particle/strong(T)
				playsound(src, 'modularz_arkstation/modules/singulo-and-tesla/cyclotron.ogg', 100, FALSE)
			if(3)
				P = new/obj/effect/accelerated_particle/powerful(T)
				playsound(src, 'modularz_arkstation/modules/singulo-and-tesla/cyclotron.ogg', 100, FALSE)
		P.setDir(dir)
		return 1
	return 0

/datum/wires/particle_accelerator/control_box
	holder_type = /obj/machinery/particle_accelerator/control_box
	proper_name = "Particle Accelerator"

/datum/wires/particle_accelerator/control_box/New(atom/holder)
	wires = list(
		WIRE_POWER, WIRE_STRENGTH, WIRE_LIMIT,
		WIRE_INTERFACE
	)
	add_duds(2)
	..()

/datum/wires/particle_accelerator/control_box/interactable(mob/user)
	if(!..())
		return FALSE
	var/obj/machinery/particle_accelerator/control_box/C = holder
	if(C.construction_state == 2)
		return TRUE

/datum/wires/particle_accelerator/control_box/on_pulse(wire)
	var/obj/machinery/particle_accelerator/control_box/C = holder
	switch(wire)
		if(WIRE_POWER)
			C.toggle_power()
		if(WIRE_STRENGTH)
			C.add_strength()
		if(WIRE_INTERFACE)
			C.interface_control = !C.interface_control
		if(WIRE_LIMIT)
			C.visible_message(span_notice("[icon2html(C, viewers(holder))]<b>[C]</b> makes a loud whirring noise."))

/datum/wires/particle_accelerator/control_box/on_cut(wire, mend, source)
	var/obj/machinery/particle_accelerator/control_box/C = holder
	switch(wire)
		if(WIRE_POWER)
			if(C.active == !mend)
				C.toggle_power()
		if(WIRE_STRENGTH)
			for(var/i = 1; i < 3; i++)
				C.remove_strength()
		if(WIRE_INTERFACE)
			if(!mend)
				C.interface_control = FALSE
		if(WIRE_LIMIT)
			C.strength_upper_limit = (mend ? 2 : 3)
			if(C.strength_upper_limit < C.strength)
				C.remove_strength()
	. = ..()

/datum/wires/particle_accelerator/control_box/emp_pulse() // to prevent singulo from pulsing wires
	return

/obj/effect/singularity_creation
	name = "collapsing spacetime"
	desc = "It looks like spacetime is collapsing, oh shit!"
	icon = 'modularz_arkstation/modules/singulo-and-tesla/singularity_creation.dmi'
	icon_state = ""
	anchored = TRUE
	opacity = FALSE
	pixel_x = -32
	pixel_y = -32
	var/timeleft = 62

/obj/effect/singularity_creation/Initialize(mapload)
	. = ..()
	if(timeleft)
		QDEL_IN(src, timeleft)

/obj/effect/singularity_creation/singularity_act()
	return

/obj/singularity/proc/make_visible()
	invisibility = NONE

/obj/singularity/proc/make_unanchored()
	anchored = FALSE

/datum/supply_pack/engine/particle_accelerator
	name = "Particle Accelerator Crate"
	desc = "A supermassive black hole or hyper-powered teslaball are the perfect way to spice up any party! This \"My First Apocalypse\" kit contains everything you need to build your own Particle Accelerator! Ages 10 and up."
	cost = CARGO_CRATE_VALUE * 5
	contains = list(/obj/structure/particle_accelerator/fuel_chamber,
					/obj/machinery/particle_accelerator/control_box,
					/obj/structure/particle_accelerator/particle_emitter/center,
					/obj/structure/particle_accelerator/particle_emitter/left,
					/obj/structure/particle_accelerator/particle_emitter/right,
					/obj/structure/particle_accelerator/power_box,
					/obj/structure/particle_accelerator/end_cap)
	crate_name = "particle accelerator crate"

/datum/supply_pack/engine/sing_gen
	name = "Singularity Generator Crate"
	desc = "The key to unlocking the power of Lord Singuloth. Particle Accelerator not included."
	cost = CARGO_CRATE_VALUE * 3
	contains = list(/obj/machinery/the_singularitygen)
	crate_name = "singularity generator crate"

/datum/supply_pack/engine/tesla_gen
	name = "Tesla Generator Crate"
	desc = "The key to unlocking the power of the Tesla energy ball. Particle Accelerator not included."
	cost = CARGO_CRATE_VALUE * 3
	contains = list(/obj/machinery/the_singularitygen/tesla)
	crate_name = "tesla generator crate"
 // Disabled due to being non-functional.

/obj/singularity
	icon = 'modularz_arkstation/modules/singulo-and-tesla/singularity_s1.dmi'
	anchored = TRUE
	invisibility = INVISIBILITY_MAXIMUM
	var/atom/movable/warp_effect/warp

/obj/singularity/Initialize(mapload, starting_energy = 50)
	. = ..()
	//NOVA EDIT ADDITION BEGIN
	new /obj/effect/singularity_creation(loc)
	warp = new(src)
	vis_contents += warp

	addtimer(CALLBACK(src, PROC_REF(make_visible)), 62)
	addtimer(CALLBACK(src, PROC_REF(make_unanchored)), 62)

	energy = starting_energy
	//NOVA EDIT END

/obj/singularity/expand(force_size, seconds_per_tick)

	var/temp_allowed_size = allowed_size

	if(force_size)
		temp_allowed_size = force_size

	if(temp_allowed_size >= STAGE_SIX && !consumed_supermatter)
		temp_allowed_size = STAGE_FIVE

	//cap it off if the singuloth has a maximum stage
	temp_allowed_size = min(temp_allowed_size, maximum_stage)

	if(temp_allowed_size == maximum_stage)
		//It cant go smaller due to e loss
		dissipate = FALSE

	var/new_grav_pull
	var/new_consume_range

	switch(temp_allowed_size)
		if(STAGE_ONE)
			current_size = STAGE_ONE
			icon = 'modularz_arkstation/modules/singulo-and-tesla/singularity_s1.dmi'
			icon_state = "[singularity_icon_variant]_s1"
			pixel_x = 0
			pixel_y = 0
			new_grav_pull = 4
			new_consume_range = 0
			dissipate_delay = 10
			time_since_last_dissipiation = 0
			dissipate_strength = 1
		if(STAGE_TWO)
			if(check_cardinals_range(1, TRUE))
				current_size = STAGE_TWO
				icon = 'modularz_arkstation/modules/singulo-and-tesla/singularity_s3.dmi'
				icon_state = "[singularity_icon_variant]_s3"
				pixel_x = -32
				pixel_y = -32
				new_grav_pull = 6
				new_consume_range = 1
				dissipate_delay = 5
				time_since_last_dissipiation = 0
				dissipate_strength = 5
				warp.pixel_x = -32
				warp.pixel_y = -32
		if(STAGE_THREE)
			if(check_cardinals_range(2, TRUE))
				current_size = STAGE_THREE
				icon = 'modularz_arkstation/modules/singulo-and-tesla/singularity_s5.dmi'
				icon_state = "[singularity_icon_variant]_s5"
				pixel_x = -64
				pixel_y = -64
				new_grav_pull = 8
				new_consume_range = 2
				dissipate_delay = 4
				time_since_last_dissipiation = 0
				dissipate_strength = 20
				warp.pixel_x = -64
				warp.pixel_y = -64
		if(STAGE_FOUR)
			if(check_cardinals_range(3, TRUE))
				current_size = STAGE_FOUR
				icon = 'modularz_arkstation/modules/singulo-and-tesla/singularity_s7.dmi'
				icon_state = "[singularity_icon_variant]_s7"
				pixel_x = -96
				pixel_y = -96
				new_grav_pull = 10
				new_consume_range = 3
				dissipate_delay = 10
				time_since_last_dissipiation = 0
				dissipate_strength = 10
				warp.pixel_x = -96
				warp.pixel_y = -96
		if(STAGE_FIVE)//this one also lacks a check for gens because it eats everything
			current_size = STAGE_FIVE
			icon = 'modularz_arkstation/modules/singulo-and-tesla/singularity_s9.dmi'
			icon_state = "[singularity_icon_variant]_s9"
			pixel_x = -128
			pixel_y = -128
			new_grav_pull = 10
			new_consume_range = 4
			dissipate = FALSE //It cant go smaller due to e loss
			warp.pixel_x = -128
			warp.pixel_y = -128
		if(STAGE_SIX) //This only happens if a stage 5 singulo consumes a supermatter shard.
			current_size = STAGE_SIX
			icon = 'icons/effects/352x352.dmi'
			icon_state = "[singularity_icon_variant]_s11"
			pixel_x = -160
			pixel_y = -160
			new_grav_pull = 15
			new_consume_range = 5
			dissipate = FALSE
			warp.pixel_x = -160
			warp.pixel_y = -160

	var/datum/component/singularity/resolved_singularity = singularity_component.resolve()
	if (!isnull(resolved_singularity))
		resolved_singularity.consume_range = new_consume_range
		resolved_singularity.grav_pull = new_grav_pull
		resolved_singularity.disregard_failed_movements = current_size >= STAGE_FIVE
		resolved_singularity.roaming = move_self && current_size >= STAGE_TWO
		resolved_singularity.singularity_size = current_size

	if(current_size == allowed_size)
		investigate_log("grew to size [current_size].", INVESTIGATE_ENGINE)
		return TRUE
	else if(current_size < (--temp_allowed_size))
		expand(temp_allowed_size)
	else
		return FALSE

/obj/singularity/Destroy()
	. = ..()
	vis_contents -= warp
	warp = null
	return ..()

/obj/singularity/on_changed_z_level(turf/old_turf, turf/new_turf, same_z_layer, notify_contents)
	. = ..()
	if(same_z_layer)
		return
	if(warp)
		SET_PLANE(warp, PLANE_TO_TRUE(warp.plane), new_turf)

#undef PA_CONSTRUCTION_UNSECURED
#undef PA_CONSTRUCTION_UNWIRED
#undef PA_CONSTRUCTION_PANEL_OPEN
#undef PA_CONSTRUCTION_COMPLETE
