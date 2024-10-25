/obj/item/gun/ballistic/automatic/pps // Dont Use in GunCargo
	name = "\improper SPG-Q-43"
	desc = "A very cheap, barely reliable reproduction of a personal defense weapon based on the original Soviet model. Not nearly as infamous as the Mosin."
	icon = 'modularz_arkstation/modules/guns/icons/guns/gunsgalore_guns40x32.dmi'
	icon_state = "pps"
	lefthand_file = 'modularz_arkstation/modules/guns/icons/guns/gunsgalore_lefthand.dmi'
	righthand_file = 'modularz_arkstation/modules/guns/icons/guns/gunsgalore_righthand.dmi'
	inhand_icon_state = "pps"
	slot_flags = ITEM_SLOT_BELT | ITEM_SLOT_BACK
	accepted_magazine_type = /obj/item/ammo_box/magazine/pps
	can_suppress = FALSE
	fire_delay = 3
	worn_icon = 'modularz_arkstation/modules/guns/icons/guns/gunsgalore_back.dmi'
	worn_icon_state = "pps"
	fire_sound = 'modularz_arkstation/modules/guns/sound/guns/fire/pps_fire.ogg'
	fire_sound_volume = 100

	rack_sound = 'modularz_arkstation/modules/guns/sound/guns/interact/smg_cock.ogg'
	load_sound = 'modularz_arkstation/modules/guns/sound/guns/interact/smg_magin.ogg'
	load_empty_sound = 'modularz_arkstation/modules/guns/sound/guns/interact/smg_magin.ogg'
	eject_sound = 'modularz_arkstation/modules/guns/sound/guns/interact/smg_magout.ogg'

/obj/item/gun/ballistic/automatic/pps/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, fire_delay)

/obj/item/gun/ballistic/automatic/pps/give_manufacturer_examine()
	AddElement(/datum/element/manufacturer_examine, CARGO_COMPANY_INTEQ_WEAPONS)

/obj/item/ammo_box/magazine/pps
	name = "pps magazine (7.62x25mm)"
	icon = 'modularz_arkstation/modules/guns/icons/guns/gunsgalore_items.dmi'
	icon_state = "pps"
	ammo_type = /obj/item/ammo_casing/realistic/a762x25
	caliber = "a762x25"
	max_ammo = 35
	multiple_sprites = AMMO_BOX_FULL_EMPTY
