/datum/component/pixel_shift
	dupe_mode = COMPONENT_DUPE_UNIQUE
	//ARK STATION EDIT: START
	//whether or not parent is shifting items
	var/shifting_items
	//whether or not parent is tilting
	var/tilting
	//how tilted the parent is
	var/how_tilted
	//the maximum amount of tilt parent can achieve
	var/maximum_tilt = 45
	//If we are shifted
	//ARK STATION EDIT: END
	/// Whether the mob is pixel shifted or not
	var/is_shifted = FALSE
	/// If we are in the shifting setting.
	var/shifting = TRUE
	/// Takes the four cardinal direction defines. Any atoms moving into this atom's tile will be allowed to from the added directions.
	var/passthroughable = NONE
	/// The maximum amount of pixels allowed to move in the turf.
	var/maximum_pixel_shift = 16
	/// The amount of pixel shift required to make the parent passthroughable.
	var/passable_shift_threshold = 8
	/// Current x offset
	var/pixel_shift_x = 0
	/// Current y offset
	var/pixel_shift_y = 0

/datum/component/pixel_shift/Initialize(...)
	. = ..()
	if(!isliving(parent))
		return COMPONENT_INCOMPATIBLE

/datum/component/pixel_shift/RegisterWithParent()
	//ARK STATION EDIT: START
	RegisterSignal(parent, COMSIG_KB_MOB_ITEM_PIXEL_SHIFT_DOWN, PROC_REF(item_pixel_shift_down))
	RegisterSignal(parent, COMSIG_KB_MOB_ITEM_PIXEL_SHIFT_UP, PROC_REF(item_pixel_shift_up))
	//ARK STATION EDIT: END
	RegisterSignal(parent, COMSIG_KB_MOB_PIXEL_SHIFT_DOWN, PROC_REF(pixel_shift_down))
	RegisterSignal(parent, COMSIG_KB_MOB_PIXEL_SHIFT_UP, PROC_REF(pixel_shift_up))
	//ARK STATION EDIT: START
	RegisterSignal(parent, COMSIG_KB_MOB_PIXEL_TILT_DOWN, PROC_REF(pixel_tilt_down))
	RegisterSignal(parent, COMSIG_KB_MOB_PIXEL_TILT_UP, PROC_REF(pixel_tilt_up))
	//ARK STATION EDIT: END
	RegisterSignals(parent, list(COMSIG_LIVING_RESET_PULL_OFFSETS, COMSIG_LIVING_SET_PULL_OFFSET, COMSIG_MOVABLE_MOVED), PROC_REF(unpixel_shift))
	RegisterSignal(parent, COMSIG_MOB_CLIENT_PRE_LIVING_MOVE, PROC_REF(pre_move_check))
	RegisterSignal(parent, COMSIG_LIVING_CAN_ALLOW_THROUGH, PROC_REF(check_passable))

/datum/component/pixel_shift/UnregisterFromParent()
	//ARK STATION EDIT: START
	UnregisterSignal(parent, COMSIG_KB_MOB_ITEM_PIXEL_SHIFT_DOWN)
	UnregisterSignal(parent, COMSIG_KB_MOB_ITEM_PIXEL_SHIFT_UP)
	UnregisterSignal(parent, COMSIG_KB_MOB_PIXEL_TILT_DOWN)
	UnregisterSignal(parent, COMSIG_KB_MOB_PIXEL_TILT_UP)
	//ARK STATION EDIT: END
	UnregisterSignal(parent, COMSIG_KB_MOB_PIXEL_SHIFT_DOWN)
	UnregisterSignal(parent, COMSIG_KB_MOB_PIXEL_SHIFT_UP)
	UnregisterSignal(parent, COMSIG_MOB_CLIENT_PRE_LIVING_MOVE) //ARK STATION EDIT
	UnregisterSignal(parent, COMSIG_LIVING_RESET_PULL_OFFSETS)
	UnregisterSignal(parent, COMSIG_LIVING_SET_PULL_OFFSET)
	UnregisterSignal(parent, COMSIG_MOVABLE_MOVED)
	UnregisterSignal(parent, COMSIG_MOB_CLIENT_PRE_LIVING_MOVE)
	UnregisterSignal(parent, COMSIG_LIVING_CAN_ALLOW_THROUGH)

//locks our movement when holding our keybinds
/datum/component/pixel_shift/proc/pre_move_check(mob/source, new_loc, direct)
	SIGNAL_HANDLER
//	if(shifting)
	if(shifting_items || shifting || tilting) //ARK STATION EDIT
		pixel_shift(source, direct)
		return COMSIG_MOB_CLIENT_BLOCK_PRE_LIVING_MOVE

//ARK STATION EDIT: START
//procs for tilting parent

/datum/component/pixel_shift/proc/pixel_tilt_down()
	SIGNAL_HANDLER
	tilting = TRUE
	return COMSIG_KB_ACTIVATED

/datum/component/pixel_shift/proc/pixel_tilt_up()
	SIGNAL_HANDLER
	tilting = FALSE

//Procs for shifting items

/datum/component/pixel_shift/proc/item_pixel_shift_down()
	SIGNAL_HANDLER
	shifting_items = TRUE
	return COMSIG_KB_ACTIVATED

/datum/component/pixel_shift/proc/item_pixel_shift_up()
	SIGNAL_HANDLER
	shifting_items = FALSE

//Procs for shifting mobs
//ARK STATION EDIT: END

/// Checks if the parent is considered passthroughable from a direction. Projectiles will ignore the check and hit.
/datum/component/pixel_shift/proc/check_passable(mob/source, atom/movable/mover, border_dir)
	SIGNAL_HANDLER
	if(!isprojectile(mover) && !mover.throwing && passthroughable & border_dir)
		return COMPONENT_LIVING_PASSABLE

/// Activates Pixel Shift on Keybind down. Only Pixel Shift movement will be allowed.
/datum/component/pixel_shift/proc/pixel_shift_down()
	SIGNAL_HANDLER
	shifting = TRUE
	return COMSIG_KB_ACTIVATED

/// Disables Pixel Shift on Keybind up. Allows to Move.
/datum/component/pixel_shift/proc/pixel_shift_up()
	SIGNAL_HANDLER
	shifting = FALSE

/// Sets parent pixel offsets to default and deletes the component.
/datum/component/pixel_shift/proc/unpixel_shift()
	SIGNAL_HANDLER
	passthroughable = NONE
	if(is_shifted)
		var/mob/living/owner = parent
		owner.transform = turn(owner.transform, -how_tilted) //ARK STATION EDIT
		owner.remove_offsets(type)
	qdel(src)

/// In-turf pixel movement which can allow things to pass through if the threshold is met.
/datum/component/pixel_shift/proc/pixel_shift(mob/source, direct)
	passthroughable = NONE
	var/mob/living/owner = parent
	//ARK STATION EDIT:START
	/*switch(direct)
		if(NORTH)
			if(pixel_shift_y <= maximum_pixel_shift + owner.base_pixel_y)
				pixel_shift_y++
				is_shifted = TRUE
		if(EAST)
			if(pixel_shift_x <= maximum_pixel_shift + owner.base_pixel_x)
				pixel_shift_x++
				is_shifted = TRUE
		if(SOUTH)
			if(pixel_shift_y >= -maximum_pixel_shift + owner.base_pixel_y)
				pixel_shift_y--
				is_shifted = TRUE
		if(WEST)
			if(owner.pixel_x >= -maximum_pixel_shift + owner.base_pixel_x)
				owner.pixel_x--
				is_shifted = TRUE
				*/
	if(shifting_items)
		var/obj/item/pulled_item = source.pulling
		if(!istype(pulled_item))
			return
		switch(direct)
			if(NORTH)
				if(pulled_item.pixel_y <= maximum_pixel_shift + pulled_item.base_pixel_y)
					pulled_item.pixel_y++
			if(EAST)
				if(pulled_item.pixel_x <= maximum_pixel_shift + pulled_item.base_pixel_x)
					pulled_item.pixel_x++
			if(SOUTH)
				if(pulled_item.pixel_y >= -maximum_pixel_shift + pulled_item.base_pixel_y)
					pulled_item.pixel_y--
			if(WEST)
				if(pulled_item.pixel_x >= -maximum_pixel_shift + pulled_item.base_pixel_x)
					pulled_item.pixel_x--
	else if(tilting)
		switch(direct)
			if(EAST)
				if(how_tilted <= maximum_tilt)
					owner.transform = turn(owner.transform, 1)
					how_tilted++
					is_shifted = TRUE
			if(WEST)
				if(how_tilted >= -maximum_tilt)
					owner.transform = turn(owner.transform, -1)
					how_tilted--
					is_shifted = TRUE
	else if(shifting)
		switch(direct)
			if(NORTH)
				if(pixel_shift_y <= maximum_pixel_shift + owner.base_pixel_y)
					pixel_shift_y++
					is_shifted = TRUE
			if(EAST)
				if(pixel_shift_x <= maximum_pixel_shift + owner.base_pixel_x)
					pixel_shift_x++
					is_shifted = TRUE
			if(SOUTH)
				if(pixel_shift_y >= -maximum_pixel_shift + owner.base_pixel_y)
					pixel_shift_y--
					is_shifted = TRUE
			if(WEST)
				if(owner.pixel_x >= -maximum_pixel_shift + owner.base_pixel_x)
					owner.pixel_x--
					is_shifted = TRUE
	//ARK STATION EDIT:END

	if(is_shifted && !shifting_items)
		owner.add_offsets(type, x_add = pixel_shift_x, y_add = pixel_shift_y, animate = FALSE)

	// Yes, I know this sets it to true for everything if more than one is matched.
	// Movement doesn't check diagonals, and instead just checks EAST or WEST, depending on where you are for those.
	if(owner.pixel_y > passable_shift_threshold)
		passthroughable |= EAST | SOUTH | WEST
	else if(owner.pixel_y < -passable_shift_threshold)
		passthroughable |= NORTH | EAST | WEST
	if(owner.pixel_x > passable_shift_threshold)
		passthroughable |= NORTH | SOUTH | WEST
	else if(owner.pixel_x < -passable_shift_threshold)
		passthroughable |= NORTH | EAST | SOUTH
