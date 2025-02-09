/obj/structure/dead_syndie
	name = "syndicate synthetic"
	desc = "A prototype of the Syndicate War Machines hanging from its own wires. It looks like he's dripping blood."
	icon = 'modularz_arkstation/_master_files/icons/obj/32x64.dmi'
	icon_state = "syndproto"
	density = TRUE
	anchored = TRUE
	resistance_flags = FIRE_PROOF | LAVA_PROOF | ACID_PROOF | UNACIDABLE
	max_integrity = 300
	integrity_failure = 0.1
	layer = 5

/obj/structure/dead_syndie/attackby(obj/item/W, mob/living/user, params)
	if(W.tool_behaviour == TOOL_WIRECUTTER)
		to_chat(user, "<span class='notice'>You start cutting wires from the ceiling...</span>")
		if(W.use_tool(src, user, 40, volume=50))
			to_chat(user, "<span class='notice'>You have successfully cut the wiring.</span>")
			qdel(src)
			new /obj/effect/decal/cleanable/blood/gibs/old(src)
	else
		return ..()
