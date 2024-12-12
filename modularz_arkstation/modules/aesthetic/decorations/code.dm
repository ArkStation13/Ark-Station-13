/// 32x32
// Artwork Statues
/obj/structure/statue/artwork
	name = "cockroach statue"
	desc = "A statue of one of the most resilient creatures in the galaxy."
	icon = 'modularz_arkstation/modules/aesthetic/decorations/icons/decor32x32.dmi'
	icon_state = "artwork_statue"
	custom_materials = list(/datum/material/iron=SHEET_MATERIAL_AMOUNT*5)
	anchored = TRUE

/obj/structure/statue/artwork/terra
	name = "evergreen statue"
	desc = "Statue of Terra, representing eternal greenery and development."
	icon_state = "artwork_statue_1"

/obj/structure/statue/artwork/humanity
	name = "statue of Humanity"
	desc = "A statue representing Humanity and their power."
	icon_state = "artwork_statue_2"

/obj/structure/statue/artwork/clown
	name = "clown statue"
	desc = "Don't forget who lifts your spirits! Honk!"
	icon_state = "artwork_statue_3"

/obj/structure/statue/artwork/carp
	name = "red carp statue"
	desc = "Statue of a red carp. One of the symbols of the Red Hawks corporation."
	icon_state = "artwork_statue_4"

/obj/structure/statue/artwork/galaxy
	name = "CIG statue"
	desc = "A statue representing the planets of the CONFEDERATION OF INDEPENDENT GIANTS."
	icon_state = "artwork_statue_5"

/obj/effect/spawner/random/artwork_statue
	name = "artwork statue spawner"

/obj/effect/spawner/random/artwork_statue/Initialize(mapload)
	loot = typesof(/obj/structure/statue/artwork)
	. = ..()

/// 64x64
/obj/structure/statue/ship_memorial
	name = "ship memorial"
	desc = "A monument to the workers who built this ship. KR-7."
	icon = 'modularz_arkstation/modules/aesthetic/decorations/icons/decor64x64.dmi'
	icon_state = "ship_memorial"
