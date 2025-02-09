/obj/item/ammo_box/attack_self(mob/user)
	var/obj/item/ammo_casing/casing = get_round()
	if(!casing)
		return

	casing.forceMove(drop_location())
	if(!user.is_holding(src) || !user.put_in_hands(casing)) //incase they're using TK
		casing.bounce_away(bounce_angle = rand(0, 360), spread_multiplier = 0.75,  still_warm = FALSE, sound_delay = 0)
	playsound(src, 'sound/items/weapons/gun/general/mag_bullet_insert.ogg', 60, TRUE)
	to_chat(user, span_notice("You remove a round from [src]!"))
	update_appearance()
