/atom/movable/screen/parallax_layer
	icon = 'modularz_arkstation/_master_files/icons/parallax/parallax.dmi' // PORTED FROM SHIPTEST - CELADON // MODIFIED BY KRASHLY

/atom/movable/screen/parallax_layer/layer_1
	icon_state = "layer1"
	speed = 0.6
	layer = 1

/atom/movable/screen/parallax_layer/layer_2
	icon_state = "layer2"
	speed = 1
	layer = 2

/atom/movable/screen/parallax_layer/layer_3
	icon_state = "layer3"
	speed = 1.4
	layer = 3

/atom/movable/screen/parallax_layer/random
	blend_mode = BLEND_OVERLAY
	speed = 3
	layer = 3

/atom/movable/screen/parallax_layer/random/asteroids
	icon_state = "asteroids"

/atom/movable/screen/parallax_layer/planet
	icon = 'icons/effects/parallax.dmi'
	icon_state = "planet"
	blend_mode = BLEND_OVERLAY
	absolute = TRUE
	speed = 3
	layer = 30

/atom/movable/screen/parallax_layer/random/gas
	icon_state = "gas"

/atom/movable/screen/parallax_layer/random/trash
	icon_state = "trash"

/atom/movable/screen/parallax_layer/random/infection
	icon_state = "infection"
	speed = 0.6
	layer = 1

// Layer 1
/atom/movable/screen/parallax_layer/layer_1_0
	icon_state = "layer1_0"
	speed = 0.6
	layer = 1

/atom/movable/screen/parallax_layer/layer_1_1
	icon_state = "layer1_1"
	speed = 0.6
	layer = 1

/atom/movable/screen/parallax_layer/layer_1_2
	icon_state = "layer1_2"
	speed = 0.6
	layer = 1

/atom/movable/screen/parallax_layer/layer_1_3
	icon_state = "layer1_3"
	speed = 0.6
	layer = 1

/atom/movable/screen/parallax_layer/layer_1_4
	icon_state = "layer1_4"
	speed = 0.6
	layer = 1

/atom/movable/screen/parallax_layer/layer_1_5
	icon_state = "layer1_5"
	speed = 0.6
	layer = 1

/atom/movable/screen/parallax_layer/layer_1_6
	icon_state = "layer1_6"
	speed = 0.6
	layer = 1

/atom/movable/screen/parallax_layer/layer_1_7
	icon_state = "layer1_7"
	speed = 0.6
	layer = 1

/atom/movable/screen/parallax_layer/layer_1_8
	icon_state = "layer1_8"
	speed = 0.6
	layer = 1

/atom/movable/screen/parallax_layer/layer_1_9
	icon_state = "layer1_9"
	speed = 0.6
	layer = 1

/atom/movable/screen/parallax_layer/layer_1_10
	icon_state = "layer1_10"
	speed = 0.6
	layer = 1

/atom/movable/screen/parallax_layer/layer_1_11
	icon_state = "layer1_11"
	speed = 0.6
	layer = 1

/atom/movable/screen/parallax_layer/layer_1_12
	icon_state = "layer1_12"
	speed = 0.6
	layer = 1

/atom/movable/screen/parallax_layer/layer_1_13
	icon_state = "layer1_13"
	speed = 0.6
	layer = 1

/atom/movable/screen/parallax_layer/layer_1_14
	icon_state = "layer1_14"
	speed = 0.6
	layer = 1

/atom/movable/screen/parallax_layer/layer_1_15
	icon_state = "layer1_15"
	speed = 0.6
	layer = 1

/atom/movable/screen/parallax_layer/layer_1_16
	icon_state = "layer1_16"
	speed = 0.6
	layer = 1

// Layer 2
/atom/movable/screen/parallax_layer/layer_2_1
	icon_state = "layer2_1"
	speed = 1
	layer = 2

/atom/movable/screen/parallax_layer/layer_2_2
	icon_state = "layer2_2"
	speed = 1
	layer = 2

/atom/movable/screen/parallax_layer/layer_2_3
	icon_state = "layer2_3"
	speed = 1
	layer = 2

/atom/movable/screen/parallax_layer/layer_2_4
	icon_state = "layer2_4"
	speed = 1
	layer = 2

/atom/movable/screen/parallax_layer/layer_2_5
	icon_state = "layer2_5"
	speed = 1
	layer = 2

// Layer 3
/atom/movable/screen/parallax_layer/layer_3_1
	icon_state = "layer3_1"
	speed = 1.4
	layer = 3

/atom/movable/screen/parallax_layer/layer_3_2
	icon_state = "layer3_2"
	speed = 1.4
	layer = 3

//

/datum/hud/create_parallax(mob/viewmob)
	var/mob/screenmob = viewmob || mymob
	var/client/C = screenmob.client

	if (!apply_parallax_pref(viewmob)) //don't want shit computers to crash when specing someone with insane parallax, so use the viewer's pref
		for(var/atom/movable/screen/plane_master/parallax as anything in get_true_plane_masters(PLANE_SPACE_PARALLAX))
			parallax.hide_plane(screenmob)
		return

	for(var/atom/movable/screen/plane_master/parallax as anything in get_true_plane_masters(PLANE_SPACE_PARALLAX))
		parallax.unhide_plane(screenmob)

	if(isnull(C.parallax_rock))
		C.parallax_rock = new(null, src)
	C.screen |= C.parallax_rock

	if(!length(C.parallax_layers_cached))
		C.parallax_layers_cached = list()
		// Layer 1
		if(prob(10))
			C.parallax_layers_cached += new /atom/movable/screen/parallax_layer/random/infection(null, src)
		if(prob(30))
			C.parallax_layers_cached += new /atom/movable/screen/parallax_layer/layer_1_0(null, src)
		if(prob(30))
			C.parallax_layers_cached += new /atom/movable/screen/parallax_layer/layer_1_1(null, src)
		if(prob(30))
			C.parallax_layers_cached += new /atom/movable/screen/parallax_layer/layer_1_2(null, src)
		if(prob(30))
			C.parallax_layers_cached += new /atom/movable/screen/parallax_layer/layer_1_3(null, src)
		if(prob(25))
			C.parallax_layers_cached += new /atom/movable/screen/parallax_layer/layer_1_4(null, src)
		if(prob(30))
			C.parallax_layers_cached += new /atom/movable/screen/parallax_layer/layer_1_5(null, src)
		if(prob(30))
			C.parallax_layers_cached += new /atom/movable/screen/parallax_layer/layer_1_6(null, src)
		if(prob(30))
			C.parallax_layers_cached += new /atom/movable/screen/parallax_layer/layer_1_7(null, src)
		if(prob(30))
			C.parallax_layers_cached += new /atom/movable/screen/parallax_layer/layer_1_8(null, src)
		if(prob(30))
			C.parallax_layers_cached += new /atom/movable/screen/parallax_layer/layer_1_9(null, src)
		if(prob(30))
			C.parallax_layers_cached += new /atom/movable/screen/parallax_layer/layer_1_10(null, src)
		if(prob(30))
			C.parallax_layers_cached += new /atom/movable/screen/parallax_layer/layer_1_11(null, src)
		if(prob(30))
			C.parallax_layers_cached += new /atom/movable/screen/parallax_layer/layer_1_12(null, src)
		if(prob(30))
			C.parallax_layers_cached += new /atom/movable/screen/parallax_layer/layer_1_13(null, src)
		if(prob(30))
			C.parallax_layers_cached += new /atom/movable/screen/parallax_layer/layer_1_14(null, src)
		if(prob(30))
			C.parallax_layers_cached += new /atom/movable/screen/parallax_layer/layer_1_15(null, src)
		if(prob(30))
			C.parallax_layers_cached += new /atom/movable/screen/parallax_layer/layer_1_16(null, src)
		// Layer 2
		if(prob(20))
			C.parallax_layers_cached += new /atom/movable/screen/parallax_layer/layer_2(null, src)
		if(prob(10))
			C.parallax_layers_cached += new /atom/movable/screen/parallax_layer/layer_2_1(null, src)
		if(prob(5))
			C.parallax_layers_cached += new /atom/movable/screen/parallax_layer/layer_2_2(null, src)
		if(prob(30))
			C.parallax_layers_cached += new /atom/movable/screen/parallax_layer/layer_2_3(null, src)
		if(prob(30))
			C.parallax_layers_cached += new /atom/movable/screen/parallax_layer/layer_2_4(null, src)
		//
		C.parallax_layers_cached += new /atom/movable/screen/parallax_layer/planet(null, src)
		//
		if(SSparallax.random_layer)
			C.parallax_layers_cached += new SSparallax.random_layer.type(null, src, FALSE, SSparallax.random_layer)
		// Layer 3
		if(prob(30))
			C.parallax_layers_cached += new /atom/movable/screen/parallax_layer/layer_3(null, src)
		if(prob(30))
			C.parallax_layers_cached += new /atom/movable/screen/parallax_layer/layer_3_1(null, src)
		if(prob(30))
			C.parallax_layers_cached += new /atom/movable/screen/parallax_layer/layer_3_2(null, src)

	C.parallax_layers = C.parallax_layers_cached.Copy()

	if (length(C.parallax_layers) > C.parallax_layers_max)
		C.parallax_layers.len = C.parallax_layers_max

	C.parallax_rock.vis_contents = C.parallax_layers
	for(var/atom/movable/screen/plane_master/plane_master as anything in screenmob.hud_used.get_true_plane_masters(PLANE_SPACE))
		if(screenmob != mymob)
			C.screen -= locate(/atom/movable/screen/plane_master/parallax_white) in C.screen
			C.screen += plane_master
		plane_master.color = list(
			0, 0, 0, 0,
			0, 0, 0, 0,
			0, 0, 0, 0,
			1, 1, 1, 1,
			0, 0, 0, 0
			)
