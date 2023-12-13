//wrist items (now we do, ha ha!)
/obj/item/clothing/wrists
	name = "slap bracelet"
	desc = "oh no."
	gender = PLURAL //change this if it is for a single wrist
	w_class = WEIGHT_CLASS_SMALL
	icon = 'zov_modular_arkstation/modules/new-slots/wrist_obj.dmi'
	worn_icon = 'zov_modular_arkstation/modules/new-slots/wrists.dmi'
	siemens_coefficient = 0.5
	body_parts_covered = HANDS
	//slot_flags = ITEM_SLOT_WRISTS
	attack_verb_simple = list("slapped on the wrist")
	strip_delay = 20
	equip_delay_other = 40
