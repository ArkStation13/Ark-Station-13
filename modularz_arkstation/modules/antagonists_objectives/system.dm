/datum/antagonist/traitor/forge_single_generic_objective()
	if(prob(KILL_PROB))
		var/list/active_ais = active_ais(skip_syndicate = TRUE)
		if(active_ais.len && prob(DESTROY_AI_PROB(GLOB.joined_player_list.len)))
			var/datum/objective/destroy/destroy_objective = new()
			destroy_objective.owner = owner
			destroy_objective.find_target()
			return destroy_objective

		if(prob(MAROON_PROB))
			var/datum/objective/maroon/maroon_objective = new()
			maroon_objective.owner = owner
			maroon_objective.find_target()
			return maroon_objective

		var/datum/objective/assassinate/kill_objective = new()
		kill_objective.owner = owner
		kill_objective.find_target()
		return kill_objective

	if(prob(RP_PROB))
		var/datum/objective/gimmick/gimmick_objective = new()
		gimmick_objective.owner = owner
		return gimmick_objective

	var/datum/objective/steal/steal_objective = new()
	steal_objective.owner = owner
	steal_objective.find_target()
	return steal_objective
