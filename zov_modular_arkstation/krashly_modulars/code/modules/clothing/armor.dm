/obj/item/clothing/suit/armor/hos/pmc_leader_armor
	name = "M4 pattern PMC leader armor"
	desc = "A modification of the M4 body armor, it is designed for high-profile security operators and corporate mercenaries in mind. This particular suit looks like it belongs to a high-ranking officer."
	icon = 'zov_modular_arkstation/krashly_modulars/icons/obj/clothing/suits.dmi'
	worn_icon = 'zov_modular_arkstation/krashly_modulars/icons/mob/clothing/suits.dmi'
	worn_icon_digi = 'zov_modular_arkstation/krashly_modulars/icons/mob/clothing/suits.dmi'
	icon_state = "officer_armor"

/obj/item/clothing/head/helmet/toggleable/riot/cerberus
	name = "cerberus helmet"
	desc = "Шлем-маска напоминающая собачью голову с красными глазами. Она кажется вам знакомой и навевает страх. От неё пахнет тухлым мясом, от чего кружится голова. И как её вообще носят на голове..?"
	icon = 'zov_modular_arkstation/krashly_modulars/icons/cerberus/helm_obj.dmi'
	worn_icon = 'zov_modular_arkstation/krashly_modulars/icons/cerberus/helm_mob.dmi'
	icon_state = "cerberushelm"
	flags_inv = HIDEFACIALHAIR|HIDEFACE|HIDEEYES|HIDEEARS|HIDEHAIR
	actions_types = list(/datum/action/item_action/toggle)
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELM_MIN_TEMP_PROTECT
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_HELM_MAX_TEMP_PROTECT
	clothing_flags = STOPSPRESSUREDAMAGE
	strip_delay = 80

	actions_types = list(/datum/action/item_action/cerberbark)

/datum/action/item_action/cerberbark
	name = "BARK!"

/obj/item/clothing/head/helmet/toggleable/riot/cerberus/verb/cerberbark()
	set category = "Object"
	set name = "BARK!"
	set src in usr
	if(!isliving(usr))
		return
	if(!can_use(usr))
		return

	var/frase
	frase = input("Какую фразу вы хотите сказать через преобразователь в шлеме?","") as text

	if(frase)
		usr.audible_message("[usr] barks, <font color='red' size='4'><b>[frase]</b></font>")
		playsound(src.loc, 'zov_modular_arkstation/krashly_modulars/sound/bark.ogg', 100, 1)

/obj/item/clothing/head/helmet/toggleable/riot/cerberus/ui_action_click(mob/user, action)
	if(istype(action, /datum/action/item_action/cerberbark))
		cerberbark()

/obj/item/clothing/head/helmet/toggleable/riot/cerberus


/obj/item/clothing/suit/armor/riot/cerberus
	name = "Cerberus Coat"
	desc = "Бронированое пальто болотного цвета с кучей пуговиц. Ходят слухи, что новых уже давно не делают, а те что имеются - снимают с трупов для дальнейшего ношения. От него пованивает тухлым мясом."
	icon = 'zov_modular_arkstation/krashly_modulars/icons/cerberus/suit_obj.dmi'
	worn_icon = 'zov_modular_arkstation/krashly_modulars/icons/cerberus/suit_mob.dmi'
	icon_state = "cerberussuit_mob"
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	cold_protection = CHEST|GROIN|LEGS|ARMS
	heat_protection = CHEST|GROIN|LEGS|ARMS
	strip_delay = 80
	unique_reskin = list()

/obj/item/clothing/suit/armor/riot/cerberus/censor
	name = "censor's coat"
	desc = "A red overcoat with the coat of arms of Ravenheart in the middle. It has steel plates sewn into it."
	icon = 'zov_modular_arkstation/krashly_modulars/icons/obj/clothing/suits.dmi'
	worn_icon = 'zov_modular_arkstation/krashly_modulars/icons/mob/clothing/suits.dmi'
	worn_icon_digi = 'zov_modular_arkstation/krashly_modulars/icons/mob/clothing/suits.dmi'
	icon_state = "censor"

/obj/item/clothing/suit/armor/riot/cerberus/baron
	name = "gorgeous red outfit"
	desc = "Lush black outfit with red stripes. Looks definitely very rich."
	icon = 'zov_modular_arkstation/krashly_modulars/icons/obj/clothing/suits.dmi'
	worn_icon = 'zov_modular_arkstation/krashly_modulars/icons/mob/clothing/suits.dmi'
	worn_icon_digi = 'zov_modular_arkstation/krashly_modulars/icons/mob/clothing/suits.dmi'
	icon_state = "baron"
//////////////////////////////////////////////
/obj/item/clothing/suit/hooded/chaplain_hoodie/monk_robe
	name = "monk robe"
	desc = "Now with a hood."
	icon = 'zov_modular_arkstation/krashly_modulars/icons/obj/clothing/suits.dmi'
	worn_icon = 'zov_modular_arkstation/krashly_modulars/icons/mob/clothing/suits.dmi'
	worn_icon_digi = 'zov_modular_arkstation/krashly_modulars/icons/mob/clothing/suits.dmi'
	icon_state = "monk"
	hoodtype = /obj/item/clothing/head/hooded/chaplain_hood/monk_robe_hood
//
/obj/item/clothing/head/hooded/chaplain_hood/monk_robe_hood
	name = "monk robe hood"
	desc = "A torn hoodie that fits over your head."
	icon = 'zov_modular_arkstation/krashly_modulars/icons/obj/clothing/head.dmi'
	worn_icon = 'zov_modular_arkstation/krashly_modulars/icons/mob/clothing/head.dmi'
	icon_state = "monk_robe_hood"
	flags_inv = HIDEHAIR|HIDEEARS
////////////////////////////////////////////////
/obj/item/clothing/suit/hooded/plaguedoc_new
	name = "plague doctor robe"
	desc = "Everything will be fine..."
	icon = 'zov_modular_arkstation/krashly_modulars/icons/obj/clothing/suits.dmi'
	worn_icon = 'zov_modular_arkstation/krashly_modulars/icons/mob/clothing/suits.dmi'
	worn_icon_digi = 'zov_modular_arkstation/krashly_modulars/icons/mob/clothing/suits.dmi'
	icon_state = "plaguedoc"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT
	strip_delay = 70
	equip_delay_other = 70
	resistance_flags = ACID_PROOF
	hoodtype = /obj/item/clothing/head/hooded/plaguedoc_new
//
/obj/item/clothing/head/hooded/plaguedoc_new
	name = "plague doctor hood"
	desc = "A torn hoodie that fits over your head."
	icon = 'zov_modular_arkstation/krashly_modulars/icons/obj/clothing/head.dmi'
	worn_icon = 'zov_modular_arkstation/krashly_modulars/icons/mob/clothing/head.dmi'
	icon_state = "plaguedoc_hood"
	flags_inv = HIDEHAIR|HIDEEARS
///////////////////////////////////////////////
/obj/item/clothing/suit/armor/riot/cerberus/inkvd
	name = "inquisitor's overcoat"
	desc = "Large overcoat with red embroidery on the sleeves. It also has a cross stitch on it."
	icon = 'zov_modular_arkstation/krashly_modulars/icons/obj/clothing/suits.dmi'
	worn_icon = 'zov_modular_arkstation/krashly_modulars/icons/mob/clothing/suits.dmi'
	worn_icon_digi = 'zov_modular_arkstation/krashly_modulars/icons/mob/clothing/suits.dmi'
	icon_state = "inkvd"

//InteQ//

/obj/item/clothing/suit/armor/inteq
	name = "InteQ armor vest"
	desc = "Strict black armor vest. Well, at least you won't die immediately."
	icon = 'zov_modular_arkstation/krashly_modulars/icons/obj/clothing/suits.dmi'
	worn_icon = 'zov_modular_arkstation/krashly_modulars/icons/mob/clothing/suits.dmi'
	worn_icon_digi = 'zov_modular_arkstation/krashly_modulars/icons/mob/clothing/suits.dmi'
	icon_state = "armor"

/obj/item/clothing/suit/armor/inteq/honorable_vanguard
	name = "InteQ black armored coat"
	desc = "Lush overcoat with fur around the neck. Has armor plates in its composition."
	icon_state = "armor_inteq_honorable_battlecoat"

/obj/item/clothing/suit/armor/inteq/vanguard
	name = "InteQ armored coat"
	desc = "Lush overcoat with fur around the neck. Has armor plates in its composition."
	icon_state = "armor_vanguard"

/obj/item/clothing/suit/armor/inteq/labcoat
	name = "InteQ armored labcoat"
	desc = "Sterile (or almost) lab coat of the InteQ department for the modernization of existing technologies."
	icon_state = "labcoat_inteq"

///Winter Coat
/obj/item/clothing/suit/hooded/wintercoat/syndicate/inteq
	name = "InteQ winter coat"
	desc = "A sinister brown coat with black accents and a fancy mantle, it feels like it can take a hit."
	icon = 'zov_modular_arkstation/krashly_modulars/icons/obj/clothing/suits.dmi'
	worn_icon = 'zov_modular_arkstation/krashly_modulars/icons/mob/clothing/suits.dmi'
	worn_icon_digi = 'zov_modular_arkstation/krashly_modulars/icons/mob/clothing/suits.dmi'
	icon_state = "coatinteq"
	hoodtype = /obj/item/clothing/head/hooded/winterhood/syndicate/inteq
///Hood
/obj/item/clothing/head/hooded/winterhood/syndicate/inteq
	name = "InteQ winter hood"
	desc = "A sinister brown hood with armor padding."
	icon = 'zov_modular_arkstation/krashly_modulars/icons/obj/clothing/head.dmi'
	worn_icon = 'zov_modular_arkstation/krashly_modulars/icons/mob/clothing/head.dmi'
	icon_state = "winterhood_inteq"
///

//InteQ Hardsuits//

//Helmet_ELITE
// /obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/inteq
// 	name = "InteQ elite hardsuit helmet"
// 	desc = "InteQ elite stormtrooper hardsuit helmet."
// 	icon_state = "hardsuit0-inteqe"
// 	item_state = "hardsuit0-inteqe"
// 	icon = 'zov_modular_arkstation/krashly_modulars/icons/obj/clothing/head.dmi'
// 	worn_icon = 'zov_modular_arkstation/krashly_modulars/icons/mob/clothing/head.dmi'
// 	hardsuit_type = "inteqe"
// //Suit_ELITE
// /obj/item/clothing/suit/space/hardsuit/syndi/elite/inteq
// 	name = "InteQ elite hardsuit"
// 	desc = "InteQ elite stormtrooper hardsuit."
// 	icon_state = "hardsuit0-inteqe"
// 	item_state = "hardsuit0-inteqe"
// 	hardsuit_type = "inteqe"
// 	icon = 'zov_modular_arkstation/krashly_modulars/icons/obj/clothing/suits.dmi'
// 	worn_icon = 'zov_modular_arkstation/krashly_modulars/icons/mob/clothing/suits.dmi'
// 	worn_icon_digi = 'zov_modular_arkstation/krashly_modulars/icons/mob/suits_digidrated.dmi'
// 	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/inteq

// /obj/item/clothing/suit/space/hardsuit/syndi/elite/inteq/equipped(mob/user, slot)
// 	..()
// 	if(slot == ITEM_SLOT_OCLOTHING)
// 		if(!IS_INTEQ(user))
// 			to_chat(user, "<span class='danger'><B>СКАФАНДР МОДЕЛЬ ДВА</B>: Обнаружены неавторизованные сигнатуры. <B>Производится нейтрализация экипировки.</B></span>")
// 			playsound(get_turf(src), 'sound/machines/nuke/confirm_beep.ogg', 65, 1, 1)
// 			addtimer(CALLBACK(src, .proc/explode), 3 SECONDS)

// /obj/item/clothing/suit/space/hardsuit/syndi/elite/inteq/proc/explode()
// 	do_sparks(3, 1, src)
// 	explosion(src.loc,0,1,1,1)
// 	qdel(src)

// //////////

// //Helmet_STANDART
// /obj/item/clothing/head/helmet/space/hardsuit/syndi/inteq
// 	name = "InteQ hardsuit helmet"
// 	desc = "InteQ stormtrooper hardsuit helmet."
// 	icon_state = "hardsuit0-inteq"
// 	item_state = "hardsuit0-inteq"
// 	icon = 'zov_modular_arkstation/krashly_modulars/icons/obj/clothing/head.dmi'
// 	worn_icon = 'zov_modular_arkstation/krashly_modulars/icons/mob/clothing/head.dmi'
// 	hardsuit_type = "inteq"

// //Suit_STANDART
// /obj/item/clothing/suit/space/hardsuit/syndi/inteq
// 	name = "InteQ hardsuit"
// 	desc = "InteQ stormtrooper hardsuit."
// 	icon_state = "hardsuit0-inteq"
// 	item_state = "hardsuit0-inteq"
// 	hardsuit_type = "inteq"
// 	icon = 'zov_modular_arkstation/krashly_modulars/icons/obj/clothing/suits.dmi'
// 	worn_icon = 'zov_modular_arkstation/krashly_modulars/icons/mob/clothing/suits.dmi'
// 	worn_icon_digi = 'zov_modular_arkstation/krashly_modulars/icons/mob/clothing/suits.dmi'
// 	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/inteq
// //////////

// //Helmet_ALLIANCE
// /obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/alliance
// 	name = "OTA Hardsuit Helmet"
// 	desc = "OTA stormtrooper hardsuit helmet."
// 	icon_state = "hardsuit0-alliance"
// 	item_state = "hardsuit0-alliance"
// 	icon = 'zov_modular_arkstation/krashly_modulars/icons/obj/clothing/head.dmi'
// 	worn_icon = 'zov_modular_arkstation/krashly_modulars/icons/mob/clothing/head.dmi'
// 	hardsuit_type = "alliance"

// //Suit_ALLIANCE
// /obj/item/clothing/suit/space/hardsuit/syndi/elite/alliance
// 	name = "OTA Hardsuit"
// 	desc = "OTA Stormtrooper Hardsuit."
// 	icon_state = "hardsuit0-alliance"
// 	item_state = "hardsuit0-alliance"
// 	hardsuit_type = "alliance"
// 	icon = 'zov_modular_arkstation/krashly_modulars/icons/obj/clothing/suits.dmi'
// 	worn_icon = 'zov_modular_arkstation/krashly_modulars/icons/mob/clothing/suits.dmi'
// 	worn_icon_digi = 'zov_modular_arkstation/krashly_modulars/icons/mob/clothing/suits.dmi'

// 	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/alliance

// //////////

// //Helmet_SHIELDED
// /obj/item/clothing/head/helmet/space/hardsuit/shielded/syndi/inteq
// 	name = "InteQ shielded hardsuit helmet"
// 	desc = "InteQ shielded stormtrooper hardsuit helmet."
// 	icon_state = "hardsuit0-inteq"
// 	item_state = "hardsuit0-inteq"
// 	icon = 'zov_modular_arkstation/krashly_modulars/icons/obj/clothing/head.dmi'
// 	worn_icon = 'zov_modular_arkstation/krashly_modulars/icons/mob/clothing/head.dmi'
// 	hardsuit_type = "inteq"

// //Suit_SHIELDED
// /obj/item/clothing/suit/space/hardsuit/shielded/syndi/inteq
// 	name = "InteQ shielded hardsuit"
// 	desc = "InteQ shielded stormtrooper hardsuit."
// 	icon_state = "hardsuit0-inteq"
// 	item_state = "hardsuit0-inteq"
// 	hardsuit_type = "inteq"
// 	icon = 'zov_modular_arkstation/krashly_modulars/icons/obj/clothing/suits.dmi'
// 	worn_icon = 'zov_modular_arkstation/krashly_modulars/icons/mob/clothing/suits.dmi'
// 	worn_icon_digi = 'zov_modular_arkstation/krashly_modulars/icons/mob/clothing/suits.dmi'
// 	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/shielded/syndi/inteq
// 	shield_state = "shield-yellow"

// /obj/item/clothing/suit/space/hardsuit/shielded/syndi/inteq/equipped(mob/user, slot)
// 	..()
// 	if(slot == ITEM_SLOT_OCLOTHING)
// 		if(!IS_INTEQ(user))
// 			to_chat(user, "<span class='danger'><B>СКАФАНДР МОДЕЛЬ ОДИН - ЩИТ</B>: Обнаружены неавторизованные сигнатуры. <B>Производится нейтрализация экипировки.</B></span>")
// 			playsound(get_turf(src), 'sound/machines/nuke/confirm_beep.ogg', 65, 1, 1)
// 			addtimer(CALLBACK(src, .proc/explode), 3 SECONDS)

// /obj/item/clothing/suit/space/hardsuit/shielded/syndi/inteq/proc/explode()
// 	do_sparks(3, 1, src)
// 	explosion(src.loc,0,1,1,1)
// 	qdel(src)

//////////

///Kovac added
////InteQ spacesuit
/obj/item/clothing/head/helmet/space/syndicate/inteq
	name = "brown space helmet"
	icon_state = "space-inteq"
	icon = 'zov_modular_arkstation/krashly_modulars/icons/obj/clothing/head.dmi'
	worn_icon = 'zov_modular_arkstation/krashly_modulars/icons/mob/clothing/head.dmi'


/obj/item/clothing/suit/space/syndicate/inteq
	name = "brown space suit"
	icon_state = "space-inteq"
	icon = 'zov_modular_arkstation/krashly_modulars/icons/obj/clothing/suits.dmi'
	worn_icon = 'zov_modular_arkstation/krashly_modulars/icons/mob/clothing/suits.dmi'
	worn_icon_digi = 'zov_modular_arkstation/krashly_modulars/icons/mob/clothing/suits.dmi'

/////////////////

////InteQ spacesuit box
/obj/item/storage/box/syndie_kit/space/inteq
	name = "boxed space suit and helmet"

/obj/item/storage/box/syndie_kit/space/inteq/Initialize(mapload)
	. = ..()
	atom_storage.max_specific_storage = WEIGHT_CLASS_NORMAL
	atom_storage.set_holdable(list(/obj/item/clothing/suit/space/syndicate/inteq, /obj/item/clothing/head/helmet/space/syndicate/inteq))

/obj/item/storage/box/syndie_kit/space/inteq/PopulateContents()
	new /obj/item/clothing/suit/space/syndicate/inteq(src)
	new /obj/item/clothing/head/helmet/space/syndicate/inteq(src)
