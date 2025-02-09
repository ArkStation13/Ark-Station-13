/atom/movable/screen/close_eyes
	name = "close eyes"
	icon = 'modularz_arkstation/_master_files/icons/ui_icons/ark_ui_styles/screen_midnight.dmi'
	icon_state = "opened"
	screen_loc = ui_above_movement

/atom/movable/screen/close_eyes/Click(location,control,params)
	if(!ishuman(usr))
		return
	var/mob/living/carbon/human/user = usr

	if(user.stat == DEAD)
		return

	user.close_or_open_eyes()

	if(user.is_eyes_open == TRUE)
		name = "close eyes"
		icon_state = "opened"
	else
		name = "open eyes"
		icon_state = "closed"
