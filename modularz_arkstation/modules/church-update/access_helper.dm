/obj/effect/mapping_helpers/airlock/access/all/church
	icon_state = "access_helper"

/obj/effect/mapping_helpers/airlock/access/all/church/chapel_general/get_access()
	var/list/access_list = ..()
	access_list += ACCESS_CHURCH_GENERAL
	return access_list

/obj/effect/mapping_helpers/airlock/access/all/church/chapel_office/get_access()
	var/list/access_list = ..()
	access_list += ACCESS_CHAPEL_OFFICE
	return access_list

/obj/effect/mapping_helpers/airlock/access/all/church/crematorium/get_access()
	var/list/access_list = ..()
	access_list += ACCESS_CREMATORIUM
	return access_list

/obj/effect/mapping_helpers/airlock/access/all/church/deacon/get_access()
	var/list/access_list = ..()
	access_list += ACCESS_CHURCH_DEACON
	return access_list

/obj/effect/mapping_helpers/airlock/access/all/church/fiscal/get_access()
	var/list/access_list = ..()
	access_list += ACCESS_CHURCH_FISCAL
	return access_list

/obj/effect/mapping_helpers/airlock/access/any/church/maintenance/get_access()
	var/list/access_list = ..()
	access_list += list(ACCESS_CHURCH_GENERAL, ACCESS_MAINT_TUNNELS)
	return access_list
