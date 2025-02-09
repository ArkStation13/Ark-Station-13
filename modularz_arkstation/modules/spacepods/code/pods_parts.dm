/obj/item/circuitboard/mecha/spacepod_main
	name = "Raptor Central Control module (Space Pod Board)"
	icon_state = "mainboard"

/obj/item/circuitboard/mecha/spacepod_peri
	name = "Raptor Peripherals Control module (Space Pod Board)"
	icon_state = "mcontroller"

/obj/item/pods_parts
	name = "space pod part"
	icon = 'modularz_arkstation/modules/spacepods/icons/pod_parts/pod_construct.dmi'
	icon_state = "raptor0"
	w_class = WEIGHT_CLASS_GIGANTIC
	obj_flags = CONDUCTS_ELECTRICITY

/obj/item/pods_parts/hull
	name = "space pod hull"
	desc = "It's needs to build a Space Pod!"
	icon_state = "raptor0"
	var/state = POD_MAIN_BORD
	var/obj/vehicle/sealed/vectorcraft/auto/spacepod/pod_tip
	interaction_flags_item = NONE
	pixel_x = -32
	pixel_y = -32

/obj/item/pods_parts/plate/basic
	name = "standart armor plate"
	icon = 'modularz_arkstation/modules/spacepods/icons/pod_parts/plate.dmi'
	icon_state = "plate"
	desc = "White armor plate"

/obj/item/pods_parts/plate/sci
	name = "expeditor armor plate"
	icon = 'modularz_arkstation/modules/spacepods/icons/pod_parts/plate.dmi'
	icon_state = "plate_sci"
	desc = "Has average defense. Just right for space exploration."

/obj/item/pods_parts/plate/sec
	name = "security armor plate"
	icon = 'modularz_arkstation/modules/spacepods/icons/pod_parts/plate.dmi'
	icon_state = "plate_sec"
	desc = "Well-fortified protection for your Pod. Sold only under license!"

// modularz_arkstation\modules\spacepods\icons\pod_parts\pod_construct.dmi
