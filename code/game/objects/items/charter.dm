/obj/item/station_charter
	name = "station charter"
	icon = 'icons/obj/scrolls.dmi'
	icon_state = "charter"
	desc = "An official document entrusting the governance of the station \
		and surrounding space to the Captain."
	var/used = FALSE
	var/name_type = "station"

	var/unlimited_uses = FALSE
	var/ignores_timeout = FALSE
	var/response_timer_id = null
	var/approval_time = 600

	var/static/regex/standard_station_regex

/obj/item/station_charter/Initialize(mapload)
	. = ..()
	if(!standard_station_regex)
		var/prefixes = jointext(GLOB.station_prefixes, "|")
		var/names = jointext(GLOB.station_names, "|")
		var/suffixes = jointext(GLOB.station_suffixes, "|")
		var/numerals = jointext(GLOB.station_numerals, "|")
		var/regexstr = "^(([prefixes]) )?(([names]) ?)([suffixes]) ([numerals])$"
		standard_station_regex = new(regexstr)

/obj/item/station_charter/attack_self(mob/living/user)
	if(used)
		to_chat(user, span_warning("The [name_type] has already been named!"))
		return
	if(!ignores_timeout && (world.time-SSticker.round_start_time > STATION_RENAME_TIME_LIMIT)) //5 minutes
		to_chat(user, span_warning("The crew has already settled into the shift. It probably wouldn't be good to rename the [name_type] right now."))
		return
	if(response_timer_id)
		to_chat(user, span_warning("You're still waiting for approval from your employers about your proposed name change, it'd be best to wait for now."))
		return

	var/new_name = tgui_input_text(user, "What do you want to name \
		[station_name()]? Keep in mind particularly terrible names may be \
		rejected by your employers, while names using the standard format \
		will be accepted automatically.", "Station Name", max_length = MAX_CHARTER_LEN)

	if(response_timer_id)
		to_chat(user, span_warning("You're still waiting for approval from your employers about your proposed name change, it'd be best to wait for now."))
		return

	if(!new_name)
		return
	user.log_message("has proposed to name the station as \
		[new_name]", LOG_GAME)

	if(standard_station_regex.Find(new_name))
		to_chat(user, span_notice("Your name has been automatically approved."))
		rename_station(new_name, user.name, user.real_name, key_name(user))
		return

	to_chat(user, span_notice("Your name has been sent to your employers for approval."))
	// Autoapproves after a certain time
	response_timer_id = addtimer(CALLBACK(src, PROC_REF(rename_station), new_name, user.name, user.real_name, key_name(user)), approval_time, TIMER_STOPPABLE)
	to_chat(GLOB.admins,
		span_adminnotice("<b><font color=orange>CUSTOM STATION RENAME:</font></b>[ADMIN_LOOKUPFLW(user)] proposes to rename the [name_type] to [new_name] (will autoapprove in [DisplayTimeText(approval_time)]). [ADMIN_SMITE(user)] (<A href='byond://?_src_=holder;[HrefToken(forceGlobal = TRUE)];reject_custom_name=[REF(src)]'>REJECT</A>) [ADMIN_CENTCOM_REPLY(user)]"),
		type = MESSAGE_TYPE_PRAYER)
	for(var/client/admin_client in GLOB.admins)
		if(admin_client.prefs.toggles & SOUND_ADMINHELP)
			window_flash(admin_client, ignorepref = TRUE)
			SEND_SOUND(admin_client, sound('sound/effects/gong.ogg'))

/obj/item/station_charter/proc/reject_proposed(user)
	if(!user)
		return
	if(!response_timer_id)
		return
	var/turf/T = get_turf(src)
	T.visible_message(span_warning("The proposed changes disappear \
		from [src]; it looks like they've been rejected."))
	var/m = "[key_name(user)] has rejected the proposed station name."

	message_admins(m)
	log_admin(m)

	deltimer(response_timer_id)
	response_timer_id = null

/obj/item/station_charter/proc/rename_station(designation, uname, ureal_name, ukey)
	set_station_name(designation)
	minor_announce("[ureal_name] has designated your station as [html_decode(station_name())]", "Ark Commander's Charter") //decode station_name to avoid minor_announce double encode // ARK STATION EDIT || Captain
	log_game("[ukey] has renamed the station as [station_name()].")

	name = "station charter for [station_name()]"
	desc = "An official document entrusting the governance of \
		[station_name()] and surrounding space to Ark Commander [uname]." // ARK STATION EDIT || Captain
	SSblackbox.record_feedback("text", "station_renames", 1, "[station_name()]")
	if(!unlimited_uses)
		used = TRUE

/obj/item/station_charter/admin
	unlimited_uses = TRUE
	ignores_timeout = TRUE


/obj/item/station_charter/banner
	name = "\improper Nanotrasen banner"
	icon = 'icons/obj/banner.dmi'
	name_type = "planet"
	icon_state = "banner"
	inhand_icon_state = "banner"
	lefthand_file = 'icons/mob/inhands/equipment/banners_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/banners_righthand.dmi'
	desc = "A cunning device used to claim ownership of celestial bodies."
	w_class = WEIGHT_CLASS_HUGE
	force = 15

/obj/item/station_charter/banner/rename_station(designation, uname, ureal_name, ukey)
	set_station_name(designation)
	minor_announce("[ureal_name] has designated the [name_type] as [html_decode(station_name())]", "Ark Commander's Banner") //decode station_name to avoid minor_announce double encode // ARK STATION EDIT || Captain
	log_game("[ukey] has renamed the [name_type] as [station_name()].")
	name = "banner of [station_name()]"
	desc = "The banner bears the official coat of arms of Nanotrasen, signifying that [station_name()] has been claimed by Ark Commander [uname] in the name of the company." // ARK STATION EDIT || Captain
	SSblackbox.record_feedback("text", "station_renames", 1, "[station_name()]")
	if(!unlimited_uses)
		used = TRUE
