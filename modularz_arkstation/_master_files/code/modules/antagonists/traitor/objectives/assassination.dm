/datum/traitor_objective/target_player/assassinate/behead
	name = "Behead %TARGET%, the %JOB TITLE%"
	description = "Behead and hold %TARGET%'s head to succeed this objective. If the head gets destroyed before you can do this, you will fail this objective."
	progression_reward = 2 MINUTES
	telecrystal_reward = list(1, 2)

	///the body who needs to hold the head
	var/mob/living/needs_to_hold_head
	///the head that needs to be picked up
	var/obj/item/bodypart/head/behead_goal

/datum/traitor_objective/target_player/assassinate/behead/heads_of_staff
	progression_reward = 4 MINUTES
	telecrystal_reward = list(2, 3)

	heads_of_staff = TRUE

/datum/traitor_objective/target_player/assassinate/behead/special_target_filter(list/possible_targets)
	for(var/datum/mind/possible_target as anything in possible_targets)
		var/mob/living/carbon/possible_current = possible_target.current
		var/obj/item/bodypart/head/behead_goal = possible_current.get_bodypart(BODY_ZONE_HEAD)
		if(!behead_goal)
			possible_targets -= possible_target //cannot be beheaded without a head

/datum/traitor_objective/target_player/assassinate/behead/generate_objective(datum/mind/generating_for, list/possible_duplicates)
	. = ..()
	if(!.) //didn't generate
		return FALSE
	AddComponent(/datum/component/traitor_objective_register, behead_goal, fail_signals = list(COMSIG_QDELETING))
	RegisterSignal(target, COMSIG_CARBON_REMOVE_LIMB, PROC_REF(on_target_dismembered))

/datum/traitor_objective/target_player/assassinate/behead/ungenerate_objective()
	UnregisterSignal(target, COMSIG_CARBON_REMOVE_LIMB)
	. = ..() //this unsets target
	if(behead_goal)
		UnregisterSignal(behead_goal, COMSIG_ITEM_PICKUP)
	behead_goal = null

/datum/traitor_objective/target_player/assassinate/behead/proc/on_head_pickup(datum/source, mob/taker)
	SIGNAL_HANDLER
	if(objective_state == OBJECTIVE_STATE_INACTIVE) //just in case- this shouldn't happen?
		fail_objective()
		return
	if(taker == handler.owner.current)
		taker.visible_message(span_notice("[taker] holds [behead_goal] into the air for a moment."), span_boldnotice("You lift [behead_goal] into the air for a moment."))
		succeed_objective()

/datum/traitor_objective/target_player/assassinate/behead/proc/on_target_dismembered(datum/source, obj/item/bodypart/head/lost_head, special, dismembered)
	SIGNAL_HANDLER
	if(!istype(lost_head))
		return
	if(objective_state == OBJECTIVE_STATE_INACTIVE)
		//no longer can be beheaded
		fail_objective()
	else
		behead_goal = lost_head
		RegisterSignal(behead_goal, COMSIG_ITEM_PICKUP, PROC_REF(on_head_pickup))
