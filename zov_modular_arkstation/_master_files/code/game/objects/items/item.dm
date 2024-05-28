/obj/item/storage/box/survival/security/PopulateContents()
	. = ..()
	new /obj/item/crowbar/red(src)

/obj/item/icona_madonna
	name = "Madonna icon"
	desc = "Икона великой Мадонны."
	icon =  'zov_modular_arkstation/_master_files/icons/obj/structures.dmi'
	icon_state = "madonna"

/obj/structure/desk_bell
	icon = 'zov_modular_arkstation/_master_files/icons/obj/structures.dmi'
	icon_state = "table-bell"

// VULP POSTERS //

/obj/structure/sign/poster/contraband/vulpes
	name = "Vulpes"
	desc = "Looks like an advertisement for lewd movie about vulpkanines."
	icon = 'zov_modular_arkstation/_master_files/icons/obj/poster.dmi'
	icon_state = "vulpes"

/obj/structure/sign/poster/contraband/vulpes/vulp_beer
	name = "Vulp Beer"
	desc = "This poster says: 'Vulpes, Boobs and Beer!'. Probably a new Space Beer advertising company."
	icon_state = "vulp-beer"

/obj/structure/sign/poster/contraband/vulpes/vulp_medical
	name = "Vulp Medical"
	desc = "White vulpkanin on the background of a green cross, one of the interplanetary symbol of health and aid."
	icon_state = "vulp-medical"

/obj/structure/sign/poster/contraband/vulpes/love
	name = "Love"
	desc = "Everyone's favorite bread in space."
	icon_state = "love"

/obj/structure/sign/poster/contraband/vulpes/woof
	name = "Woof"
	desc = "Emma, the trustworthy fox of brig."
	icon_state = "woof"

/obj/structure/sign/poster/contraband/vulpes/sleep_vulp
	name = "Sleep"
	desc = "An advertisement for healthy sleep with cute fox on it."
	icon_state = "sleep"

/obj/structure/sign/poster/contraband/vulpes/vulp_hacking
	name = "Vulp Hacking Guide"
	desc = "This poster shows a vulp hacking the airlock somewhere in technical tunnels."
	icon_state = "vulp-hacking"

/obj/structure/sign/poster/contraband/vulpes/vulp_syndie
	name = "Syndie Vulp"
	desc = "A poster portraying the infamous crime conglomerate in form of a vulpkanin. It has a Syndicate's insignia on it."
	icon_state = "vulp-syndie"

/obj/structure/sign/poster/contraband/vulpes/vulp_nanotrasen
	name = "NT Vulp"
	desc = "A poster depicting the famous mega-corporation in form of a vulpkanin. It has a Nanotrasen logo on it."
	icon_state = "vulp-nanotrasen"

/obj/structure/sign/poster/contraband/vulpes/vulp_tide
	name = "Vulptide"
	desc = "A rebellious poster symbolizing vulpkanins and assistants solidarity."
	icon_state = "vulp-tide"

/obj/structure/sign/poster/contraband/vulpes/vulp_panties
	name = "Panties"
	desc = "This lewd poster depicts a half-naked vulpkanin."
	icon_state = "vulp-panties"

/obj/structure/sign/poster/contraband/vulpes/vulp_stockings
	name = "Stockings"
	desc = "A poster advertising the Vulp's Secret new collection of underwear."
	icon_state = "vulp-stockings"

/obj/structure/sign/poster/contraband/vulpes/vulp_paws
	name = "Paws!"
	desc = "This lewd poster depicts a vulpkanin preparing to mate."
	icon_state = "vulp-paws"

/obj/structure/sign/poster/contraband/vulpes/hiding
	name = "Hiding"
	desc = "A poster showing the person on it hiding in a closet."
	icon_state = "hiding"

/obj/structure/sign/poster/contraband/vulpes/fox
	name = "Fox"
	desc = "This poster depicts seriously looking fox."
	icon_state = "fox"

/obj/structure/sign/poster/contraband/vulpes/sisyphus
	name = "Sisyphus"
	desc = "A poster showing a man endlessly rolling a huge boulder up a steep hill."
	icon_state = "sisyphus"

//InteQ

/obj/structure/sign/flag/inteq
	name = "flag of PMC InteQ"
	desc = "Коричнево-Оранжевый флаг с щитом по центру. Флаг пахнет кровью."
	icon = 'zov_modular_arkstation/_master_files/icons/obj/inteq_flag.dmi'
	icon_state = "full"
	item_flag = /obj/item/sign/flag/inteq

/obj/item/sign/flag/inteq
	name = "folded flag of the PMC InteQ"
	desc = "Сложенный флаг ЧВК 'InteQ'."
	icon = 'zov_modular_arkstation/_master_files/icons/obj/inteq_flag.dmi'
	icon_state = "mini"
	sign_path = /obj/structure/sign/flag/inteq

/obj/item/poster/random_inteq
	name = "random InteQ poster"
	poster_type = /obj/structure/sign/poster/contraband/inteq/random
	icon_state = "rolled_poster"

/obj/structure/sign/poster/contraband/inteq/random
	name = "random contraband poster"
	icon_state = "random_contraband"
	never_random = TRUE
	random_basetype = /obj/structure/sign/poster/contraband/inteq

/obj/structure/sign/poster/contraband/inteq/inteq_recruitment
	name = "InteQ Recruitment"
	desc = "Увидь Галактику! Заработай денег! Вступай сегодня!"
	icon = 'zov_modular_arkstation/_master_files/icons/obj/poster.dmi'
	icon_state = "poster_inteq"

/obj/structure/sign/poster/contraband/inteq/inteq_sign
	name = "InteQ poster"
	desc = "Частная Военная Компания, занимающаяся обороной частных предприятий и выполнением заказов."
	icon = 'zov_modular_arkstation/_master_files/icons/obj/poster.dmi'
	icon_state = "poster_inteq_baza"

/obj/structure/sign/poster/contraband/inteq/inteq_better_dead
	name = "Better Dead!"
	desc = "Сокрушим врагов!"
	icon = 'zov_modular_arkstation/_master_files/icons/obj/poster.dmi'
	icon_state = "poster_inteq_better_dead"

/obj/structure/sign/poster/contraband/inteq/inteq_no_peace
	name = "No peace!"
	desc = "Не имей сто друзей, а имей сто рублей, Вступай в ЧВК 'InteQ'!"
	icon = 'zov_modular_arkstation/_master_files/icons/obj/poster.dmi'
	icon_state = "poster_inteq_no_love"

/obj/structure/sign/poster/contraband/inteq/inteq_no_sex
	name = "No SEX"
	desc = "Хватит дрочить, вступай в ЧВК 'InteQ'!"
	icon = 'zov_modular_arkstation/_master_files/icons/obj/poster.dmi'
	icon_state = "poster_inteq_no_sex"

/obj/structure/sign/poster/contraband/inteq/inteq_vulp
	name = "InteQ Recruitment"
	desc = "Коричневый постер. На нём написано: 'Даже если ты дрочишь на вульп, вступай в ЧВК 'InteQ'. Сокрушим врагов вместе!'."
	icon = 'zov_modular_arkstation/_master_files/icons/obj/poster.dmi'
	icon_state = "poster_inteq_vulp"

/obj/item/storage/box/inteq_box
	name = "brown box"
	desc = "В неё определенно нет ничего опасного."
	icon = 'zov_modular_arkstation/_master_files/icons/obj/box.dmi'
	icon_state = "inteqbox"

/obj/item/storage/box/inteq_box/inteq_clothes
	name = "clothes kit"

/obj/item/storage/box/inteq_box/inteq_clothes/PopulateContents()
	new /obj/item/clothing/under/syndicate/inteq(src)
	new /obj/item/clothing/suit/armor/inteq(src)
	new /obj/item/clothing/gloves/combat(src)
	new /obj/item/clothing/shoes/combat(src)
	new /obj/item/storage/belt/military/inteq(src)
	new /obj/item/clothing/glasses/hud/security/sunglasses/inteq(src)
	new /obj/item/clothing/head/helmet/swat/inteq(src)
	new /obj/item/clothing/mask/balaclava/breath/inteq(src)
	new /obj/item/storage/backpack/security/inteq(src)

/obj/item/soap/inteq
	desc = "Жёлтое мыло с крайне мощными химическими агентами, которые отмывают кровь быстрее."
	icon_state = "soapinteq"
	cleanspeed = 10
	// icon = 'zov_modular_arkstation/_master_files/icons/obj/inteq_soap.dmi' // ПЕРЕЕХАЛИ НИЖЕ
	inhand_icon_state = "soapinteq"
	lefthand_file = 'zov_modular_arkstation/_master_files/icons/mob/inhands/obj/lefthand.dmi'
	righthand_file = 'zov_modular_arkstation/_master_files/icons/mob/inhands/obj/righthand.dmi'

/obj/item/food/chips/intecookies
	name = "InteCookies"
	desc = "Песочное печенье, каждое из которых в форме маленьких щитов."
	icon = 'zov_modular_arkstation/_master_files/icons/obj/inteq_snacks.dmi'
	icon_state = "inteqcookies"
	trash_type = /obj/item/trash/intecookies
	tastes = list("shortbread cookies" = 1)
	foodtypes = JUNKFOOD

/obj/item/trash/intecookies
	name = "intecookies bag"
	icon = 'zov_modular_arkstation/_master_files/icons/obj/inteq_snacks.dmi'
	icon_state = "inteqcookies_trash"
	grind_results = list(/datum/reagent/aluminium = 1)

// /obj/item/storage/fancy/cigarettes/cigpack_inteq
// 	name = "cigarette packet"
// 	desc = "Пачка сигарет от известной ЧВК."
// 	icon = 'zov_modular_arkstation/_master_files/icons/obj/inteq_cigarettes.dmi'
// 	icon_state = "inteq"
// 	spawn_type = /obj/item/clothing/mask/cigarette/inteq

// /obj/item/clothing/mask/cigarette/inteq
// 	desc = "Сигарета от известной ЧВК."
// 	list_reagents = list(/datum/reagent/drug/nicotine = 15, /datum/reagent/medicine/omnizine = 15)

/obj/item/toy/mecha/hermes
	name = "toy Hermes"
	icon = 'zov_modular_arkstation/_master_files/icons/toys.dmi'
	icon_state = "toy_hermes"
	max_combat_health = 6 //300 integrity

/obj/item/toy/mecha/ares
	name = "toy Ares"
	icon = 'zov_modular_arkstation/_master_files/icons/toys.dmi'
	icon_state = "toy_ares"
	max_combat_health = 7 //350 integrity

// STGS CODE

//////////////////////////////////////////////

/mob/living/basic/pig/assistant
	name = "Danya"
	real_name = "Danya"
	icon = 'zov_modular_arkstation/_master_files/icons/animals.dmi'
	maxHealth = 250
	health = 250
	gender = MALE

/mob/living/basic/pet/fox/fennec/eldritch
	icon = 'zov_modular_arkstation/_master_files/icons/animals.dmi'
	maxHealth = 100
	health = 100
	held_state = "fennec_eldritch"
	held_lh = 'zov_modular_arkstation/_master_files/icons/animals_held_lh.dmi'
	held_rh = 'zov_modular_arkstation/_master_files/icons/animals_held_rh.dmi'

/mob/living/basic/pet/cat/moro
	name = "Moro"
	desc = "He likes grechkya."
	icon_state = "moro"
	icon_living = "moro"
	icon_dead = "moro_dead"
	held_state = "moro"
	unique_pet = TRUE
	mob_size = MOB_SIZE_LARGE
	maxHealth = 250
	health = 250
	gender = MALE
	icon = 'zov_modular_arkstation/_master_files/icons/animals.dmi'
	held_lh = 'zov_modular_arkstation/_master_files/icons/animals_held_lh.dmi'
	held_rh = 'zov_modular_arkstation/_master_files/icons/animals_held_rh.dmi'

/mob/living/basic/pet/fox/fennec
	name = "Red"
	desc = "It's a fennec!"
	icon_state = "fennec"
	icon_living = "fennec"
	icon_dead = "fennec_dead"
	held_state = "fennec"
	see_in_dark = 10
	maxHealth = 50
	health = 50
	gender = MALE
	icon = 'zov_modular_arkstation/_master_files/icons/animals.dmi'
	held_lh = 'zov_modular_arkstation/_master_files/icons/animals_held_lh.dmi'
	held_rh = 'zov_modular_arkstation/_master_files/icons/animals_held_rh.dmi'

/mob/living/basic/pet/cat/alta
	name = "Alta"
	desc = "A cute white cat."
	icon_state = "alta"
	icon_living = "alta"
	icon_dead = "alta_dead"
	held_state = "alta"
	unique_pet = TRUE
	gender = FEMALE
	icon = 'zov_modular_arkstation/_master_files/icons/animals.dmi'
	held_lh = 'zov_modular_arkstation/_master_files/icons/animals_held_lh.dmi'
	held_rh = 'zov_modular_arkstation/_master_files/icons/animals_held_rh.dmi'

/mob/living/basic/pet/dog/corgi/Lisa/ada
	name = "Ada"
	real_name = "Ada"
	gender = FEMALE
	desc = "She will bite your throat till you die."
	gold_core_spawnable = NO_SPAWN
	unique_pet = TRUE
	icon_state = "ada"
	icon_living = "ada"
	icon_dead = "ada_dead"
	held_state = "ada"
	icon = 'zov_modular_arkstation/_master_files/icons/animals.dmi'
	held_lh = 'zov_modular_arkstation/_master_files/icons/animals_held_lh.dmi'
	held_rh = 'zov_modular_arkstation/_master_files/icons/animals_held_rh.dmi'

/mob/living/basic/pet/fox/emma
	name = "Emma"
	icon_state = "emma"
	icon_living = "emma"
	icon_dead = "emma_dead"
	held_state = "emma"
	see_in_dark = 10
	gender = FEMALE
	icon = 'zov_modular_arkstation/_master_files/icons/animals.dmi'
	held_lh = 'zov_modular_arkstation/_master_files/icons/animals_held_lh.dmi'
	held_rh = 'zov_modular_arkstation/_master_files/icons/animals_held_rh.dmi'

///////////////

/obj/item/toy/plush/fox/emma
	name = "Emma plushie"
	desc = "An adorable stuffed toy resembling a vulp."
	icon_state = "emma"
	icon = 'zov_modular_arkstation/_master_files/icons/vulps/vulps.dmi'
	lefthand_file = 'zov_modular_arkstation/_master_files/icons/vulps/vulps_l.dmi'
	righthand_file = 'zov_modular_arkstation/_master_files/icons/vulps/vulps_r.dmi'

/obj/item/toy/plush/fox/emma/shiro
	name = "Shiro plushie"
	icon_state = "shiro"

/obj/item/toy/plush/fox/emma/raita
	name = "Raita plushie"
	icon_state = "raita"

// /obj/item/toy/plush/fox/emma/aiko // Fuck SmileyCom
// 	name = "Aiko Plushie"
// 	icon_state = "aiko"
// 	item_state = "aiko"

/obj/item/toy/plush/fox/emma/red
	name = "Red plushie"
	icon_state = "red"

/obj/item/toy/plush/nukeplushie/who
	name = "security officer plushie"
	desc = "A stuffed toy that resembles a Nanotrasen operative. He smells like burnt cotton."
	icon_state = "who"
	icon = 'zov_modular_arkstation/_master_files/icons/vulps/vulps.dmi'
	lefthand_file = 'zov_modular_arkstation/_master_files/icons/vulps/vulps_l.dmi'
	righthand_file = 'zov_modular_arkstation/_master_files/icons/vulps/vulps_r.dmi'
	squeak_override = list('zov_modular_arkstation/_master_files/sound/plush/plush_1.ogg' = 9, 'zov_modular_arkstation/_master_files/sound/plush/plush_2.ogg' = 1)

/obj/item/toy/plush/qm
	name = "supply chief plushie"
	desc = "A stuffed toy that resembles a Cargonia Chief. Looks like a fallen economy."
	icon_state = "qm"
	icon = 'zov_modular_arkstation/_master_files/icons/vulps/vulps.dmi'
	lefthand_file = 'zov_modular_arkstation/_master_files/icons/vulps/vulps_l.dmi'
	righthand_file = 'zov_modular_arkstation/_master_files/icons/vulps/vulps_r.dmi'

/obj/item/toy/plush/judas
	name = "yellow shark plushie"
	desc = "An adorable stuffed plushie that resembles a yellow security shark."
	icon_state = "judas"
	squeak_override = list('zov_modular_arkstation/_master_files/sound/plush/voice_alphys.ogg' = 9)
	icon = 'zov_modular_arkstation/_master_files/icons/vulps/vulps.dmi'
	lefthand_file = 'zov_modular_arkstation/_master_files/icons/vulps/vulps_l.dmi'
	righthand_file = 'zov_modular_arkstation/_master_files/icons/vulps/vulps_r.dmi'

/obj/item/toy/plush/nukeplushie/omega
	name = "Omega plushie"
	desc = "This plushie really has an empty noggin and zero thoughts about commiting something especially cruel."
	icon_state = "omega"
	icon = 'zov_modular_arkstation/_master_files/icons/vulps/vulps.dmi'
	squeak_override = list('zov_modular_arkstation/_master_files/sound/plush/ooh.ogg' = 9)

/obj/item/toy/plush/judas/vance
	name = "Vance plushie"
	desc = "A plush rodent, she smells like cheese and xenobiology!"
	icon_state = "vance"
	squeak_override = list('sound/items/toysqueak1.ogg' = 3, 'sound/items/toysqueak2.ogg' = 3, 'sound/items/toysqueak3.ogg' = 3)


///////////////////

/obj/item/toy/figure
	icon = 'zov_modular_arkstation/_master_files/icons/toys.dmi'
	icon_state = "syndie"

/obj/item/toy/figure/inteq
	name = "\improper InteQ Mercenary action figure"
	icon_state = "inteq"
	toysay = "For money!"

/obj/item/toy/figure/brigmedic
	name = "\improper Brig Medic action figure"
	icon_state = "brigmedic"
	toysay = "Rescue heroes!"

/obj/item/toy/figure/blueshield
	name = "\improper Blueshield action figure"
	icon_state = "blueshield"
	toysay = "At the cost of my life!"

/obj/item/toy/figure/pilot
	name = "\improper Brig Pilot action figure"
	icon_state = "pilot"
	toysay = "Star Wars!"

/obj/item/toy/figure/vanguard
	name = "\improper Vanguard action figure"
	icon_state = "vanguard"
	toysay = "I'm not a munchkin!"

/obj/item/toy/figure/mechanic
	name = "\improper Mechanic action figure"
	icon_state = "mechanic"
	toysay = "Fly me to the Moon!"

/obj/item/toy/figure/renault
	name = "\improper Renault action figure"
	icon_state = "renault"
	toysay = "Yank!"

/obj/item/toy/figure/runtime
	name = "\improper Runtime action figure"
	icon_state = "runtime"
	toysay = "Meow!"

/obj/item/toy/toy_xeno
	icon = 'zov_modular_arkstation/_master_files/icons/toys.dmi'
	icon_state = "toy_xeno"

/obj/item/toy/cattoy
	icon = 'zov_modular_arkstation/_master_files/icons/toys.dmi'
	icon_state = "toy_mouse"
