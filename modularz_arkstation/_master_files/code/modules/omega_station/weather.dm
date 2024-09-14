/datum/weather/rain_storm
	name = "rain storm"
	desc = "Harsh rainstorms roam the topside of this forest planet, burying any area unfortunate enough to be in its path."
	probability = 90

	telegraph_message = "<span class='warning'>Drifting particles of rain begin to dust the surrounding area..</span>"
	telegraph_duration = 300
	telegraph_overlay = "rain"

	weather_message = "<span class='userdanger'><i>Harsh winds pick up as dense water begins to fall from the sky! Seek shelter!</i></span>"
	weather_overlay = "storm"
	weather_duration_lower = 600
	weather_duration_upper = 1500

	end_duration = 100
	end_message = "<span class='boldannounce'>The rainfall dies down, it should be safe to go outside again.</span>"

	area_type = /area
	protect_indoors = TRUE
	target_trait = ZTRAIT_RAINSTORM

	immunity_type = TRAIT_SNOWSTORM_IMMUNE

	barometer_predictable = TRUE

	///Lowest we can cool someone randomly per weather act. Positive values only
	var/cooling_lower = 5
	///Highest we can cool someone randomly per weather act. Positive values only
	var/cooling_upper = 15

/datum/weather/rain_storm/weather_act(mob/living/living)
	living.adjust_bodytemperature(-rand(cooling_lower, cooling_upper))

// since snowstorm is on a station z level, add extra checks to not annoy everyone
/datum/weather/rain_storm/can_get_alert(mob/player)
	if(!..())
		return FALSE

	if(!is_station_level(player.z))
		return TRUE  // bypass checks

	if(isobserver(player))
		return TRUE

	if(HAS_MIND_TRAIT(player, TRAIT_DETECT_STORM))
		return TRUE

	if(istype(get_area(player), /area/mine))
		return TRUE


	for(var/area/rain_area in impacted_areas)
		if(locate(rain_area) in view(player))
			return TRUE

	return FALSE

///A storm that doesn't stop storming, and is a bit stronger
/datum/weather/rain_storm/forever_storm
	telegraph_duration = 0
	perpetual = TRUE

	probability = 0

	cooling_lower = 5
	cooling_upper = 18

/datum/weather/rain_storm/generate_overlay_cache()
	// We're ending, so no overlays at all
	if(stage == END_STAGE)
		return list()

	var/weather_state = ""
	switch(stage)
		if(STARTUP_STAGE)
			weather_state = telegraph_overlay
		if(MAIN_STAGE)
			weather_state = weather_overlay
		if(WIND_DOWN_STAGE)
			weather_state = end_overlay

	// Use all possible offsets
	// Yes this is a bit annoying, but it's too slow to calculate and store these from turfs, and it shouldn't (I hope) look weird
	var/list/gen_overlay_cache = list()
	for(var/offset in 0 to SSmapping.max_plane_offset)
		// Note: what we do here is effectively apply two overlays to each area, for every unique multiz layer they inhabit
		// One is the base, which will be masked by lighting. the other is "glowing", and provides a nice contrast
		// This method of applying one overlay per z layer has some minor downsides, in that it could lead to improperly doubled effects if some have alpha
		// I prefer it to creating 2 extra plane masters however, so it's a cost I'm willing to pay
		// LU
		var/mutable_appearance/glow_overlay = mutable_appearance('modularz_arkstation/_master_files/code/modules/omega_station/icons/weather_effects.dmi', weather_state, overlay_layer, null, ABOVE_LIGHTING_PLANE, 100, offset_const = offset)
		glow_overlay.color = weather_color
		gen_overlay_cache += glow_overlay

		var/mutable_appearance/weather_overlay = mutable_appearance('modularz_arkstation/_master_files/code/modules/omega_station/icons/weather_effects.dmi', weather_state, overlay_layer, plane = overlay_plane, offset_const = offset)
		weather_overlay.color = weather_color
		gen_overlay_cache += weather_overlay

	return gen_overlay_cache
