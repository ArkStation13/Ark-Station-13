#define CELLS 8								//Amount of cells per row/column in grid
#define CELLSIZE (world.icon_size/CELLS)	//Size of a cell in pixels

/obj/structure/table/MouseDrop_T(obj/item/O, mob/user, src_location, over_location, src_control, over_control, params)
	if(ismob(O.loc)) //If placing an item
		if(!isitem(O) || user.get_active_hand() != O)
			return ..()
		if(issilicon(user))
			return
		user.dropItemToGround(user.get_active_held_item())
		if(O.loc != src.loc)
			step(O, get_dir(O, src))

	else if(isturf(O.loc) && isitem(O))
		var/obj/item/I = O
		if(I.anchored)
			return

		if((isliving(user)) && (Adjacent(user)) && !(user.incapacitated()))
			O.forceMove(loc)
			auto_align(I, params, TRUE)
		return

	return ..()

/obj/item/proc/randpixel_xy()
	var/randpixel = 6
	if(!pixel_x && !pixel_y)
		pixel_x = rand(-randpixel, randpixel)
		pixel_y = rand(-randpixel, randpixel)
		return TRUE
	else
		return FALSE

/obj/item/var/list/center_of_mass = list("x" = 16,"y" = 16)

/proc/auto_align(obj/item/W, click_parameters, var/animate = FALSE)
	if(!W.center_of_mass)
		W.randpixel_xy()
		return

	if(!click_parameters)
		return

	var/list/mouse_control = params2list(click_parameters)

	var/mouse_x = text2num(mouse_control["icon-x"])
	var/mouse_y = text2num(mouse_control["icon-y"])

	if(isnum(mouse_x) && isnum(mouse_y))
		var/cell_x = max(0, min(CELLS-1, round(mouse_x/CELLSIZE)))
		var/cell_y = max(0, min(CELLS-1, round(mouse_y/CELLSIZE)))

		var/target_x = (CELLSIZE * (0.5 + cell_x)) - W.center_of_mass["x"]
		var/target_y = (CELLSIZE * (0.5 + cell_y)) - W.center_of_mass["y"]
		if(animate)
			var/dist_x = abs(W.pixel_x - target_x)
			var/dist_y = abs(W.pixel_y - target_y)
			var/dist = sqrt((dist_x*dist_x)+(dist_y*dist_y))
			animate(W, pixel_x=target_x, pixel_y=target_y,time=dist*0.5)
		else
			W.pixel_x = target_x
			W.pixel_y = target_y

#undef CELLS
#undef CELLSIZE
