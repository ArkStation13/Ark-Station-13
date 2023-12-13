///InteQ "Durand" Mecha
/obj/vehicle/sealed/mecha/marauder/mauler/ares
	desc = "Бог Войны среди Мехов. Разработки Солнечной Федерации дали нам Ареса. Бронированная машина будет давить ваших врагов."
	name = "\improper MIB-02 Ares"
	icon = 'zov_modular_arkstation/krashly_modulars/icons/obj/mecha/ares.dmi'
	icon_state = "ares"
	base_icon_state = "ares"
	ui_theme = "inteq"
	accesses = list(ACCESS_CENT_GENERAL)
	wreckage = /obj/structure/mecha_wreckage/ares

/obj/vehicle/sealed/mecha/marauder/mauler/ares/generate_actions()
	. = ..()
	initialize_passenger_action_type(/datum/action/vehicle/sealed/mecha/mech_smoke)

////

/obj/vehicle/sealed/mecha/marauder/mauler/ares/loaded
	equip_by_category = list(
		MECHA_L_ARM = /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/lmg,
		MECHA_R_ARM = /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/missile_rack,
		MECHA_UTILITY = list(/obj/item/mecha_parts/mecha_equipment/radio, /obj/item/mecha_parts/mecha_equipment/air_tank/full, /obj/item/mecha_parts/mecha_equipment/thrusters/ion),
		MECHA_POWER = list(),
		MECHA_ARMOR = list(/obj/item/mecha_parts/mecha_equipment/armor/antiproj_armor_booster),
	)

/obj/vehicle/sealed/mecha/marauder/mauler/ares/loaded/Initialize(mapload)
	. = ..()
	max_ammo()

/obj/vehicle/sealed/mecha/marauder/mauler/ares/loaded/populate_parts()
	cell = new /obj/item/stock_parts/cell/bluespace(src)
	scanmod = new /obj/item/stock_parts/scanning_module/triphasic(src)
	capacitor = new /obj/item/stock_parts/capacitor/quadratic(src)
	servo = new /obj/item/stock_parts/servo/femto(src)
	update_part_values()

////

/obj/structure/mecha_wreckage/ares
	name = "\improper MIB-02 Ares wreckage"
	icon = 'zov_modular_arkstation/krashly_modulars/icons/obj/mecha/ares.dmi'
	icon_state = "ares-broken"
	parts = list(
			/obj/item/mecha_parts/part/durand_torso,
			/obj/item/mecha_parts/part/durand_head,
			/obj/item/mecha_parts/part/durand_left_arm,
			/obj/item/mecha_parts/part/durand_right_arm,
			/obj/item/mecha_parts/part/durand_left_leg,
			/obj/item/mecha_parts/part/durand_right_leg)

///InteQ "Gygax" Mecha
/obj/vehicle/sealed/mecha/gygax/dark/hermes
	desc = "Отличный для быстрых атак Мех. Разработки Солнечной Федерации позволили нападать с флангов на металлической коннице. Гермес не заменим своей маневренностью и скоростью."
	name = "\improper MIB-01 Hermes"
	base_icon_state = "hermes"
	icon = 'zov_modular_arkstation/krashly_modulars/icons/obj/mecha/hermes.dmi'
	icon_state = "hermes"
	ui_theme = "inteq"
	accesses = list(ACCESS_CENT_GENERAL)
	wreckage = /obj/structure/mecha_wreckage/hermes

/obj/vehicle/sealed/mecha/gygax/dark/hermes/generate_actions()
	. = ..()
	initialize_passenger_action_type(/datum/action/vehicle/sealed/mecha/mech_smoke)

/obj/structure/mecha_wreckage/hermes
	name = "\improper MIB-01 Hermes wreckage"
	icon = 'zov_modular_arkstation/krashly_modulars/icons/obj/mecha/hermes.dmi'
	icon_state = "hermes-broken"
	parts = list(
			/obj/item/mecha_parts/part/durand_torso,
			/obj/item/mecha_parts/part/durand_head,
			/obj/item/mecha_parts/part/durand_left_arm,
			/obj/item/mecha_parts/part/durand_right_arm,
			/obj/item/mecha_parts/part/durand_left_leg,
			/obj/item/mecha_parts/part/durand_right_leg)

/obj/vehicle/sealed/mecha/gygax/dark/hermes/loaded/Initialize(mapload)
	. = ..()
	max_ammo()

/obj/vehicle/sealed/mecha/gygax/dark/hermes/loaded/populate_parts()
	cell = new /obj/item/stock_parts/cell/bluespace(src)
	scanmod = new /obj/item/stock_parts/scanning_module/triphasic(src)
	capacitor = new /obj/item/stock_parts/capacitor/quadratic(src)
	servo = new /obj/item/stock_parts/servo/femto(src)
	update_part_values()
