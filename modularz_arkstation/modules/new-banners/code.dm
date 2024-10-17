/obj/item/banner
	icon = 'modularz_arkstation/modules/new-banners/banner_dolbajob.dmi'

/obj/item/banner/inteq
	name = "InteQ banner"
	desc = "The banner of PMC InteQ, money rules."
	icon_state = "banner_inteq"
	inhand_icon_state = ""
	warcry = "Money or Life!!"

/obj/item/banner/inteq/Initialize(mapload)
	. = ..()
	job_loyalties = list(JOB_INTEQ_VANGUARD, JOB_INTEQ_MERCENARY)

/obj/item/banner/inteq/mundane
	inspiration_available = FALSE

/datum/crafting_recipe/inteq_banner
	name = "InteQ Banner"
	result = /obj/item/banner/inteq/mundane
	time = 40
	reqs = list(/obj/item/stack/rods = 2,
				/obj/item/clothing/under/syndicate/inteq = 1)
	category = CAT_MISC

/obj/item/banner/syndicate
	name = "syndicate banner"
	desc = "The banner of syndicate. Let's crush the Megacorporations!"
	icon_state = "banner_syndicate"
	inhand_icon_state = ""
	warcry = "FOR THE SYNDICATE!"

/obj/item/banner/syndicate/Initialize(mapload)
	. = ..()
	job_loyalties = list()

/obj/item/banner/syndicate/mundane
	inspiration_available = FALSE

/datum/crafting_recipe/syndicate_banner
	name = "Syndicate Banner"
	result = /obj/item/banner/syndicate/mundane
	time = 40
	reqs = list(/obj/item/stack/rods = 2,
				/obj/item/clothing/under/syndicate = 1)
	category = CAT_MISC

/obj/item/station_charter/banner
	icon = 'modularz_arkstation/modules/new-banners/banner_dolbajob.dmi'
