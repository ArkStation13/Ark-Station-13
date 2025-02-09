/obj/item/gun/ballistic/automatic/stg // Dont Use in GunCargo
	name = "\improper StG-99"
	desc = "A reproduction of the Sturmgewehr 44 German infantry rifle chambered in 7.92mm, manufactured by the Oldarms division of the Armadyne Corporation."
	icon = 'modularz_arkstation/modules/guns/icons/guns/gunsgalore_guns40x32.dmi'
	icon_state = "stg"
	lefthand_file = 'modularz_arkstation/modules/guns/icons/guns/gunsgalore_lefthand.dmi'
	righthand_file = 'modularz_arkstation/modules/guns/icons/guns/gunsgalore_righthand.dmi'
	inhand_icon_state = "stg"
	worn_icon = 'modularz_arkstation/modules/guns/icons/guns/gunsgalore_back.dmi'
	worn_icon_state = "stg"
	slot_flags = ITEM_SLOT_BELT | ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	accepted_magazine_type = /obj/item/ammo_box/magazine/stg
	can_suppress = FALSE
	fire_delay = 1.5
	burst_size = 1
	actions_types = list()
	fire_sound = 'modularz_arkstation/modules/guns/sound/guns/fire/stg_fire.ogg'
	fire_sound_volume = 70
	rack_sound = 'modularz_arkstation/modules/guns/sound/guns/interact/ltrifle_cock.ogg'
	load_sound = 'modularz_arkstation/modules/guns/sound/guns/interact/ltrifle_magin.ogg'
	load_empty_sound = 'modularz_arkstation/modules/guns/sound/guns/interact/ltrifle_magin.ogg'
	eject_sound = 'modularz_arkstation/modules/guns/sound/guns/interact/ltrifle_magout.ogg'

/obj/item/gun/ballistic/automatic/stg/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, fire_delay)

/obj/item/gun/ballistic/automatic/stg/give_manufacturer_examine()
	AddElement(/datum/element/manufacturer_examine, CARGO_COMPANY_INTEQ_WEAPONS)

/obj/item/ammo_box/magazine/stg
	name = "stg magazine (7.92x33mm)"
	icon = 'modularz_arkstation/modules/guns/icons/guns/gunsgalore_items.dmi'
	icon_state = "stg"
	ammo_type = /obj/item/ammo_casing/realistic/a792x33
	caliber = "a792x33"
	max_ammo = 30
	multiple_sprites = AMMO_BOX_FULL_EMPTY

