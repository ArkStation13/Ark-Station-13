/init_sprite_accessories()
	//THE FLUFFY FRONTIER EDIT ADDITION BEGIN - Blooper
	for(var/sound_blooper_path in subtypesof(/datum/blooper))
		var/datum/blooper/B = new sound_blooper_path()
		GLOB.blooper_list[B.id] = sound_blooper_path
		if(B.allow_random)
			GLOB.blooper_random_list[B.id] = sound_blooper_path
	//THE FLUFFY FRONTIER EDIT END
