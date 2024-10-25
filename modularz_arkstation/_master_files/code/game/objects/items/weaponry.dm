//Melee

/obj/item/claymore/cerberus
	name = "claymore"
	desc = "What are you staring at? Slash your enemies!"
	icon = 'modularz_arkstation/_master_files/icons/obj/weapons/weapons.dmi'
	icon_state = "siegesword"
	worn_icon_state = "claymore"
	inhand_icon_state = "siegesword"
	lefthand_file = 'modularz_arkstation/_master_files/icons/mob/inhands/weapons/lefthand.dmi'
	righthand_file = 'modularz_arkstation/_master_files/icons/mob/inhands/weapons/righthand.dmi'
	force = 30

/obj/item/claymore/censor
	name = "silver sword"
	desc = "Silver sword with engraving on the blade and hilt. The dried blood on the blade haunts your mind."
	icon = 'modularz_arkstation/_master_files/icons/obj/weapons/weapons.dmi'
	icon_state = "silversword"
	inhand_icon_state = "silversword"
	worn_icon_state = "claymore"
	lefthand_file = 'modularz_arkstation/_master_files/icons/mob/inhands/weapons/lefthand.dmi'
	righthand_file = 'modularz_arkstation/_master_files/icons/mob/inhands/weapons/righthand.dmi'
	force = 35

/obj/item/claymore/baron
	name = "silver sabre"
	desc = "Silver saber with engraving on the blade and hilt. The dried blood on the blade haunts your mind."
	icon = 'modularz_arkstation/_master_files/icons/obj/weapons/weapons.dmi'
	icon_state = "sabre"
	inhand_icon_state = "sabre"
	worn_icon_state = "claymore"
	lefthand_file = 'modularz_arkstation/_master_files/icons/mob/inhands/weapons/lefthand.dmi'
	righthand_file = 'modularz_arkstation/_master_files/icons/mob/inhands/weapons/righthand.dmi'
	force = 15 // 40

/obj/item/spear/cerberus
	icon_state = "tribal_spear0"
	icon = 'modularz_arkstation/_master_files/icons/obj/weapons/weapons.dmi'
	worn_icon_state = "military_spear0"
	lefthand_file = 'modularz_arkstation/_master_files/icons/mob/inhands/weapons/lefthand.dmi'
	righthand_file = 'modularz_arkstation/_master_files/icons/mob/inhands/weapons/righthand.dmi'
	name = "tribal spear"
	force = 25
	icon_prefix = "tribal_spear"

/obj/item/claymore/cerberus/bardiche
	name = "bardiche"
	desc = "A huge stick with a blade at the end. Say it's called an ax? In any case, it cuts people well."
	icon = 'modularz_arkstation/_master_files/icons/obj/weapons/weapons.dmi'
	icon_state = "bardiche"
	inhand_icon_state = "bardiche"
	lefthand_file = 'modularz_arkstation/_master_files/icons/mob/inhands/weapons/lefthand.dmi'
	righthand_file = 'modularz_arkstation/_master_files/icons/mob/inhands/weapons/righthand.dmi'
	force = 35

/obj/item/shield/riot/cerberus
	name = "wooden shield"
	desc = "A wooden shield with a small iron insert in the middle. Has a handle to make it easier to hold."
	icon = 'modularz_arkstation/_master_files/icons/obj/weapons/weapons.dmi'
	icon_state = "wbuckler"
	inhand_icon_state = "wbuckler"
	worn_icon_state = "buckler"
	lefthand_file = 'modularz_arkstation/_master_files/icons/mob/inhands/weapons/lefthand.dmi'
	righthand_file = 'modularz_arkstation/_master_files/icons/mob/inhands/weapons/righthand.dmi'

/obj/item/shield/riot/paladin
	name = "paladin shield"
	desc = "A steel shield with a with the cross of the Gray Post Christian Church in the middle."
	icon = 'modularz_arkstation/_master_files/icons/obj/weapons/weapons.dmi'
	icon_state = "paladin"
	inhand_icon_state = "paladin"
	worn_icon_state = "buckler"
	lefthand_file = 'modularz_arkstation/_master_files/icons/mob/inhands/weapons/lefthand.dmi'
	righthand_file = 'modularz_arkstation/_master_files/icons/mob/inhands/weapons/righthand.dmi'

/obj/item/gun/energy/taser/bolestrel
	name = "sparq"
	desc = "A weapon that uses small darts that cause your opponent to wallow in agony."
	icon = 'modularz_arkstation/_master_files/icons/obj/weapons/weapons.dmi'
	lefthand_file = 'modularz_arkstation/_master_files/icons/mob/inhands/weapons/lefthand.dmi'
	righthand_file = 'modularz_arkstation/_master_files/icons/mob/inhands/weapons/righthand.dmi'
	icon_state = "sparq"
	inhand_icon_state = "sparq0"
	ammo_type = list(/obj/item/ammo_casing/energy/electrode/bolestrel)

/obj/item/gun/energy/taser/bolestrel/censor
	name = "modernized sparq"
	icon_state = "taser_h"

/obj/item/ammo_casing/energy/electrode/bolestrel
	projectile_type = /obj/projectile/energy/electrode/bolestrel
	select_name = "pain"
	fire_sound = 'modularz_arkstation/_master_files/sound/weapons/bowfire.wav'
	e_cost = 50
	harmful = FALSE

/obj/projectile/energy/electrode/bolestrel
	icon = 'modularz_arkstation/_master_files/icons/obj/projectiles.dmi'
	icon_state = "cbbolt"
	hitsound = 'modularz_arkstation/_master_files/sound/weapons/nebhit.ogg'
