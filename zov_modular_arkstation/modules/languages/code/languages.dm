/datum/language/german
	name = "Katzenjammer"
	desc = "A modernised version of the German language, combined with Austrian, Swiss, Neo Berlin and many other various dialects. Usually used by the inhabitants of the Earth."
	key = "g"
	flags = TONGUELESS_SPEECH
	syllables = list(
		"das leben", "warten", "die frau", "das jahr", "weit", "alles", "platz", "du", "aus", "uber", "aber", "yat", "übrigens", "hier", \
		"durch", "neu", "luftkuss", "freudentränen", "frühlingsgefühle", "verzehren", "geborgenheit", "sonne", "mutter", "engel", "tier", "mein", "herz", "brennt", \
		"zeit", "gut", "eins", "rosenrot", "ausländer", "angst", "haifisch", "bück", "dich", "adieu", "onhe", "reise", "herzeleid", \
		"seemann", "weisses", "fleisch", "riechst", "bist", "zerstören", "frühling", "führe", "halt", "donaukinder", "haifisch")
	icon_state = "german"
	icon = 'zov_modular_arkstation/modules/languages/icons/languages.dmi'
	default_priority = 98

/datum/language/panslavic
	icon = 'zov_modular_arkstation/modules/languages/icons/languages.dmi'

/datum/language/common
	icon = 'zov_modular_arkstation/modules/languages/icons/languages.dmi'

// Vampiric

/datum/language/vampiric
	name = "Blah-Sucker"
	desc = "The native language of the Bloodsucker elders, learned intuitively by Fledglings as they pass from death into immortality."
	key = "L"//Capital L, lowercase l is for ashies.
	space_chance = 40
	default_priority = 90

	flags = TONGUELESS_SPEECH | LANGUAGE_HIDE_ICON_IF_NOT_UNDERSTOOD
	syllables = list(
		"luk","cha","no","kra","pru","chi","busi","tam","pol","spu","och",
		"umf","ora","stu","si","ri","li","ka","red","ani","lup","ala","pro",
		"to","siz","nu","pra","ga","ump","ort","a","ya","yach","tu","lit",
		"wa","mabo","mati","anta","tat","tana","prol",
		"tsa","si","tra","te","ele","fa","inz",
		"nza","est","sti","ra","pral","tsu","ago","esch","chi","kys","praz",
		"froz","etz","tzil",
		"t'","k'","t'","k'","th'","tz'"
		)

	icon_state = "bloodsucker"
	icon = 'zov_modular_arkstation/modules/bloodsucker/icons/misc/language.dmi'
	secret = TRUE
