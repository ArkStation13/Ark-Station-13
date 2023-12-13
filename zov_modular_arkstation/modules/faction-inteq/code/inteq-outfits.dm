/datum/outfit/request_911
	name = "PMC InteQ Response: Base"
	back = /obj/item/storage/backpack/security/inteq
	backpack_contents = list(/obj/item/solfed_reporter/swat_caller = 1)

	id = /obj/item/card/id/advanced/centcom/ert/inteq

/datum/outfit/request_911/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE, client/preference_source)
	..()

	if(visualsOnly)
		return

	var/obj/item/radio/R = H.ears
	R.set_frequency(FREQ_SYNDICATE)
	R.freqlock = TRUE


/// PMC merc
/datum/outfit/request_911/police
	name = "PMC InteQ: Mercenary"
	back = /obj/item/storage/backpack/security/inteq
	uniform = /obj/item/clothing/under/syndicate/inteq
	suit = /obj/item/clothing/suit/armor/inteq
	shoes = /obj/item/clothing/shoes/jackboots
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses/inteq
	mask = /obj/item/clothing/mask/balaclava/breath/inteq
	ears = /obj/item/radio/headset/inteq/bowman
	head = /obj/item/clothing/head/helmet/sec/inteq
	suit_store = /obj/item/gun/ballistic/automatic/pistol
	gloves = /obj/item/clothing/gloves/color/black
	r_pocket = /obj/item/lighter
	l_pocket = /obj/item/ammo_box/magazine/m9mm
	id = /obj/item/card/id/advanced/centcom/ert/inteq
	belt = /obj/item/storage/belt/military/inteq
	backpack_contents = list(/obj/item/storage/box/survival = 1,
		/obj/item/storage/box/handcuffs = 1,
		/obj/item/melee/baton/security/loaded = 1,
		/obj/item/solfed_reporter/swat_caller = 1,
		/obj/item/ammo_box/magazine/m9mm = 1,
		/obj/item/beamout_tool = 1)

// PMC engineer
/datum/outfit/request_911/atmos
	name = "PMC InteQ: Engineer"
	back = /obj/item/storage/backpack/security/inteq
	uniform = /obj/item/clothing/under/syndicate/inteq_eng
	shoes = /obj/item/clothing/shoes/jackboots
	ears = /obj/item/radio/headset/inteq
	head = /obj/item/clothing/head/soft/inteq
	mask = /obj/item/clothing/mask/gas/atmos/glass
	belt = /obj/item/storage/belt/utility/full/powertools/ircd
	suit_store = /obj/item/tank/internals/oxygen/yellow
	id = /obj/item/card/id/advanced/centcom/ert/inteq
	backpack_contents = list(/obj/item/storage/box/rcd_ammo = 1,
		/obj/item/storage/box/smart_metal_foam = 1,
		/obj/item/multitool = 1,
		/obj/item/extinguisher/advanced = 1,
		/obj/item/rwd/loaded = 1,
		/obj/item/beamout_tool = 1,
		/obj/item/solfed_reporter/swat_caller = 1,
		/obj/item/storage/box/syndie_kit/space/inteq = 1,
		)

// PMC medic
/datum/outfit/request_911/emt
	name = "PMC InteQ: EMT"
	back = /obj/item/storage/backpack/security/inteq
	uniform = /obj/item/clothing/under/syndicate/inteq_med
	shoes = /obj/item/clothing/shoes/jackboots
	ears = /obj/item/radio/headset/inteq
	head = /obj/item/clothing/head/soft/inteq_med
	id = /obj/item/card/id/advanced/centcom/ert/inteq
	suit = /obj/item/clothing/suit/armor/inteq
	gloves = /obj/item/clothing/gloves/latex/nitrile
	belt = /obj/item/storage/belt/medical/paramedic
	suit_store = /obj/item/gun/energy/disabler
	backpack_contents = list(/obj/item/storage/box/survival = 1,
		/obj/item/emergency_bed = 1,
		/obj/item/storage/medkit/surgery = 1,
		/obj/item/solfed_reporter/swat_caller = 1,
		/obj/item/beamout_tool = 1)

// PMC Heavy merc
/datum/outfit/request_911/condom_destroyer
	name = "PMC InteQ: Heavy Mercenary"
	back = /obj/item/storage/backpack/duffelbag/syndie/inteq
	uniform = /obj/item/clothing/under/syndicate/inteq
	shoes = /obj/item/clothing/shoes/combat
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses/inteq
	ears = /obj/item/radio/headset/inteq/bowman
	head = /obj/item/clothing/head/helmet/swat/inteq
	mask = /obj/item/clothing/mask/balaclava/breath/inteq
	//belt = /obj/item/gun/ballistic/automatic/pistol
	belt = /obj/item/storage/belt/military/inteq
	suit = /obj/item/clothing/suit/armor/bulletproof
	gloves = /obj/item/clothing/gloves/color/black
	r_pocket = /obj/item/lighter
	l_pocket = /obj/item/restraints/handcuffs
	id = /obj/item/card/id/advanced/centcom/ert/inteq
	l_hand = /obj/item/gun/ballistic/shotgun/riot
	backpack_contents = list(/obj/item/storage/box/survival = 1,
		/obj/item/storage/box/lethalshot = 2,
		/obj/item/solfed_reporter/treason_reporter = 1,
		/obj/item/beamout_tool = 1)

/datum/outfit/request_911/condom_destroyer/pre_equip(mob/living/carbon/human/H)
	..()
	if(prob(15))
		r_pocket = /obj/item/choice_beacon/inteq_mech

// PMC Vanguard
/datum/outfit/request_911/treason_destroyer
	name = "PMC InteQ: Vanguard"

	uniform = /obj/item/clothing/under/syndicate/inteq_honorable_vanguard
	//head = /obj/item/clothing/head/HoS/inteq_honorable_vanguard
	mask = /obj/item/clothing/mask/balaclava/breath/inteq
	//gloves = /obj/item/clothing/gloves/combat
	//suit = /obj/item/clothing/suit/armor/inteq/honorable_vanguard
	//shoes = /obj/item/clothing/shoes/combat

	back = /obj/item/mod/control/pre_equipped/inteqe
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses/inteq
	ears = /obj/item/radio/headset/inteq/bowman/command
	l_pocket = /obj/item/restraints/handcuffs
	id = /obj/item/card/id/advanced/centcom/ert/inteq
	r_hand = /obj/item/gun/ballistic/automatic/ar
	backpack_contents = list(/obj/item/storage/box/handcuffs = 1,
		/obj/item/melee/baton/security/loaded = 1,
		/obj/item/ammo_box/magazine/m223 = 4
	)

/datum/outfit/request_911/treason_destroyer/pre_equip(mob/living/carbon/human/H)
	..()
	if(prob(25))
		r_pocket = /obj/item/choice_beacon/inteq_mech

// Pizza Delivery
/datum/outfit/centcom/ert/pizza/false_call
	backpack_contents = list(
		/obj/item/storage/box/survival,
		/obj/item/knife,
		/obj/item/storage/box/ingredients/italian,
		/obj/item/solfed_reporter/pizza_managers,
	)
	r_hand = /obj/item/pizzabox/meat
	l_hand = /obj/item/pizzabox/vegetable
