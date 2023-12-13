// Звуки оружия

/obj/item/gun/ballistic/shotgun
	fire_sound = 'zov_modular_arkstation/modules/sounds-renewal/sound/weapons/gunshotshotgunshot.ogg'
	load_sound = 'zov_modular_arkstation/modules/sounds-renewal/sound/weapons/shotguninsert.ogg'
	rack_sound = 'zov_modular_arkstation/modules/sounds-renewal/sound/weapons/shotgun_pump.ogg'

/obj/item/gun/ballistic/shotgun/riot/sol
	fire_sound = 'zov_modular_arkstation/modules/sounds-renewal/sound/weapons/gunshotshotgunshot.ogg'
	rack_sound = 'zov_modular_arkstation/modules/sounds-renewal/sound/weapons/shotgun_pump.ogg'

/obj/item/gun/ballistic/revolver
	fire_sound = 'zov_modular_arkstation/modules/sounds-renewal/sound/weapons/revolvershot.ogg'

/obj/item/gun/ballistic/automatic
	fire_sound = 'zov_modular_arkstation/modules/sounds-renewal/sound/weapons/gunshot_smg_alt.ogg'

/obj/item/gun/ballistic/automatic/sol_smg
	fire_sound = 'zov_modular_arkstation/modules/sounds-renewal/sound/weapons/gunshot_smg_alt.ogg'

/obj/item/gun/ballistic/automatic/l6_saw
	fire_sound = 'zov_modular_arkstation/modules/sounds-renewal/sound/weapons/lmgshot.ogg'

/obj/item/ammo_casing/energy
	fire_sound = 'zov_modular_arkstation/modules/sounds-renewal/sound/weapons/laser.ogg'

/obj/item/ammo_casing/laser
	fire_sound = 'zov_modular_arkstation/modules/sounds-renewal/sound/weapons/laser.ogg'

/obj/item/ammo_casing/energy/lasergun/carbine
	fire_sound = 'zov_modular_arkstation/modules/sounds-renewal/sound/weapons/laser.ogg'

/obj/item/ammo_casing/energy/laser/heavy
	fire_sound = 'zov_modular_arkstation/modules/sounds-renewal/sound/weapons/laser.ogg'

/obj/item/ammo_casing/energy/xray
	fire_sound = 'zov_modular_arkstation/modules/sounds-renewal/sound/weapons/laser.ogg'

/obj/item/ammo_casing/energy/laser/microfusion
	fire_sound = 'zov_modular_arkstation/modules/sounds-renewal/sound/weapons/laser.ogg'

/obj/item/chainsaw/attack_self(mob/user)
	. = ..()
	if(on)
		playsound(src, 'zov_modular_arkstation/modules/sounds-renewal/sound/weapons/chainsawstart.ogg', 65, 1)

	if(on)
		hitsound = 'zov_modular_arkstation/modules/sounds-renewal/sound/weapons/chainsawhit.ogg'
		chainsaw_loop.start()
	else
		hitsound = SFX_SWING_HIT
		chainsaw_loop.stop()


// Код для добавления/изменения аннонсов и их звучания

/datum/centcom_announcer/default
	welcome_sounds = list('sound/ai/default/welcome.ogg')
	alert_sounds = list('modular_skyrat/modules/alerts/sound/alerts/alert2.ogg')
	command_report_sounds = list('modular_skyrat/modules/alerts/sound/alerts/commandreport.ogg')
	event_sounds = list(
		ANNOUNCER_AIMALF = 'sound/ai/default/aimalf.ogg',
		ANNOUNCER_ALIENS = 'modular_skyrat/modules/alerts/sound/alerts/lifesigns.ogg',
		ANNOUNCER_ANIMES = 'modular_skyrat/modules/alerts/sound/alerts/animes.ogg',
		ANNOUNCER_INTERCEPT = 'modular_skyrat/modules/alerts/sound/alerts/alert2.ogg',
		ANNOUNCER_IONSTORM = 'modular_skyrat/modules/alerts/sound/alerts/ionstorm.ogg',
		ANNOUNCER_METEORS = 'modular_skyrat/modules/alerts/sound/alerts/meteors.ogg',
		ANNOUNCER_OUTBREAK5 = 'modular_skyrat/modules/alerts/sound/alerts/outbreak5.ogg',
		ANNOUNCER_OUTBREAK6 = 'modular_skyrat/modules/alerts/sound/alerts/alert3.ogg',
		ANNOUNCER_OUTBREAK7 = 'modular_skyrat/modules/alerts/sound/alerts/outbreak7.ogg',
		ANNOUNCER_POWEROFF = 'modular_skyrat/modules/alerts/sound/alerts/poweroff.ogg',
		ANNOUNCER_POWERON = 'modular_skyrat/modules/alerts/sound/alerts/poweron.ogg',
		ANNOUNCER_RADIATION = 'modular_skyrat/modules/alerts/sound/alerts/radiation.ogg',
		ANNOUNCER_RADIATIONPASSED = 'modular_skyrat/modules/alerts/sound/alerts/radpassed.ogg',
		ANNOUNCER_SHUTTLECALLED = 'modular_skyrat/modules/alerts/sound/alerts/crew_shuttle_called.ogg',
		ANNOUNCER_SHUTTLEDOCK = 'modular_skyrat/modules/alerts/sound/alerts/crew_shuttle_docked.ogg',
		ANNOUNCER_SHUTTLERECALLED = 'modular_skyrat/modules/alerts/sound/alerts/crew_shuttle_recalled.ogg',
		ANNOUNCER_SHUTTLELEFT = 'modular_skyrat/modules/alerts/sound/alerts/crew_shuttle_left.ogg',
		ANNOUNCER_ANOMALIES = 'modular_skyrat/modules/alerts/sound/alerts/alert2.ogg',
		ANNOUNCER_GRAVANOMALIES= 'modular_skyrat/modules/alerts/sound/alerts/gravanomalies.ogg',
		ANNOUNCER_SPANOMALIES = 'modular_skyrat/modules/alerts/sound/alerts/wormholes.ogg',
		ANNOUNCER_VORTEXANOMALIES = 'modular_skyrat/modules/alerts/sound/alerts/vortex.ogg',
		ANNOUNCER_MASSIVEBSPACEANOMALIES = 'modular_skyrat/modules/alerts/sound/alerts/bluespace_anomalies.ogg',
		ANNOUNCER_TRANSLOCATION = 'modular_skyrat/modules/alerts/sound/alerts/transolcation.ogg',
		ANNOUNCER_FLUXANOMALIES = 'modular_skyrat/modules/alerts/sound/alerts/flux.ogg',
		ANNOUNCER_PYROANOMALIES = 'modular_skyrat/modules/alerts/sound/alerts/pyr_anomalies.ogg',
		ANNOUNCER_CARP = 'modular_skyrat/modules/alerts/sound/alerts/carps.ogg',
		ANNOUNCER_BLUESPACEARTY = 'modular_skyrat/modules/alerts/sound/alerts/artillery.ogg',
		ANNOUNCER_CAPTAIN = 'modular_skyrat/modules/alerts/sound/alerts/announce.ogg',
		ANNOUNCER_GRAVGENOFF = 'modular_skyrat/modules/alerts/sound/alerts/gravityoff.ogg',
		ANNOUNCER_GRAVGENON = 'modular_skyrat/modules/alerts/sound/alerts/gravityon.ogg',
		ANNOUNCER_GREYTIDE = 'modular_skyrat/modules/alerts/sound/alerts/greytide.ogg',
		ANNOUNCER_COMMSBLACKOUT = 'modular_skyrat/modules/alerts/sound/alerts/commsblackout.ogg',
		ANNOUNCER_ELECTRICALSTORM = 'modular_skyrat/modules/alerts/sound/alerts/estorm.ogg',
		ANNOUNCER_BRANDINTELLIGENCE = 'modular_skyrat/modules/alerts/sound/alerts/rampant_brand_int.ogg',
		ANNOUNCER_SPOOKY = 'modular_skyrat/modules/alerts/sound/misc/admin_horror_music.ogg',
		ANNOUNCER_ERTYES = 'modular_skyrat/modules/alerts/sound/alerts/yesert.ogg',
		ANNOUNCER_MUTANTS = 'modular_skyrat/modules/alerts/sound/alerts/hazdet.ogg',
		ANNOUNCER_KLAXON = 'modular_skyrat/modules/black_mesa/sound/siren1_long.ogg',
		ANNOUNCER_ICARUS = 'modular_skyrat/modules/assault_operatives/sound/icarus_alarm.ogg',
		ANNOUNCER_NRI_RAIDERS = 'modular_skyrat/modules/encounters/sounds/morse.ogg',
		ANNOUNCER_DEPARTMENTAL = 'modular_skyrat/modules/alerts/sound/alerts/alert3.ogg',
		ANNOUNCER_SHUTTLE = 'modular_skyrat/modules/alerts/sound/alerts/alert3.ogg',
		)


//////// Шлюзы и прочее

/obj/machinery/door/airlock
	doorDeni = 'zov_modular_arkstation/modules/sounds-renewal/sound/machines/deniedbeep.ogg'


//////////////////// Зоны, эмбиенты

/area
	min_ambience_cooldown = 35 SECONDS
	max_ambience_cooldown = 65 SECONDS
	forced_ambience = TRUE
	ambient_buzz = 'zov_modular_arkstation/modules/sounds-renewal/sound/ambience/shipambience.ogg'
	ambient_buzz_vol = 10

/area/station/maintenance
	forced_ambience = TRUE
	ambient_buzz = 'sound/ambience/maintambience.ogg'
	ambient_buzz_vol = 20

/area/station/command/heads_quarters/rd
	forced_ambience = TRUE
	ambient_buzz = 'zov_modular_arkstation/modules/sounds-renewal/sound/ambience/sci.ogg'
	ambient_buzz_vol = 20


/area/station/science
	forced_ambience = TRUE
	ambient_buzz = 'zov_modular_arkstation/modules/sounds-renewal/sound/ambience/sci.ogg'
	ambient_buzz_vol = 20

/area/shuttle
	forced_ambience = TRUE
	ambient_buzz = 'modular_skyrat/modules/encounters/sounds/amb_ship_01.ogg'
	ambient_buzz_vol = 15
	ambientsounds = list('modular_skyrat/modules/encounters/sounds/alarm_radio.ogg',
						'modular_skyrat/modules/encounters/sounds/alarm_small_09.ogg',
						'modular_skyrat/modules/encounters/sounds/gear_loop.ogg',
						'modular_skyrat/modules/encounters/sounds/gear_start.ogg',
						'modular_skyrat/modules/encounters/sounds/gear_stop.ogg',
						'modular_skyrat/modules/encounters/sounds/intercom_loop.ogg')
	min_ambience_cooldown = 15 SECONDS
	max_ambience_cooldown = 25 SECONDS

/area/shuttle/pirate/nri
	name = "NRI Starship"
	ambient_buzz = 'modular_skyrat/modules/encounters/sounds/amb_ship_01.ogg'
	ambient_buzz_vol = 15
	min_ambience_cooldown = 15 SECONDS
	max_ambience_cooldown = 25 SECONDS
	ambientsounds = list('modular_skyrat/modules/encounters/sounds/alarm_radio.ogg',
						'modular_skyrat/modules/encounters/sounds/alarm_small_09.ogg',
						'modular_skyrat/modules/encounters/sounds/gear_loop.ogg',
						'modular_skyrat/modules/encounters/sounds/gear_start.ogg',
						'modular_skyrat/modules/encounters/sounds/gear_stop.ogg',
						'modular_skyrat/modules/encounters/sounds/intercom_loop.ogg',
						'zov_modular_arkstation/modules/sounds-renewal/sound/ambience/radio/1.ogg',
						'zov_modular_arkstation/modules/sounds-renewal/sound/ambience/radio/2.ogg',
						'zov_modular_arkstation/modules/sounds-renewal/sound/ambience/radio/3.ogg',
						'zov_modular_arkstation/modules/sounds-renewal/sound/ambience/radio/4.ogg',
						'zov_modular_arkstation/modules/sounds-renewal/sound/ambience/radio/5.ogg',
						'zov_modular_arkstation/modules/sounds-renewal/sound/ambience/radio/6.ogg',
						'zov_modular_arkstation/modules/sounds-renewal/sound/ambience/radio/7.ogg',
						'zov_modular_arkstation/modules/sounds-renewal/sound/ambience/radio/8.ogg',
						'zov_modular_arkstation/modules/sounds-renewal/sound/ambience/radio/9.ogg')

/area/awaymission/beach
	forced_ambience = TRUE
	ambient_buzz = 'zov_modular_arkstation/modules/sounds-renewal/sound/ambience/beach.ogg'
	ambient_buzz_vol = 25

/area/centcom/syndicate_mothership
	ambient_buzz = 'zov_modular_arkstation/modules/sounds-renewal/sound/ambience/stadium.ogg'
	ambient_buzz_vol = 15
	min_ambience_cooldown = 15 SECONDS
	max_ambience_cooldown = 25 SECONDS
	ambientsounds = list('modular_skyrat/modules/encounters/sounds/alarm_radio.ogg',
						'modular_skyrat/modules/encounters/sounds/alarm_small_09.ogg',
						'modular_skyrat/modules/encounters/sounds/gear_loop.ogg',
						'modular_skyrat/modules/encounters/sounds/gear_start.ogg',
						'modular_skyrat/modules/encounters/sounds/gear_stop.ogg',
						'modular_skyrat/modules/encounters/sounds/intercom_loop.ogg')

