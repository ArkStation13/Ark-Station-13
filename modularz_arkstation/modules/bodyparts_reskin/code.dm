// MUTANT HUMAN PART OVERRIDES - HEMOPHAGE AND HUMANOID SPRITE OVERRIDES//

#define SPECIES_MUTANT_HUMAN "mhuman" // Hemophages and Demihuman sprite overrides
#define BODYPART_ICON_ARK 'modularz_arkstation/modules/bodyparts_reskin/human_parts_greyscale.dmi'

/obj/item/bodypart/head/mhuman
	icon_greyscale = BODYPART_ICON_ARK
	limb_id = SPECIES_MUTANT_HUMAN

/obj/item/bodypart/chest/mhuman
	icon_greyscale = BODYPART_ICON_ARK
	limb_id = SPECIES_MUTANT_HUMAN

/obj/item/bodypart/arm/left/mhuman
	icon_greyscale = BODYPART_ICON_MAMMAL
	limb_id = SPECIES_MAMMAL

/obj/item/bodypart/arm/right/mhuman
	icon_greyscale = BODYPART_ICON_MAMMAL
	limb_id = SPECIES_MAMMAL

/obj/item/bodypart/leg/left/mhuman
	icon_greyscale = BODYPART_ICON_ARK
	limb_id = SPECIES_MUTANT_HUMAN

/obj/item/bodypart/leg/right/mhuman
	icon_greyscale = BODYPART_ICON_ARK
	limb_id = SPECIES_MUTANT_HUMAN

/datum/species/humanoid
	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/mhuman,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/mhuman,
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/mhuman,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/mhuman,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/mhuman,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/mhuman,
	)
