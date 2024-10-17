/atom/movable/screen/fullscreen/vignette
	icon_state = "vignette"
	layer = CURSE_LAYER
	plane = FULLSCREEN_PLANE

/mob/living/carbon/proc/vignette_set_update()
	if(stat != DEAD)
		overlay_fullscreen("vignette", /atom/movable/screen/fullscreen/vignette)
	else
		clear_fullscreen("vignette")
