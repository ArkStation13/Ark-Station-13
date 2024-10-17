/obj/item/gun/energy/recharge/kinetic_accelerator/bloody
	name = "bloody proto-kinetic accelerator"
	desc = "A self recharging, ranged mining tool that does increased damage in low pressure. An unknown modification of the blood-drunk miner allows it to accommodate more upgrades."
	icon_state = "kineticgun_h"
	base_icon_state = "kineticgun"
	inhand_icon_state = "kineticgun_h"
	max_mod_capacity = 150

/mob/living/simple_animal/hostile/megafauna/blood_drunk_miner
	crusher_loot = list(/obj/item/melee/cleaving_saw, /obj/item/gun/energy/recharge/kinetic_accelerator/bloody, /obj/item/crusher_trophy/miner_eye)
	loot = list(/obj/item/melee/cleaving_saw, /obj/item/gun/energy/recharge/kinetic_accelerator/bloody)
