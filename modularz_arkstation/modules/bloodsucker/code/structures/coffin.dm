/datum/antagonist/bloodsucker/proc/claim_coffin(obj/structure/closet/crate/claimed, area/current_area)
	// ALREADY CLAIMED
	if(claimed.resident)
		if(claimed.resident == owner.current)
			to_chat(owner, "This is your [src].")
		else
			to_chat(owner, "This [src] has already been claimed by another.")
		return FALSE
	if(!(GLOB.the_station_areas.Find(current_area.type)))
		claimed.balloon_alert(owner.current, "not part of station!")
		return
	// This is my Lair
	coffin = claimed
	bloodsucker_lair_area = current_area
	to_chat(owner, span_userdanger("You have claimed the [claimed] as your place of immortal rest! Your lair is now [bloodsucker_lair_area]."))
	to_chat(owner, span_announce("Bloodsucker Tip: Find new lair recipes in the Structures tab of the <i>Crafting Menu</i>, including the <i>Persuasion Rack</i> for converting crew into Vassals."))
	return TRUE

/// From crate.dm
/obj/structure/closet/crate
	breakout_time = 20 SECONDS
	///The resident (owner) of this crate/coffin.
	var/mob/living/resident
	///The time it takes to pry this open with a crowbar.
	var/pry_lid_timer = 25 SECONDS

/obj/structure/closet/crate/coffin/examine(mob/user)
	. = ..()
	if(user == resident)
		. += span_cult("This is your Claimed Coffin.")
		. += span_cult("Rest in it while injured to enter Torpor. Entering it with unspent Ranks will allow you to spend one.")
		. += span_cult("Going inside while it contains a heart will put it in your chest, letting you regain your might.")
		. += span_cult("Alt-Click while inside the Coffin to Lock/Unlock. This also fixes the lock if it's broken.")
		. += span_cult("Alt-Click while outside of your Coffin to Unclaim it, unwrenching it and all your other structures as a result.")

/obj/structure/closet/crate/coffin/blackcoffin
	name = "black coffin"
	desc = "For those departed who are not so dear."
	icon_state = "coffin"
	icon = 'modularz_arkstation/modules/bloodsucker/icons/obj/structures/vamp_obj.dmi'
	open_sound = 'modularz_arkstation/modules/bloodsucker/sound/machines/coffin_open.ogg'
	close_sound = 'modularz_arkstation/modules/bloodsucker/sound/machines/coffin_close.ogg'
	breakout_time = 30 SECONDS
	pry_lid_timer = 20 SECONDS
	resistance_flags = NONE
	material_drop = /obj/item/stack/sheet/iron
	material_drop_amount = 2
	armor_type = /datum/armor/blackcoffin

/datum/armor/blackcoffin
	melee = 50
	bullet = 20
	laser = 30
	bomb = 50
	fire = 70
	acid = 60

/obj/structure/closet/crate/coffin/securecoffin
	name = "secure coffin"
	desc = "For those too scared of having their place of rest disturbed."
	icon_state = "securecoffin"
	base_icon_state = "securecoffin"
	icon = 'modularz_arkstation/modules/bloodsucker/icons/obj/structures/vamp_obj.dmi'
	open_sound = 'modularz_arkstation/modules/bloodsucker/sound/machines/coffin_open.ogg'
	close_sound = 'modularz_arkstation/modules/bloodsucker/sound/machines/coffin_close.ogg'
	breakout_time = 35 SECONDS
	pry_lid_timer = 35 SECONDS
	resistance_flags = FIRE_PROOF | LAVA_PROOF | ACID_PROOF
	material_drop = /obj/item/stack/sheet/iron
	material_drop_amount = 2
	armor_type = /datum/armor/securecoffin

/datum/armor/securecoffin
	melee = 35
	bullet = 20
	laser = 20
	bomb = 100
	fire = 100
	acid = 100

/obj/structure/closet/crate/coffin/meatcoffin
	name = "meat coffin"
	desc = "When you're ready to meat your maker, the steaks can never be too high."
	icon_state = "meatcoffin"
	base_icon_state = "meatcoffin"
	icon = 'modularz_arkstation/modules/bloodsucker/icons/obj/structures/vamp_obj.dmi'
	resistance_flags = FIRE_PROOF
	open_sound = 'sound/effects/footstep/slime1.ogg'
	close_sound = 'sound/effects/footstep/slime1.ogg'
	breakout_time = 25 SECONDS
	pry_lid_timer = 20 SECONDS
	material_drop = /obj/item/food/meat/slab/human
	material_drop_amount = 3
	armor_type = /datum/armor/meatcoffin

/datum/armor/meatcoffin
	melee = 70
	bullet = 10
	laser = 10
	bomb = 70
	fire = 70
	acid = 60

/obj/structure/closet/crate/coffin/metalcoffin
	name = "metal coffin"
	desc = "A big metal sardine can inside of another big metal sardine can, in space."
	icon_state = "metalcoffin"
	base_icon_state = "metalcoffin"
	icon = 'modularz_arkstation/modules/bloodsucker/icons/obj/structures/vamp_obj.dmi'
	resistance_flags = FIRE_PROOF | LAVA_PROOF
	open_sound = 'sound/effects/pressureplate.ogg'
	close_sound = 'sound/effects/pressureplate.ogg'
	breakout_time = 25 SECONDS
	pry_lid_timer = 30 SECONDS
	material_drop = /obj/item/stack/sheet/iron
	material_drop_amount = 5
	armor_type = /datum/armor/metalcoffin

/datum/armor/metalcoffin
	melee = 40
	bullet = 15
	laser = 50
	bomb = 10
	fire = 70
	acid = 60

//////////////////////////////////////////////

/// NOTE: This can be any coffin that you are resting AND inside of.
/obj/structure/closet/crate/coffin/proc/claim_coffin(mob/living/claimant, area/current_area)
	var/datum/antagonist/bloodsucker/bloodsuckerdatum = claimant.mind.has_antag_datum(/datum/antagonist/bloodsucker)
	// Successfully claimed?
	if(bloodsuckerdatum.claim_coffin(src, current_area))
		resident = claimant
		anchored = TRUE
		START_PROCESSING(SSprocessing, src)
		return TRUE
	return FALSE

/obj/structure/closet/crate/coffin/Destroy()
	unclaim_coffin()
	STOP_PROCESSING(SSprocessing, src)
	return ..()

/obj/structure/closet/crate/coffin/process(mob/living/user)
	. = ..()
	if(!.)
		return FALSE
	if(user in src)
		var/list/turf/area_turfs = get_area_turfs(get_area(src))
		// Create Dirt etc.
		var/turf/T_Dirty = pick(area_turfs)
		if(T_Dirty && !T_Dirty.density)
			// Default: Dirt
			// STEP ONE: COBWEBS
			// CHECK: Wall to North?
			var/turf/check_N = get_step(T_Dirty, NORTH)
			if(istype(check_N, /turf/closed/wall))
				// CHECK: Wall to West?
				var/turf/check_W = get_step(T_Dirty, WEST)
				if(istype(check_W, /turf/closed/wall))
					new /obj/effect/decal/cleanable/cobweb(T_Dirty)
				// CHECK: Wall to East?
				var/turf/check_E = get_step(T_Dirty, EAST)
				if(istype(check_E, /turf/closed/wall))
					new /obj/effect/decal/cleanable/cobweb/cobweb2(T_Dirty)
			new /obj/effect/decal/cleanable/dirt(T_Dirty)

/obj/structure/closet/crate/proc/unclaim_coffin(manual = FALSE)
	// Unanchor it (If it hasn't been broken, anyway)
	anchored = FALSE
	if(!resident || !resident.mind)
		return
	un_enlarge(resident)
	// Unclaiming
	var/datum/antagonist/bloodsucker/bloodsuckerdatum = resident.mind.has_antag_datum(/datum/antagonist/bloodsucker)
	if(bloodsuckerdatum && bloodsuckerdatum.coffin == src)
		bloodsuckerdatum.coffin = null
		bloodsuckerdatum.bloodsucker_lair_area = null
	for(var/obj/structure/bloodsucker/bloodsucker_structure in get_area(src))
		if(bloodsucker_structure.owner == resident)
			bloodsucker_structure.unbolt()
	if(manual)
		to_chat(resident, span_cult_italic("You have unclaimed your coffin! This also unclaims all your other Bloodsucker structures!"))
	else
		to_chat(resident, span_cult_italic("You sense that the link with your coffin and your sacred lair has been broken! You will need to seek another."))
	// Remove resident. Because this object isnt removed from the game immediately (GC?) we need to give them a way to see they don't have a home anymore.
	resident = null

/// You cannot lock in/out a coffin's owner. SORRY.
/obj/structure/closet/crate/coffin/can_open(mob/living/user)
	if(!locked)
		return ..()
	if(user == resident)
		if(welded)
			welded = FALSE
			update_icon()
		locked = FALSE
		return TRUE
	playsound(get_turf(src), 'sound/machines/closet/closet_close.ogg', 20, 1)
	to_chat(user, span_notice("[src] appears to be locked tight from the inside."))

/obj/structure/closet/crate/coffin/close(mob/living/user)
	var/datum/antagonist/bloodsucker/bloodsuckerdatum = IS_BLOODSUCKER(user)
	if(bloodsuckerdatum && user.mob_size > max_mob_size)
		if(!HAS_TRAIT_FROM_ONLY(src, TRAIT_COFFIN_ENLARGED, "bloodsucker_coffin"))
			if(prompt_coffin_claim(bloodsuckerdatum))
				enlarge(user)
			else
				user.balloon_alert(user, "already claimed by another!")
	. = ..()
	if(!.)
		return FALSE
	for(var/atom/thing as anything in contents)
		SEND_SIGNAL(thing, COMSIG_ENTER_COFFIN, src, user)
	// Only the User can put themself into Torpor. If already in it, you'll start to heal.
	if(bloodsuckerdatum && (user in src))
		if(prompt_coffin_claim(bloodsuckerdatum))
			LockMe(user)
		//Level up if possible.
		if(!bloodsuckerdatum.my_clan)
			user.balloon_alert("enter a clan!")
			to_chat(user, span_notice("You must enter a Clan to rank up. Do it in the antag menu, which you can see by pressing the action button in the top left."))
		else if(!bloodsuckerdatum.frenzied)
			if(bloodsuckerdatum.GetUnspentRank() < 1)
				bloodsuckerdatum.blood_level_gain()
			// Level ups cost 30% of your max blood volume, which scales with your rank.
			bloodsuckerdatum.SpendRank(blood_cost = bloodsuckerdatum.max_blood_volume * BLOODSUCKER_LEVELUP_PERCENTAGE)
		bloodsuckerdatum.check_begin_torpor(TORPOR_SKIP_CHECK_DAMAGE)
	return TRUE

/obj/structure/closet/crate/coffin/proc/prompt_coffin_claim(datum/antagonist/bloodsucker/dracula)
	if(!dracula)
		return FALSE
	if(resident == dracula.owner.current)
		return TRUE
	var/area/current_area = get_area(src)
	if(!dracula.coffin && !resident)
		switch(tgui_alert(dracula.owner.current, "Do you wish to claim this as your coffin? [current_area] will be your lair.", "Claim Lair", list("Yes", "No")))
			if("Yes")
				return claim_coffin(dracula.owner.current, current_area)
	return FALSE

// some fatass bloodsucker is trying to fit in a too-small coffin, how about we make some room?
/obj/structure/closet/crate/proc/enlarge(mob/living/user)
	ADD_TRAIT(src, TRAIT_COFFIN_ENLARGED, "bloodsucker_coffin")
	max_mob_size = user.mob_size
	to_chat(user, span_warning("The coffin creaks and squeaks as you try to squeeze into it. It's a tight fit but you manage it make it fit you."))
	playsound(src, 'modularz_arkstation/modules/sounds-renewal/sound/items/blastdooropen.ogg')
	animate(src, 1 SECONDS, FALSE, BOUNCE_EASING, transform = transform.Scale(user.mob_size * COFFIN_ENLARGE_MULT))

/obj/structure/closet/crate/proc/un_enlarge(mob/living/user)
	if(!HAS_TRAIT_FROM_ONLY(src, TRAIT_COFFIN_ENLARGED, "bloodsucker_coffin"))
		return
	REMOVE_TRAIT(src, TRAIT_COFFIN_ENLARGED, "bloodsucker_coffin")
	max_mob_size = initial(max_mob_size)
	var/matrix/normal
	// transform.Scale(user.mob_size * (COFFIN_ENLARGE_MULT + 1)
	animate(src, 1 SECONDS, FALSE, transform = normal)

/// You cannot weld or deconstruct an owned coffin. Only the owner can destroy their own coffin.
/obj/structure/closet/crate/coffin/wrench_act_secondary(mob/living/user, obj/item/tool)
	if(resident && anchored)
		to_chat(user, span_danger("The coffin won't come unanchored from the floor.[user == resident ? " You can Alt-Click to unclaim and unwrench your Coffin." : ""]"))
		return TRUE
	. = ..()

/obj/structure/closet/crate/coffin/tool_interact(obj/item/weapon, mob/living/user)
	if(locked && (weapon.tool_behaviour == TOOL_CROWBAR))
		var/pry_time = pry_lid_timer * weapon.toolspeed // Pry speed must be affected by the speed of the tool.
		user.visible_message(
			span_notice("[user] tries to pry the lid off of [src] with [weapon]."),
			span_notice("You begin prying the lid off of [src] with [weapon]. This should take about [DisplayTimeText(pry_time)].")
		)
		if(!do_after(user, pry_time, src))
			return TRUE
		bust_open()
		user.visible_message(
			span_notice("[user] snaps the door of [src] wide open."),
			span_notice("The door of [src] snaps open.")
		)
		return TRUE
	if(!resident)
		. = ..()
	if(user != resident)
		if(istype(weapon, cutting_tool))
			to_chat(user, span_notice("This is a much more complex mechanical structure than you thought. You don't know where to begin cutting [src]."))
			return TRUE
	. = ..()

/// Forces the coffin to get contents
/obj/structure/closet/proc/force_enter(mob/living/user)
	SEND_SIGNAL(src, COMSIG_CLOSET_PRE_CLOSE, user)
	take_contents()
	var/inserted = insert(user)
	playsound(loc, close_sound, close_sound_volume, TRUE, -3)
	opened = FALSE
	set_density(TRUE)
	animate_door(TRUE)
	update_appearance()
	after_close(user)
	SEND_SIGNAL(src, COMSIG_CLOSET_POST_CLOSE, user)
	return inserted

/// Distance Check (Inside Of)
/obj/structure/closet/crate/coffin/click_alt(mob/user)
	. = ..()
	if(user in src)
		LockMe(user, !locked)
		return

	if(user == resident && user.Adjacent(src))
		balloon_alert(user, "unclaim coffin?")
		var/static/list/unclaim_options = list(
			"Yes" = image(icon = 'icons/hud/radial.dmi', icon_state = "radial_yes"),
			"No" = image(icon = 'icons/hud/radial.dmi', icon_state = "radial_no"))
		var/unclaim_response = show_radial_menu(user, src, unclaim_options, radius = 36, require_near = TRUE)
		switch(unclaim_response)
			if("Yes")
				unclaim_coffin(TRUE)

/obj/structure/closet/crate/proc/LockMe(mob/user, inLocked = TRUE)
	if(user == resident)
		if(!broken)
			locked = inLocked
			if(locked)
				to_chat(user, span_notice("You flip a secret latch and lock yourself inside [src]."))
			else
				to_chat(user, span_notice("You flip a secret latch and unlock [src]."))
			return
		// Broken? Let's fix it.
		to_chat(resident, span_notice("The secret latch that would lock [src] from the inside is broken. You set it back into place..."))
		if(!do_after(resident, 5 SECONDS, src))
			to_chat(resident, span_notice("You fail to fix [src]'s mechanism."))
			return
		to_chat(resident, span_notice("You fix the mechanism and lock it."))
		broken = FALSE
		locked = TRUE
