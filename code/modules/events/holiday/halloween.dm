/datum/round_event_control/spooky
	name = "2 SPOOKY! (Halloween)"
	holidayID = HALLOWEEN
	typepath = /datum/round_event/spooky
	weight = -1 //forces it to be called, regardless of weight
	max_occurrences = 1
	earliest_start = 0 MINUTES
	category = EVENT_CATEGORY_HOLIDAY
	description = "Раздает всем угощения и превращает Ian и Poly в их праздничные версии."

/datum/round_event/spooky/start()
	..()
	for(var/i in GLOB.human_list)
		var/mob/living/carbon/human/H = i
		var/obj/item/storage/backpack/b = locate() in H.contents
		if(b)
			new /obj/item/storage/spooky(b)

	for(var/mob/living/basic/pet/dog/corgi/ian/Ian in GLOB.mob_living_list)
		Ian.place_on_head(new /obj/item/bedsheet(Ian))
	for(var/mob/living/basic/parrot/poly/bird in GLOB.mob_living_list)
		new /mob/living/basic/parrot/poly/ghost(bird.loc)
		qdel(bird)

/datum/round_event/spooky/announce(fake)
	priority_announce(pick("ПОГРУЗИТЕ МЕНЯ КОСТЯМИ!», «ПОЕЗДКА НИКОГДА НЕ ЗАКОНЧИТСЯ!», «ВЫСКАКИВАЕТ СКЕЛЕТ!», «ЖУТКО, СТРАШНЫЕ СКЕЛЕТЫ!», «ЧЛЕНЫ ЭКИПАЖА, ОСТЕРЕГАЙТЕСЬ, ВАС НАПУГАЮТ!") , "THE CALL IS COMING FROM INSIDE THE HOUSE")

//spooky foods (you can't actually make these when it's not halloween)
/obj/item/food/cookie/sugar/spookyskull
	name = "skull cookie"
	desc = "Жуткий! У него восхитительный кальциевый вкус!"
	icon = 'icons/obj/holiday/halloween_items.dmi'
	icon_state = "skeletoncookie"
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/cookie/sugar/spookycoffin
	name = "coffin cookie"
	desc = "Жуткий! Имеет восхитительный кофейный вкус!"
	icon = 'icons/obj/holiday/halloween_items.dmi'
	icon_state = "coffincookie"
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/cookie/sugar/spookycoffin/Initialize(mapload, seasonal_changes = FALSE)
	// Changes default parameter of seasonal_changes to FALSE, pass to parent
	return ..(mapload, seasonal_changes)

//spooky items

/obj/item/storage/spooky
	name = "trick-o-treat bag"
	desc = "Сумка в форме тыквы, в которую поместятся всевозможные вкусности!"
	icon = 'icons/obj/holiday/halloween_items.dmi'
	icon_state = "treatbag"

/obj/item/storage/spooky/Initialize(mapload)
	. = ..()
	for(var/distrobuteinbag in 0 to 5)
		var/type = pick(/obj/item/food/cookie/sugar/spookyskull,
		/obj/item/food/cookie/sugar/spookycoffin,
		/obj/item/food/candy_corn,
		/obj/item/food/candy,
		/obj/item/food/candiedapple,
		/obj/item/food/chocolatebar,
		/obj/item/organ/internal/brain ) // OH GOD THIS ISN'T CANDY!
		new type(src)
