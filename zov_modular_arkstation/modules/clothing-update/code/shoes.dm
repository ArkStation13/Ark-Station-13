/obj/item/clothing/shoes/jackboots/tall
	name = "tall jackboots"
	desc = "A pair of tall jackboots usually worn by the combatants."
	icon = 'zov_modular_arkstation/modules/clothing-update/icons/obj/clothing/shoes.dmi'
	worn_icon = 'zov_modular_arkstation/modules/clothing-update/icons/mob/clothing/shoes.dmi'
	worn_icon_digi = 'zov_modular_arkstation/modules/clothing-update/icons/mob/clothing/shoes_digi.dmi'
	icon_state = "jackboots-tall"

/obj/item/clothing/shoes/jackboots/toeless
	name = "toeless jackboots"
	desc = "A pair of cut jackboots."
	icon = 'zov_modular_arkstation/modules/clothing-update/icons/obj/clothing/shoes.dmi'
	worn_icon = 'zov_modular_arkstation/modules/clothing-update/icons/mob/clothing/shoes.dmi'
	worn_icon_digi = 'zov_modular_arkstation/modules/clothing-update/icons/mob/clothing/shoes_digi.dmi'
	icon_state = "jackboots-toeless"

/obj/item/clothing/shoes/workboots/toeless
	name = "toeless work boots"
	desc = "A pair of cut work boot."
	icon = 'zov_modular_arkstation/modules/clothing-update/icons/obj/clothing/shoes.dmi'
	worn_icon = 'zov_modular_arkstation/modules/clothing-update/icons/mob/clothing/shoes.dmi'
	worn_icon_digi = 'zov_modular_arkstation/modules/clothing-update/icons/mob/clothing/shoes_digi.dmi'
	icon_state = "workboots-toeless"

/obj/item/clothing/shoes/high_heels/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/squeak, list('modular_nova/modules/modular_items/lewd_items/sounds/highheel1.ogg' = 1, 'modular_nova/modules/modular_items/lewd_items/sounds/highheel2.ogg' = 1), 70)

/obj/item/clothing/shoes/laceup/gwen_shoes
	name = "\improper Doll's shoes"
	desc = "some dolly shoes"
	icon_state = "gwen_shoes"
	inhand_icon_state = null
	icon = 'zov_modular_arkstation/modules/clothing-update/icons/Gwen_clothes/obj/laceup.dmi'
	worn_icon = 'zov_modular_arkstation/modules/clothing-update/icons/Gwen_clothes/mob/clothes_on.dmi'
