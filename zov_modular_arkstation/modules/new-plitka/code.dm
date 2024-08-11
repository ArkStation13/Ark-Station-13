/obj/item/stack/tile/iron
	tile_reskin_types = list(
		/obj/item/stack/tile/iron,
		/obj/item/stack/tile/iron/edge,
		/obj/item/stack/tile/iron/half,
		/obj/item/stack/tile/iron/corner,
		/obj/item/stack/tile/iron/large,
		/obj/item/stack/tile/iron/small,
		/obj/item/stack/tile/iron/diagonal,
		/obj/item/stack/tile/iron/herringbone,
		/obj/item/stack/tile/iron/dark,
		/obj/item/stack/tile/iron/dark/smooth_edge,
		/obj/item/stack/tile/iron/dark/smooth_half,
		/obj/item/stack/tile/iron/dark/smooth_corner,
		/obj/item/stack/tile/iron/dark/smooth_large,
		/obj/item/stack/tile/iron/dark/small,
		/obj/item/stack/tile/iron/dark/diagonal,
		/obj/item/stack/tile/iron/dark/herringbone,
		/obj/item/stack/tile/iron/dark_side,
		/obj/item/stack/tile/iron/dark_corner,
		/obj/item/stack/tile/iron/checker,
		/obj/item/stack/tile/iron/white,
		/obj/item/stack/tile/iron/white/smooth_edge,
		/obj/item/stack/tile/iron/white/smooth_half,
		/obj/item/stack/tile/iron/white/smooth_corner,
		/obj/item/stack/tile/iron/white/smooth_large,
		/obj/item/stack/tile/iron/white/small,
		/obj/item/stack/tile/iron/white/diagonal,
		/obj/item/stack/tile/iron/white/herringbone,
		/obj/item/stack/tile/iron/white_side,
		/obj/item/stack/tile/iron/white_corner,
		/obj/item/stack/tile/iron/cafeteria,
		/obj/item/stack/tile/iron/recharge_floor,
		/obj/item/stack/tile/iron/smooth,
		/obj/item/stack/tile/iron/smooth_edge,
		/obj/item/stack/tile/iron/smooth_half,
		/obj/item/stack/tile/iron/smooth_corner,
		/obj/item/stack/tile/iron/smooth_large,
		/obj/item/stack/tile/iron/terracotta,
		/obj/item/stack/tile/iron/terracotta/small,
		/obj/item/stack/tile/iron/terracotta/diagonal,
		/obj/item/stack/tile/iron/terracotta/herringbone,
		/obj/item/stack/tile/iron/kitchen,
		/obj/item/stack/tile/iron/kitchen/small,
		/obj/item/stack/tile/iron/kitchen/diagonal,
		/obj/item/stack/tile/iron/kitchen/herringbone,
		/obj/item/stack/tile/iron/chapel,
		/obj/item/stack/tile/iron/showroomfloor,
		/obj/item/stack/tile/iron/solarpanel,
		/obj/item/stack/tile/iron/freezer,
		/obj/item/stack/tile/iron/grimy,
		/obj/item/stack/tile/iron/sepia,
		/obj/item/stack/tile/iron/old, // ARK STATION ADDITION
		/obj/item/stack/tile/iron/old/rust, // ARK STATION ADDITION
		/obj/item/stack/tile/iron/old/white, // ARK STATION ADDITION
	)

// /turf/open/indestructible/floor_old
// 	icon = 'zov_modular_arkstation/modules/new-plitka/floors.dmi'
// 	icon_state = "floor"

// /turf/open/floor
// 	icon = 'zov_modular_arkstation/modules/new-plitka/floors.dmi'
// 	icon_state = "floor"

// /turf/open/floor/stone
// 	icon = 'icons/turf/floors.dmi'

// STANDART
/turf/open/floor/iron/old
	icon = 'zov_modular_arkstation/modules/new-plitka/floors.dmi'
	icon_state = "floor"
	floor_tile = /obj/item/stack/tile/iron/old

/obj/item/stack/tile/iron/old
	icon = 'zov_modular_arkstation/modules/new-plitka/tiles.dmi'
	icon_state = "tile_old"
	merge_type = /obj/item/stack/tile/iron/old
	turf_type = /turf/open/floor/iron/old

// RUST (YELLOW)
/turf/open/floor/iron/old/rust
	icon_state = "floor_rust"
	floor_tile = /obj/item/stack/tile/iron/old/rust

/obj/item/stack/tile/iron/old/rust
	icon_state = "tile_old_rust"
	merge_type = /obj/item/stack/tile/iron/old/rust
	turf_type = /turf/open/floor/iron/old/rust

// WHITE
/turf/open/floor/iron/old/white
	icon_state = "floor_white"
	floor_tile = /obj/item/stack/tile/iron/old/white

/obj/item/stack/tile/iron/old/white
	icon_state = "tile_old_white"
	merge_type = /obj/item/stack/tile/iron/old/white
	turf_type = /turf/open/floor/iron/old/white
