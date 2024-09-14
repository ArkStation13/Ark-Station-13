/mob/living/basic/carp/brown
	name = "brown space carp"
	desc = "A ferocious, fang-bearing creature that resembles a fish."
	icon = 'modularz_arkstation/_master_files/icons/mob/simple_mob/brown_carp.dmi'
	faction = list("carp", "InteQ")
	var/list/loot = list()

/mob/living/basic/carp/brown/proc/drop_loot()
	if(loot.len)
		for(var/i in loot)
			new i(loc)

/mob/living/basic/carp/brown/beret
	name = "brown space carp with beret"
	icon = 'modularz_arkstation/_master_files/icons/mob/simple_mob/brown_carp_beret.dmi'
	loot = list(/obj/item/clothing/suit/armor/inteq/vanguard , /obj/item/clothing/head/HoS/inteq_vanguard)

/mob/living/basic/carp/brown/beret/death(gibbed)
	. = ..()

	drop_loot()
