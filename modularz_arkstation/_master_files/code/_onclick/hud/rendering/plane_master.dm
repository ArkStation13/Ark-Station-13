// Включение Блума. Работает на полшишки. У меня отрубал только сам блюр на ОВЕРЛЕЙ в update_bloom()
/datum/preference/toggle/bloom_filter
	category = PREFERENCE_CATEGORY_GAME_PREFERENCES
	savefile_key = "bloom_filter"
	savefile_identifier = PREFERENCE_PLAYER
	default_value = TRUE

// Выбор сильноты. Хуй знает, у меня не работало.
/datum/preference/choiced/bloom_filter_level
	category = PREFERENCE_CATEGORY_GAME_PREFERENCES
	savefile_identifier = PREFERENCE_PLAYER
	savefile_key = "bloom_filter_level"

/datum/preference/choiced/bloom_filter_level/init_possible_values()
	return list(
		"Disabled",
		"Low",
		"Medium (Default)",
		"High"
	)

/datum/preference/choiced/bloom_filter_level/create_default_value()
	return "Medium (Default)"
//
//
// Лампы. К нему подсасываются другие эффекты, а от него уже на update_bloom() по LIGHTING_LAMPS_PLANE
// /atom/movable/screen/plane_master/lamps
// 	name = "Lamps Plane Master"
// 	documentation = "Lamps."
// 	plane = LIGHTING_LAMPS_PLANE
// 	appearance_flags = PLANE_MASTER
// 	blend_mode_override = BLEND_OVERLAY
// 	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
// 	render_relay_planes = list(RENDER_PLANE_GAME)

// 	render_target = LIGHTING_LAMPS_RENDER_TARGET // ТАРГЕТ ДЛЯ ДРУГИХ ЭФФЕКТОВ. ВСЁ ЭТО КОМПАНУЕТСЯ И СОСЕТСЯ К update_bloom() ПОД LIGHTING_LAMPS_PLANE

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
	if(istype(mymob) && mymob.canon_client?.prefs?.read_preference(/datum/preference/toggle/bloom_filter))
		add_filter("blur_exposure", 1, gauss_blur_filter(size = 20))

// Собственно свет (По идее)
/atom/movable/screen/plane_master/lamps_selfglow
	name = "Lamps Selfglow Plane Master"
	documentation = "Lamps Selfglow."
	plane = LIGHTING_LAMPS_PLANE
	appearance_flags = PLANE_MASTER
	blend_mode = BLEND_ADD //BLEND_OVERLAY
	blend_mode_override = BLEND_ADD //BLEND_OVERLAY
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	render_relay_planes = list(RENDER_PLANE_GAME)

/atom/movable/screen/plane_master/lamps_selfglow/show_to(mob/mymob)
	. = ..()
	if(!.)
		return
	remove_filter("lamps_selfglow_bloom")

	if(istype(mymob) && mymob.canon_client?.prefs?.read_preference(/datum/preference/toggle/bloom_filter))
		var/bloomsize = 0
		var/bloomoffset = 0
		switch(mymob.canon_client?.prefs?.read_preference(/datum/preference/choiced/bloom_filter_level))
			if("Disabled")
				return
			if("Low")
				bloomsize = 2
				bloomoffset = 1
			if("Medium (Default)")
				bloomsize = 3
				bloomoffset = 2
			if("High")
				bloomsize = 5
				bloomoffset = 3

		add_filter("lamps_selfglow_bloom", 1, bloom_filter(threshold = "#aaaaaa", size = bloomsize, offset = bloomoffset, alpha = 100))

// Блики
/atom/movable/screen/plane_master/lamps_glare
	name = "Lamps Glare Plane Master"
	documentation = "Lamps Glare."
	plane = LIGHTING_LAMPS_GLARE
	appearance_flags = PLANE_MASTER
	blend_mode = BLEND_OVERLAY
	blend_mode_override = BLEND_OVERLAY
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	render_relay_planes = list(RENDER_PLANE_GAME)

/atom/movable/screen/plane_master/lamps_glare/show_to(mob/mymob)
	. = ..()
	if(!.)
		return
	remove_filter("lamps_glare")
	if(istype(mymob) && mymob.canon_client?.prefs?.read_preference(/datum/preference/toggle/bloom_filter))
		add_filter("lamps_glare", 1, radial_blur_filter(size = 0.06)) // 0.05
