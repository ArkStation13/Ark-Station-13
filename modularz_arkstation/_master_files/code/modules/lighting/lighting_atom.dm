/atom/proc/update_bloom(lamp_pixel_x, lamp_pixel_y)
	cut_overlay(glow_overlay)
	cut_overlay(exposure_overlay)
	if(glow_icon && glow_icon_state)
		if(!glow_overlay)
			glow_overlay = image(icon = glow_icon, icon_state = glow_icon_state, dir = dir, layer = 1)

		glow_overlay.plane = LIGHTING_LAMPS_PLANE // ЕБАНЫЙ ПЛЕЙН ЛАМП.
		glow_overlay.blend_mode = BLEND_OVERLAY
		if(glow_colored)
			var/datum/ColorMatrix/MATRIX = new(light_color, GLOB.GLOW_CONTRAST_BASE + GLOB.GLOW_CONTRAST_POWER * light_power, GLOB.GLOW_BRIGHTNESS_BASE + GLOB.GLOW_BRIGHTNESS_POWER * light_power)
			glow_overlay.color = MATRIX.Get()

		add_overlay(glow_overlay)

	if(exposure_icon && exposure_icon_state)
		if(!exposure_overlay)
			exposure_overlay = image(icon = exposure_icon, icon_state = exposure_icon_state, dir = REVERSE_DIR(dir), layer = -1)

		exposure_overlay.plane = LIGHTING_EXPOSURE_PLANE
		exposure_overlay.blend_mode = BLEND_ADD
		exposure_overlay.appearance_flags = RESET_ALPHA | RESET_COLOR | KEEP_APART

		var/datum/ColorMatrix/MATRIX = new(1, GLOB.EXPOSURE_CONTRAST_BASE + GLOB.EXPOSURE_CONTRAST_POWER * light_power, GLOB.EXPOSURE_BRIGHTNESS_BASE + GLOB.EXPOSURE_BRIGHTNESS_POWER * light_power)
		if(exposure_colored)
			MATRIX.SetColor(light_color, GLOB.EXPOSURE_CONTRAST_BASE + GLOB.EXPOSURE_CONTRAST_POWER * light_power, GLOB.EXPOSURE_BRIGHTNESS_BASE + GLOB.EXPOSURE_BRIGHTNESS_POWER * light_power)

		exposure_overlay.color = MATRIX.Get()

		var/icon/EX = icon(icon = exposure_icon, icon_state = exposure_icon_state)
		exposure_overlay.pixel_x = 16 - EX.Width() / 2
		exposure_overlay.pixel_y = 16 - EX.Height() / 2

		add_overlay(exposure_overlay)

/atom/proc/delete_lights()
	cut_overlay(glow_overlay)
	cut_overlay(exposure_overlay)
	QDEL_NULL(glow_overlay)
	QDEL_NULL(exposure_overlay)
