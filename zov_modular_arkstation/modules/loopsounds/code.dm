/obj/machinery/atmospherics/components/unary/thermomachine
	var/datum/looping_sound/thermomachine/soundloop

/datum/looping_sound/thermomachine
	start_sound = list('zov_modular_arkstation/modules/loopsounds/sounds/thermomachine/start.ogg' = 1)
	start_length = 0.9 SECONDS
	mid_sounds = list('zov_modular_arkstation/modules/loopsounds/sounds/thermomachine/loop.ogg' = 1)
	mid_length = 0.9 SECONDS
	end_sound = list('zov_modular_arkstation/modules/loopsounds/sounds/thermomachine/end.ogg' = 1)
	end_volume = 7
	volume = 6

/obj/machinery/atmospherics/components/unary/thermomachine/Initialize(mapload)
	. = ..()
	soundloop = new(src, start_immediately = FALSE)

/obj/machinery/atmospherics/components/unary/thermomachine/Destroy()
	. = ..()
	QDEL_NULL(soundloop)
