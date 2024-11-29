/obj/item/gun/ballistic/automatic/mp5
	name = "\improper SPG-Q-5"
	desc = "A compact submachine gun of the pilots and tank crew of the Old Empire. After its collapse, the weapon's blueprints were taken by mercenaries from InteQ."
	icon = 'modularz_arkstation/modules/guns/icons/guns/gunsgalore_guns40x32.dmi'
	icon_state = "mp5"
	lefthand_file = 'modularz_arkstation/modules/guns/icons/guns/gunsgalore_lefthand.dmi'
	righthand_file = 'modularz_arkstation/modules/guns/icons/guns/gunsgalore_righthand.dmi'
	inhand_icon_state = "mp5"
	worn_icon = 'modularz_arkstation/modules/guns/icons/guns/gunsgalore_back.dmi'
	worn_icon_state = "mp40_modern"
	slot_flags = ITEM_SLOT_BELT | ITEM_SLOT_BACK
	accepted_magazine_type = /obj/item/ammo_box/magazine/mp5
	weapon_weight = WEAPON_HEAVY
	can_suppress = FALSE
	fire_delay = 1
	burst_size = 1
	fire_sound = 'modularz_arkstation/modules/guns/sound/guns/fire/mp5_fire.ogg'
	fire_sound_volume = 100
	rack_sound = 'modularz_arkstation/modules/guns/sound/guns/interact/mp5_cock.ogg'
	load_sound = 'modularz_arkstation/modules/guns/sound/guns/interact/mp5_magin.ogg'
	load_empty_sound = 'modularz_arkstation/modules/guns/sound/guns/interact/mp5_magin.ogg'
	eject_sound = 'modularz_arkstation/modules/guns/sound/guns/interact/mp5_magout.ogg'

/obj/item/gun/ballistic/automatic/mp5/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, fire_delay)

/obj/item/gun/ballistic/automatic/mp5/give_manufacturer_examine()
	AddElement(/datum/element/manufacturer_examine, CARGO_COMPANY_INTEQ_WEAPONS)

/obj/item/ammo_box/magazine/mp5
	name = "\improper SPG-Q-5 magazine"
	icon = 'modularz_arkstation/modules/guns/icons/guns/gunsgalore_items.dmi'
	icon_state = "mp5"
	ammo_type = /obj/item/ammo_casing/c38
	caliber = "c34acp"
	max_ammo = 50
	multiple_sprites = AMMO_BOX_FULL_EMPTY

/// InteQ Bizon
/obj/item/gun/ballistic/automatic/bison
	name = "\improper SPG-Q-19 Bizon"
	desc = "A compact submachine gun of the pilots and tank crew of the Old Empire. After its collapse, the weapon's blueprints were taken by mercenaries from InteQ."
	icon = 'modularz_arkstation/modules/guns/icons/guns/gunsgalore_guns.dmi'
	lefthand_file = 'modularz_arkstation/modules/guns/icons/guns/gunsgalore_lefthand.dmi'
	righthand_file = 'modularz_arkstation/modules/guns/icons/guns/gunsgalore_righthand.dmi'
	worn_icon = 'modularz_arkstation/modules/guns/icons/guns/gunsgalore_back.dmi'
	fire_sound = 'modularz_arkstation/modules/guns/sound/guns/fire/mp5_fire.ogg'
	fire_sound_volume = 100
	rack_sound = 'modularz_arkstation/modules/guns/sound/guns/interact/mp5_cock.ogg'
	load_sound = 'modularz_arkstation/modules/guns/sound/guns/interact/mp5_magin.ogg'
	load_empty_sound = 'modularz_arkstation/modules/guns/sound/guns/interact/mp5_magin.ogg'
	eject_sound = 'modularz_arkstation/modules/guns/sound/guns/interact/mp5_magout.ogg'
	burst_size = 1
	icon_state = "bizon"
	inhand_icon_state = "bizon"
	worn_icon_state = "nri_smg"
	fire_delay = 1.3
	accepted_magazine_type = /obj/item/ammo_box/magazine/bison

/obj/item/ammo_box/magazine/bison
	name = "\improper SPG-X-19 Bizon magazine"
	icon = 'modularz_arkstation/modules/guns/icons/guns/gunsgalore_items.dmi'
	icon_state = "p90"
	ammo_type = /obj/item/ammo_casing/c38
	caliber = "c34acp"
	max_ammo = 64
	multiple_sprites = AMMO_BOX_FULL_EMPTY

/// NRI Bizon
/obj/item/gun/ballistic/automatic/bison/nri
	name = "\improper SPG-NRI-19 Bizon"
	desc = "A compact submachine gun of the pilots and tank crew of the Old Empire. After its collapse, the weapon's blueprints were taken by Military Forces of NRI."
	icon = 'modularz_arkstation/modules/guns/icons/guns/gunsgalore_guns.dmi'
	icon_state = "bison"
	inhand_icon_state = "bison"
	worn_icon_state = "nri_smg"

/obj/item/gun/ballistic/automatic/bison/nri/give_manufacturer_examine()
	AddElement(/datum/element/manufacturer_examine, CARGO_COMPANY_NRI_SURPLUS)
