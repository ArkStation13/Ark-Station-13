/obj/item/clothing/under/rank/security/saare
	name = "SAARE utility uniform"
	desc = "<Placeholder>"
	icon = 'modularz_arkstation/modules/SAARE-Update/icons/obj.dmi'
	worn_icon = 'modularz_arkstation/modules/SAARE-Update/icons/mob.dmi'
	worn_icon_digi = 'modularz_arkstation/modules/SAARE-Update/icons/saare_digi.dmi'
	lefthand_file = 'modularz_arkstation/modules/SAARE-Update/icons/saare_left.dmi'
	righthand_file = 'modularz_arkstation/modules/SAARE-Update/icons/obj.dmi'
	icon_state = "saare"
	inhand_icon_state = "saare"

/datum/loadout_item/under/jumpsuit/saare_suit
	name = "SAARE Utility Uniform"
	item_path = /obj/item/clothing/under/rank/security/saare
	restricted_roles = list(JOB_SECURITY_OFFICER, JOB_WARDEN, JOB_HEAD_OF_SECURITY, JOB_BRIG_PILOT, JOB_SECURITY_MEDIC)

/datum/loadout_item/inhand/flag_saare
	name = "Folded SAARE Flag"
	item_path = /obj/item/sign/flag/saare

/obj/structure/sign/flag/saare
	name = "flag of SAARE"
	desc = "<Placeholder>"
	icon = 'modularz_arkstation/modules/SAARE-Update/icons/saareflag.dmi'
	icon_state = "saareflag"
	item_flag = /obj/item/sign/flag/saare

/obj/item/sign/flag/saare
	name = "folded flag of the SAARE"
	desc = "<Placeholder>"
	icon = 'modularz_arkstation/modules/SAARE-Update/icons/saareflag.dmi'
	icon_state = "saareflagb"
	sign_path = /obj/structure/sign/flag/saare
