/obj/item/summon_beacon/vanguard
	name = "vanguard operatives supply beacon"
	desc = "Used to request your job supplies, use in hand to do so!"

	allowed_areas = list(
		/area/awaymission,
		/area/station/command/gateway,
	)

	selectable_atoms = list(
		/obj/structure/closet/crate/secure/exp_corps/marksman,
		/obj/structure/closet/crate/secure/exp_corps/pointman,
		/obj/structure/closet/crate/secure/exp_corps/field_medic,
		/obj/structure/closet/crate/secure/exp_corps/combat_tech,
	)

	area_string = "the gateway chamber"
