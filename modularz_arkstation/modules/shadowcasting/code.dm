/atom/movable/screen/plane_master/shadowcasting
	name = "shadowcasting plane master"
	plane = SHADOWCASTING_PLANE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	render_target = "all3"

/atom/movable/screen/plane_master/shadowcasting/New()
	. = ..()
	add_filter("thegreatdarkness", 1, drop_shadow_filter(x = 0, y = 0, size = 7, offset = 7, color = "#000000"))

// Переменные
/turf
	var/shadowcast_inview
	var/shadowcast_considered
	var/shadowcasting_initialized = FALSE
	var/list/shadowcasting_overlays = list()

// Создаём
/turf/New()
	. = ..()
	if(!shadowcasting_controller.initialized)
		return
	for(var/turf/fellow_turf in oview(7))
		fellow_turf.update_shadowcasting_overlays()
	update_shadowcasting_overlays()

/turf/proc/update_shadowcasting_overlays()
	create_shadowcast_overlays(src)
	shadowcasting_initialized = TRUE

// Датумы
/datum/triangle
	var/x1
	var/x2
	var/x3
	var/y1
	var/y2
	var/y3

/datum/triangle/New(x1,y1,x2,y2,x3,y3)
	src.x1 = x1
	src.x2 = x2
	src.x3 = x3
	src.y1 = y1
	src.y2 = y2
	src.y3 = y3

/proc/create_shadowcast_overlays(turf/locturf)
	locturf.shadowcasting_overlays = list()

	var/vrange = 11
	var/moveid = rand(0,65535)
	var/list/atom/movable/new_triangles = list()

	for(var/turf/T in oview(vrange))
		T.shadowcast_inview = moveid

	var/list/vturfsordered = list()
	for(var/I as anything in 1 to vrange+1)
		for(var/J as anything in 1 to I)
			vturfsordered += locate(locturf.x + I - J, locturf.y - J, locturf.z)
			vturfsordered += locate(locturf.x - I + J, locturf.y + J, locturf.z)
			vturfsordered += locate(locturf.x + J, locturf.y + I - J, locturf.z)
			vturfsordered += locate(locturf.x - J, locturf.y - I + J, locturf.z)

	for(var/turf/T in vturfsordered)
		if((T.shadowcast_inview != moveid) || !T.opacity || (T.shadowcast_considered == moveid))
			continue
		var/odx = (T.x - locturf.x)
		var/ody = (T.y - locturf.y)
		var/dx = odx*32
		var/dy = ody*32
		var/signx = (dx>=0)?1:-1
		var/signy = (dy>=0)?1:-1
		var/zx = dx == 0
		var/zy = dy == 0
		var/L = abs(odx)+abs(ody)
		var/udir = (dy>=0?1:2)
		var/rdir = (dx>=0?4:8)
		var/width = 0
		var/height = 0
		if(zx || zy)
			width = 1
			height = 1
			if(zx)
				var/turf/CT = get_step(T, 4)
				while(CT && CT.opacity && abs(CT.x-locturf.x)<(vrange+2))
					CT.shadowcast_considered = moveid
					width++
					CT = get_step(CT, 4)
				CT = get_step(T, 8)
				while(CT && CT.opacity && abs(CT.x-locturf.x)<(vrange+2))
					CT.shadowcast_considered = moveid
					width++
					dx -= 32
					CT = get_step(CT, 8)
				var/cdir = dy>0?2:1
				CT = get_step(T,cdir)
				if(CT && CT.opacity)
					continue
				cdir = dy>0?1:2
				CT = T
				while(CT && abs(CT.y - locturf.y))
					CT.shadowcast_considered = moveid
					CT = get_step(CT,udir)
			if(zy)
				var/turf/CT = get_step(T, 1)
				while(CT && CT.opacity && abs(CT.y-locturf.y)<(vrange+2))
					CT.shadowcast_considered = moveid
					height++
					CT = get_step(CT, 1)
				CT = get_step(T, 2)
				while(CT && CT.opacity && abs(CT.y-locturf.y)<(vrange+2))
					CT.shadowcast_considered = moveid
					height++
					dy -= 32
					CT = get_step(CT, 2)
				var/cdir = dx>0?8:4
				CT = get_step(T,cdir)
				if(CT && CT.opacity)
					continue
				cdir = dx>0?4:8
				CT = T
				while(CT && abs(CT.x - locturf.x))
					CT.shadowcast_considered = moveid
					CT = get_step(CT,rdir)
		else
			var/turf/CT = T
			while(CT && CT.opacity && abs(CT.x-locturf.x)<(vrange+2))
				CT.shadowcast_considered = moveid
				width++
				CT = get_step(CT, rdir)

			CT = T
			while(CT && CT.opacity && abs(CT.y-locturf.y)<(vrange+2))
				CT.shadowcast_considered = moveid
				height++
				CT = get_step(CT, udir)

		var/top = dy-(signy*16)+(signy*32*height)
		var/bottom = dy-(signy*16)
		var/left = dx-(signx*16)
		var/right = dx-(signx*16)+(signx*32*width)

		var/fac = 32/L
		new_triangles += make_triangle_image(right,top,left,top,left*fac,top*fac)
		new_triangles += make_triangle_image(right,top,right,bottom,right*fac,bottom*fac)
		new_triangles += make_triangle_image(left*fac,top*fac,right,top,right*fac,bottom*fac)

	locturf.shadowcasting_overlays = new_triangles
	return new_triangles

/client/proc/create_opacity_image()
	reflector = new
	reflector.loc = mob
	reflector.plane = SHADOWCASTING_REFLECTOR_PLANE
	src.images.Add(reflector)

	mover = new
	mover.animate_movement = NO_STEPS
	mover.vis_flags = VIS_HIDE

	update_opacity_image()

/client/proc/update_opacity_image()
	var/turf/T = get_turf(mob)
	reflector.vis_contents.Cut()
	if(!T)
		return
	else if(!T.shadowcasting_initialized)
		T.update_shadowcasting_overlays()
	reflector.vis_contents = T.shadowcasting_overlays
	src.mover.loc = T
	src.reflector.loc = mover

/mob/Login()
	. = ..()
	spawn(1)
		client.create_opacity_image()
		client.reflector.vis_contents.Cut()
		client.update_opacity_image()
		client.reflector.loc = src.loc

/mob/forceMove()
	..()
	if(client)
		client.update_opacity_image()

/mob/Move()
	. = ..()
	if(client)
		client.update_opacity_image()

/atom/movable/triangle
	name = ""
	icon = 'modularz_arkstation/modules/shadowcasting/triangle.dmi'
	icon_state = "triangle"
	plane = SHADOWCASTING_PLANE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	var/matrix/M = matrix()

/atom/movable/triangle/New(x1, y1, x2, y2, x3, y3)
	M = matrix((x3*0.03125)-(x2*0.03125), -(x2*0.03125)+(x1*0.03125), (x3*0.5)+(x1*0.5), -(y2*0.03125)+(y3*0.03125), (y1*0.03125)-(y2*0.03125), (y1*0.5)+(y3*0.5))
	src.transform = M
	tag = "triangle-movable-[x1]-[y1]-[x2]-[y2]-[x3]-[y3]"

/proc/make_triangle_image(x1,y1,x2,y2,x3,y3)
	var/atom/movable/triangle/triangle_image = locate("triangle-movable-[x1]-[y1]-[x2]-[y2]-[x3]-[y3]")
	if(!triangle_image)
		triangle_image = new(x1,y1,x2,y2,x3,y3)
	return triangle_image

/client
	var/image/reflector = null
	var/atom/movable/mover = null
