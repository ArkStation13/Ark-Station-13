/obj/item/armor_plate/standart_security // Стальная плита (Стандарт, ни мясо, ни рыба)
	name = "steel armor plate"
	desc = "Standard steel armor plate, often used by regular security and armies of third countries. It won't help much against bullets, but it will protect against shrapnel and lasers, albeit mediocrely."
	icon_state = "armor_plate-standart-1"
	base_icon_state = "armor_plate"

	armor_type = /datum/armor/vest_armor_plate/steel

	icon_naming = "standart"
	plate_damage_multiplier = 0.5

/datum/armor/vest_armor_plate/steel
	acid = 50
	bio = 0
	bomb = 30
	bullet = 30
	consume = 0
	energy = 40
	laser = 30
	fire = 50
	melee = 40
	wound = 10
