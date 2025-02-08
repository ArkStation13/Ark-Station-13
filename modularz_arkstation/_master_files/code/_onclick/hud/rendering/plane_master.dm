// Блюр на LIGHTING_EXPOSURE_PLANE плейн (Т.е. это сам эффект БЛУМА. Там добавляется оверлей, а эта хуйня его блюрит.)
/atom/movable/screen/plane_master/exposure
	name = "Exposure Plane Master"
	documentation = "Exposure."
	plane = LIGHTING_EXPOSURE_PLANE
	appearance_flags = PLANE_MASTER|PIXEL_SCALE
	blend_mode = BLEND_ADD
	blend_mode_override = BLEND_ADD
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	render_relay_planes = list(RENDER_PLANE_GAME)

/atom/movable/screen/plane_master/exposure/show_to(mob/mymob)
	. = ..()
	if(!.)
		return
	remove_filter("blur_exposure")
	if(istype(mymob))
		add_filter("blur_exposure", 1, gauss_blur_filter(size = 30)) //20

// Собственно свет (По идее)
// /atom/movable/screen/plane_master/lamps_selfglow
// 	name = "Lamps Selfglow Plane Master"
// 	documentation = "Lamps Selfglow."
// 	plane = LIGHTING_LAMPS_SELFGLOW
// 	appearance_flags = PLANE_MASTER
// 	blend_mode = BLEND_ADD
// 	blend_mode_override = BLEND_ADD
// 	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
// 	render_relay_planes = list(RENDER_PLANE_GAME)

// /atom/movable/screen/plane_master/lamps_selfglow/show_to(mob/mymob)
// 	. = ..()
// 	if(!.)
// 		return
// 	remove_filter("lamps_selfglow_bloom")
// 	if(istype(mymob))
// 		add_filter("lamps_selfglow_bloom", 1, bloom_filter(threshold = "#aaaaaa", size = 3, offset = 2, alpha = 100))

// Блики
/atom/movable/screen/plane_master/lamps_glare
	name = "Lamps Glare and Selfglow Plane Master"
	documentation = "Lamps Light!."
	plane = LIGHTING_LAMPS_PLANE
	appearance_flags = PLANE_MASTER
	blend_mode = BLEND_ADD
	blend_mode_override = BLEND_ADD
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	render_relay_planes = list(RENDER_PLANE_GAME)

/atom/movable/screen/plane_master/lamps_glare/show_to(mob/mymob)
	. = ..()
	if(!.)
		return
	remove_filter("lamps_glare")
	remove_filter("lamps_selfglow_bloom")
	if(istype(mymob))
		add_filter("lamps_glare", 1, radial_blur_filter(size = 0.04)) // 0.06
		add_filter("lamps_selfglow_bloom", 1, bloom_filter(threshold = "#aaaaaa", size = 2, offset = 1, alpha = 60))
