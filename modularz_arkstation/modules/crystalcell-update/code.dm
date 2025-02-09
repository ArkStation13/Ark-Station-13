/obj/item/stock_parts/power_store/cell/crystal_cell/Initialize(mapload, override_maxcharge)
	. = ..()
	desc += "You can charge this battery if you blow into it."

/obj/item/stock_parts/power_store/cell/crystal_cell/attack_self(mob/living/carbon/human/user, list/modifiers)
	. = ..()
	if(user.is_mouth_covered(ITEM_SLOT_MASK))
		to_chat(user, span_danger("Your mouth is closed!"))
		return
	if(charge == maxcharge)
		to_chat(user, span_notice("You try to blow into the [src], but it's no use. It's full of energy!"))
		return
	if(do_after(user, 5 SECONDS))
		charge = maxcharge
		to_chat(user, span_notice("You have inflated the [src]. Now it contains [charge]/[maxcharge] MJ."))
