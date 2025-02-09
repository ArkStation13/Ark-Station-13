/obj/item/clothing/under/rank/blueshield/formal/pmc_leader_jumpsuit
	name = "PMC command fatigues"
	desc = "A white set of fatigues, designed for private security operators. The symbol of the Nanotrasen corporation is emblazed on the suit. This particular suit looks like it belongs to a high-ranking officer."
	icon = 'modularz_arkstation/_master_files/icons/obj/clothing/under.dmi'
	worn_icon = 'modularz_arkstation/_master_files/icons/mob/clothing/under.dmi'
	worn_icon_digi = 'modularz_arkstation/_master_files/icons/mob/clothing/under.dmi'
	icon_state = "officer_jumpsuit"

/obj/item/clothing/under/aesculapius
	name = "aesculapius uniform"
	desc = "Shirt with trousers with suspenders."
	icon = 'modularz_arkstation/_master_files/icons/obj/clothing/under.dmi'
	worn_icon = 'modularz_arkstation/_master_files/icons/mob/clothing/under.dmi'
	worn_icon_digi = 'modularz_arkstation/_master_files/icons/mob/clothing/under.dmi'
	icon_state = "esculap"

/obj/item/clothing/under/butler
	name = "butler uniform"
	desc = "Bright butler formal wear."
	icon = 'modularz_arkstation/_master_files/icons/obj/clothing/under.dmi'
	worn_icon = 'modularz_arkstation/_master_files/icons/mob/clothing/under.dmi'
	worn_icon_digi = 'modularz_arkstation/_master_files/icons/mob/clothing/under.dmi'
	icon_state = "butler_s"

/obj/item/clothing/under/common
	name = "ridiculous clothes"
	desc = "Looks very old."
	icon = 'modularz_arkstation/_master_files/icons/obj/clothing/under.dmi'
	worn_icon = 'modularz_arkstation/_master_files/icons/mob/clothing/under.dmi'
	worn_icon_digi = 'modularz_arkstation/_master_files/icons/mob/clothing/under.dmi'
	icon_state = "common"

/obj/item/clothing/under/baron
	name = "rich clothes"
	desc = "Decorated with precious stones and chains."
	icon = 'modularz_arkstation/_master_files/icons/obj/clothing/under.dmi'
	worn_icon = 'modularz_arkstation/_master_files/icons/mob/clothing/under.dmi'
	worn_icon_digi = 'modularz_arkstation/_master_files/icons/mob/clothing/under.dmi'
	icon_state = "baron"

/obj/item/clothing/under/chaplain/krashly_ver
	name = "chaplain clothes"
	desc = "Black uniform with an embroidered cross on it."
	icon = 'modularz_arkstation/_master_files/icons/obj/clothing/under.dmi'
	worn_icon = 'modularz_arkstation/_master_files/icons/mob/clothing/under.dmi'
	worn_icon_digi = 'modularz_arkstation/_master_files/icons/mob/clothing/under.dmi'
	icon_state = "chaplain"

//InteQ

/obj/item/clothing/under/syndicate/inteq_honorable_vanguard
	name = "black combat turtleneck"
	desc = "It sits comfortably, does not hinder movement, and most importantly, it is very stylish."
	icon = 'modularz_arkstation/_master_files/icons/obj/clothing/under.dmi'
	worn_icon = 'modularz_arkstation/_master_files/icons/mob/clothing/under.dmi'
	worn_icon_digi = 'modularz_arkstation/_master_files/icons/mob/clothing/under_digidrated.dmi'
	icon_state = "inteq_honorable"

/obj/item/clothing/under/syndicate/inteq
	name = "brown combat turtleneck"
	desc = "It sits comfortably, does not hinder movement, and most importantly, it is very stylish."
	icon = 'modularz_arkstation/_master_files/icons/obj/clothing/under.dmi'
	worn_icon = 'modularz_arkstation/_master_files/icons/mob/clothing/under.dmi'
	worn_icon_digi = 'modularz_arkstation/_master_files/icons/mob/clothing/under_digidrated.dmi'
	icon_state = "inteq"

/obj/item/clothing/under/syndicate/inteq_skirt
	name = "brown combat skirtleneck"
	desc = "It sits comfortably, does not hinder movement, and most importantly, it is very stylish."
	icon = 'modularz_arkstation/_master_files/icons/obj/clothing/under.dmi'
	worn_icon = 'modularz_arkstation/_master_files/icons/mob/clothing/under.dmi'
	worn_icon_digi = 'modularz_arkstation/_master_files/icons/mob/clothing/under.dmi'
	icon_state = "inteq_skirt"

/obj/item/clothing/under/syndicate/inteq_eng
	name = "brown engineering turtleneck"
	desc = "It sits comfortably, does not hinder movement, and most importantly, it is very stylish."
	icon = 'modularz_arkstation/_master_files/icons/obj/clothing/under.dmi'
	worn_icon = 'modularz_arkstation/_master_files/icons/mob/clothing/under.dmi'
	worn_icon_digi = 'modularz_arkstation/_master_files/icons/mob/clothing/under_digidrated.dmi'
	icon_state = "inteqeng"

/obj/item/clothing/under/syndicate/inteq_eng_skirt
	name = "brown engineering skirtleneck"
	desc = "It sits comfortably, does not hinder movement, and most importantly, it is very stylish."
	icon = 'modularz_arkstation/_master_files/icons/obj/clothing/under.dmi'
	worn_icon = 'modularz_arkstation/_master_files/icons/mob/clothing/under.dmi'
	worn_icon_digi = 'modularz_arkstation/_master_files/icons/mob/clothing/under.dmi'
	icon_state = "inteqeng_skirt"

/obj/item/clothing/under/syndicate/inteq_maid
	name = "brown combat maidsuit"
	desc = "It sits comfortably, does not hinder movement, and most importantly, it is very stylish. Battle maids!"
	icon = 'modularz_arkstation/_master_files/icons/obj/clothing/under.dmi'
	worn_icon = 'modularz_arkstation/_master_files/icons/mob/clothing/under.dmi'
	worn_icon_digi = 'modularz_arkstation/_master_files/icons/mob/clothing/under.dmi'
	icon_state = "inteqmaid"
	body_parts_covered = CHEST|GROIN
	can_adjust = FALSE


/obj/item/clothing/under/syndicate/inteq_maid/Initialize(mapload)
	. = ..()
	var/obj/item/clothing/accessory/maidapron/inteq/A = new (src)
	attach_accessory(A)

/obj/item/clothing/accessory/maidapron/inteq
	name = "InteQ maid apron"
	desc = "The best part of a maid costume."
	icon = 'modularz_arkstation/_master_files/icons/obj/clothing/under.dmi'
	worn_icon = 'modularz_arkstation/_master_files/icons/mob/clothing/under.dmi'
	icon_state = "maidapron"

/obj/item/clothing/under/syndicate/inteq_med
	name = "white combat turtleneck"
	desc = "It sits comfortably, does not hinder movement, and most importantly, it is very stylish. Designed for field medics."
	icon = 'modularz_arkstation/_master_files/icons/obj/clothing/under.dmi'
	worn_icon = 'modularz_arkstation/_master_files/icons/mob/clothing/under.dmi'
	worn_icon_digi = 'modularz_arkstation/_master_files/icons/mob/clothing/under_digidrated.dmi'
	icon_state = "inteqmed"

/obj/item/clothing/under/syndicate/inteq_med_skirt
	name = "white combat skirtleneck"
	desc = "It sits comfortably, does not hinder movement, and most importantly, it is very stylish. Designed for field medics."
	icon = 'modularz_arkstation/_master_files/icons/obj/clothing/under.dmi'
	worn_icon = 'modularz_arkstation/_master_files/icons/mob/clothing/under.dmi'
	worn_icon_digi = 'modularz_arkstation/_master_files/icons/mob/clothing/under.dmi'
	icon_state = "inteqmed_skirt"
