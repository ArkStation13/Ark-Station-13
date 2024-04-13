/turf/open/indestructible/void
	icon = 'zov_modular_arkstation/modules/goon-icons-port/goon-void.dmi'
	icon_state = "void"
	name = "V̸̥͎̜̗̎̀̅̂̆̉̔O̷͖͚̩͚͒̎͌́̾I̷̭͙̗̝̫͈̞͙͙̖͇̊́͋̽͗̀̿͛̑̽̏̃D̸̮̣̬̝̙̠̜̟̘̯͚͇̩͖͙͌͗̈́̆̆̀̚"
	desc = "W҉̨̥̬̗̇̈́̀͞H҉̜̳̠̿͊͜͡A̵͈̯͎͒̕͜T̸̡͚̙͊̀͞ T҉̗͚̄̾͛̕͜H̸̪̤̤̐͜͞E҈̡͖̰̱͋̏͠ F̵̗҇̾͜U҉͇҇̋͌̑͢Ḉ̸̖͕̳͞K̷̨̛̜̤̙̀ I҉̢̠͗͠S҉̧̣̂͡ I҈̞̭͙̇͜͡T̸̨̤͑͡!̵̧̛͉̅̂ I҉̢̣͛͡ W҈̡͇̳̠҇͊A̷̘̬̤̓͜͠Ǹ̸̛̙͉̽̋͢ͅT̷̢͇͙͗̔̐͞ Ţ̸̛̦͙̠͐̾O҈̢̘̦͛̕ͅ S҈̰́̃͋͢͠C̷̢̠͑̕R̷̛͔̒̚͢Ȅ̶̡̞̬͡Å̵̡͔̠͔͠M̶̢̭͔̑͠!̴̡͍̖̀́̔͠"

/turf/closed/indestructible/void
	icon = 'zov_modular_arkstation/modules/goon-icons-port/goon-void.dmi'
	icon_state = "void-wall"
	name = "V̸̥͎̜̗̎̀̅̂̆̉̔O̷͖͚̩͚͒̎͌́̾I̷̭͙̗̝̫͈̞͙͙̖͇̊́͋̽͗̀̿͛̑̽̏̃D̸̮̣̬̝̙̠̜̟̘̯͚͇̩͖͙͌͗̈́̆̆̀̚"
	desc = "W҉̨̥̬̗̇̈́̀͞H҉̜̳̠̿͊͜͡A̵͈̯͎͒̕͜T̸̡͚̙͊̀͞ T҉̗͚̄̾͛̕͜H̸̪̤̤̐͜͞E҈̡͖̰̱͋̏͠ F̵̗҇̾͜U҉͇҇̋͌̑͢Ḉ̸̖͕̳͞K̷̨̛̜̤̙̀ I҉̢̠͗͠S҉̧̣̂͡ I҈̞̭͙̇͜͡T̸̨̤͑͡!̵̧̛͉̅̂ I҉̢̣͛͡ W҈̡͇̳̠҇͊A̷̘̬̤̓͜͠Ǹ̸̛̙͉̽̋͢ͅT̷̢͇͙͗̔̐͞ Ţ̸̛̦͙̠͐̾O҈̢̘̦͛̕ͅ S҈̰́̃͋͢͠C̷̢̠͑̕R̷̛͔̒̚͢Ȅ̶̡̞̬͡Å̵̡͔̠͔͠M̶̢̭͔̑͠!̴̡͍̖̀́̔͠"

/obj/effect/step_trigger/void/proc/activate_void(atom/movable/triggerer)
	var/obj/effect/particle_effect/sparks/void_fissure/void_hueta = new /obj/effect/particle_effect/sparks/void_fissure(src.loc)
	animate(void_hueta, pixel_z = rand(60, 300), pixel_x = rand(-30, 30), time = 8, easing = LINEAR_EASING)

/obj/effect/particle_effect/sparks/void_fissure
	name = "void"
	icon = 'zov_modular_arkstation/modules/goon-icons-port/goon-void.dmi'
	icon_state = "fissure"
	light_color = LIGHT_COLOR_LAVENDER
	layer = ABOVE_ALL_MOB_LAYER

/obj/effect/particle_effect/sparks/void_fissure/LateInitialize()
	flick(icon_state, src)
	playsound(src, 'zov_modular_arkstation/modules/void/sound.ogg', 30, TRUE, SHORT_RANGE_SOUND_EXTRARANGE, use_reverb = TRUE)
	QDEL_IN(src, 30)

/obj/effect/step_trigger/void
	mobs_only = TRUE

/obj/effect/step_trigger/void/Initialize(mapload)
	. = ..()
	var/static/list/loc_connections = list(
		COMSIG_ATOM_ENTERED = PROC_REF(on_entered),
		COMSIG_ATOM_EXITED = PROC_REF(on_exited),
	)
	AddElement(/datum/element/connect_loc, loc_connections)

/obj/effect/step_trigger/void/proc/on_exited(datum/source, H as mob|obj)
	if(ismob(H))
		var/mob/AM = H
		if(prob(40))
			activate_void(AM)

/area/misc/void
	requires_power = FALSE
	has_gravity = STANDARD_GRAVITY
	// static_lighting = FALSE
	// base_lighting_alpha = 255
	name = "void"
	icon_state = "test_room"
	ambient_buzz = 'zov_modular_arkstation/modules/void/void.ogg'

/obj/effect/light_emitter/void
	light_color = LIGHT_COLOR_LAVENDER
	set_cap = 1
