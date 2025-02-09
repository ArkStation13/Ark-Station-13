/obj/effect/spawner/random/bioluminescent_plant
	name = "random bioluminescent plant"
	icon_state = "plant"
	loot = list(
		/obj/structure/flora/biolumi/lamp,
		/obj/structure/flora/biolumi/flower,
		/obj/structure/flora/biolumi/mine,
	)

/obj/effect/spawner/random/bioluminescent_plant/weak
	name = "random weak bioluminescent plant"
	icon_state = "plant"
	loot = list(
		/obj/structure/flora/biolumi/lamp/weaklight,
		/obj/structure/flora/biolumi/flower/weaklight,
		/obj/structure/flora/biolumi/mine/weaklight,
	)

// ADDITION
/obj/structure/flora/biolumi/lamp/heat
	name = "plant lamp"
	desc = "Bioluminescent plant much in a shape of a street lamp."
	icon_state = "lamp"
	variants = 2
	random_light = list("#FFC800", "#fce07b", "#fcedb6")

/obj/structure/flora/biolumi/lamp/heat/weaklight
	light_power = 0.3
