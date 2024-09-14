//to add a splatter of blood or other mob liquid.
/obj/effect/decal/cleanable/blood
	var/count = 0

/mob/living/add_splatter_floor(turf/T, small_drip)
	if(get_blood_id() != /datum/reagent/blood)
		return
	if(!T)
		T = get_turf(src)
	if(isclosedturf(T) || (isgroundlessturf(T) && !GET_TURF_BELOW(T)))
		return

	var/datum/reagent/blood_type = get_blood_id()
	var/list/temp_blood_DNA
	if(small_drip)

		if(T.liquids)
			var/list/blood_drop = list(get_blood_id() = 0.1)
			T.add_liquid_list(blood_drop, FALSE, 300)
			return
		// Only a certain number of drips (or one large splatter) can be on a given turf.
		var/obj/effect/decal/cleanable/blood/drip/drop = locate() in T
		if(drop)
			if(drop.drips < 5)
				T.pollute_turf(/datum/pollutant/metallic_scent, 5)
				drop.drips++
				drop.add_overlay(pick(drop.random_icon_states))
				drop.transfer_mob_blood_dna(src)
				return
			else
				temp_blood_DNA = GET_ATOM_BLOOD_DNA(drop) //we transfer the dna from the drip to the splatter
				qdel(drop)//the drip is replaced by a bigger splatter
		else
			T.pollute_turf(/datum/pollutant/metallic_scent, 5)
			drop = new(T, get_static_viruses())
			drop.transfer_mob_blood_dna(src)
			return

	// Create a bit of metallic pollution, as that's how blood smells
	T.pollute_turf(/datum/pollutant/metallic_scent, 30)

	// Find a blood decal or create a new one.
	var/obj/effect/decal/cleanable/blood/B = locate() in T
	if(!B)
		B = new /obj/effect/decal/cleanable/blood/splatter(T, get_static_viruses())
	if(QDELETED(B)) //Give it up
		return
	B.bloodiness = min((B.bloodiness + BLOOD_AMOUNT_PER_DECAL), BLOOD_POOL_MAX)
	B.transfer_mob_blood_dna(src) //give blood info to the blood decal.
	if(temp_blood_DNA)
		B.add_blood_DNA(temp_blood_DNA)

	if(B.count < 10 )
		if(blood_type)
			B.color = initial(blood_type.color)
		B.count ++
		B.transfer_mob_blood_dna(src)
	B.transfer_mob_blood_dna(src) //give blood info to the blood decal.
	if(temp_blood_DNA)
		B.add_blood_DNA(temp_blood_DNA)

	if(B.count > 4) // 2 - For more blood pools. || 4 - Normal. || 6 - Rare blood pools.
		qdel(B)
		var/list/blood_large = list(get_blood_id() = 20)
		T.add_liquid_list(blood_large, FALSE, 300)
