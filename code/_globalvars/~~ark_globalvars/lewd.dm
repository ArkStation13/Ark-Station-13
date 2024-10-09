GLOBAL_LIST_INIT(genitals_visibility_toggles, list(
	GENITAL_ALWAYS_SHOW,
	GENITAL_HIDDEN_BY_CLOTHES,
	GENITAL_NEVER_SHOW
))

GLOBAL_LIST_INIT(genitals_visibility_toggles_sopostovlenie, list(
	list("Always show", "eye"),
	list("Hidden by clothes", "tshirt"),
	list("Never show", "eye-slash")
))

GLOBAL_LIST_INIT(show_nsfw_flavor_text, list(
	"Always On",
	"Nude Only",
	"Never"
))

GLOBAL_LIST_INIT(gender, list(
	"Мужчина",
	"Женщина",
	"Небинарное",
	"Транс",
	"Жидкость",
	"Другое", // пиздец, в этой параше разбираться еще уметь надо.
	"Не выставлено",
	"Проверь OOC Заметки"
))

GLOBAL_LIST_INIT(based_erp_status, list(
	"Да",
	"Нет",
	"Спроси IC",
	"Спроси (L)OOC",
	"Проверь OOC Заметки",
	"Да - Актив и Пассив",
	"Да - Актив",
	"Да - Пассив"
))

GLOBAL_LIST_INIT(noncon_erp_status, list(
	"Да",
	"Нет",
	"Спроси (L)OOC",
	"Проверь OOC Заметки",
	"Да - Актив и Пассив",
	"Да - Актив",
	"Да - Пассив"
))

GLOBAL_LIST_INIT(vore_erp_status, list(
	"Да",
	"Нет",
	"Спроси (L)OOC",
	"Проверь OOC Заметки",
	"Да - Хищник и Жертва",
	"Да - Жертва",
	"Да - Хищник"
))

GLOBAL_LIST_INIT(mechanics_erp_status, list(
	"Только Ролевая Игра",
	"Только игровой Механ",
	"Ролевая игра и Механ",
	"Нет"
))

GLOBAL_LIST_INIT(sexuality_erp_status, list(
	"Гетеросексуал",
	"Гомосексуал",
	"Бисексуал",
	"Другое",
	"Асексуал",
	"Нету"
))

GLOBAL_LIST_INIT(hypno_erp_status, list(
	"Да - Всегда/Везде",
	"Да - Только Ролевая Игра",
	"Да - Только Механ",
	"Да - Ролевая игра и Механ",
	"Нет",
	"Спроси (L)OOC",
	"Проверь OOC Заметки"
))

GLOBAL_LIST_INIT(emote_length, list(
	"Несколько предложений",
	"1-2 Абзаца",
	"Многоабзацный",
	"Я буду писать столько - сколько ты",
	"Проверь OOC Заметки",
	"Не выставлено"
))

GLOBAL_LIST_INIT(approach_pref, list(
	"Подойти через IC",
	"Спросить в (L)OOC",
	"Любой способ",
	"Проверь OOC Заметки",
	"Не выставлено"
))

GLOBAL_LIST_INIT(race_pref, list(
	"Да",
	"Нет",
	"Без ЕРП",
	"Спроси L(OOC)",
	"Проверь OOC Заметки",
	"Не выставлено"
))

GLOBAL_LIST_INIT(skirt_peekable, typecacheof(list(
			// Everyone's jumpskirts
			/obj/item/clothing/under/color/jumpskirt,
			/obj/item/clothing/under/costume/buttondown/skirt,
			/obj/item/clothing/under/dress,
			/obj/item/clothing/under/suit/white/skirt,
			/obj/item/clothing/under/suit/black_really/skirt,
			/obj/item/clothing/under/syndicate/skirt,
			/obj/item/clothing/under/syndicate/tacticool/skirt,
			/obj/item/clothing/accessory/skilt,
			/obj/item/clothing/under/rank/civilian/curator/skirt,

			/* Centcom */
			/obj/item/clothing/under/rank/centcom/officer_skirt,
			/obj/item/clothing/under/rank/centcom/centcom_skirt,

			/*  Heads  */
			// Captain
			/obj/item/clothing/under/rank/captain/skirt,
			/obj/item/clothing/under/rank/captain/suit/skirt,


			/* Service */
			// Head of Personnel
			/obj/item/clothing/under/rank/civilian/head_of_personnel/skirt,
			/obj/item/clothing/under/rank/civilian/head_of_personnel/suit/skirt,
			// Chaplain
			/obj/item/clothing/under/rank/civilian/chaplain/skirt,

			// Botanist
			/obj/item/clothing/under/rank/civilian/hydroponics/skirt,

			// Janitor
			/obj/item/clothing/under/rank/civilian/janitor/skirt,
			// Lawyer
			/obj/item/clothing/under/rank/civilian/lawyer/black/skirt,
			/obj/item/clothing/under/rank/civilian/lawyer/beige/skirt,
			/obj/item/clothing/under/rank/civilian/lawyer/red/skirt,
			/obj/item/clothing/under/rank/civilian/lawyer/blue/skirt,
			/obj/item/clothing/under/rank/civilian/lawyer/bluesuit/skirt,
			/obj/item/clothing/under/rank/civilian/lawyer/purpsuit/skirt,
			/obj/item/clothing/under/rank/civilian/lawyer/galaxy/skirt,
			/obj/item/clothing/under/rank/civilian/lawyer/galaxy/red/skirt,
			// Clown and Mime
			/obj/item/clothing/under/rank/civilian/mime/skirt,
			/* Security */
			// Head of Security
			/obj/item/clothing/under/rank/security/head_of_security/skirt,
			/obj/item/clothing/under/rank/security/head_of_security/alt/skirt,
			// Warden
			/obj/item/clothing/under/rank/security/warden/skirt,
			// Secoff
			/obj/item/clothing/under/rank/security/officer/skirt,
			// Detective
			/obj/item/clothing/under/rank/security/detective/skirt,
			/obj/item/clothing/under/rank/security/detective/noir/skirt,
			// Prisoner
			/obj/item/clothing/under/rank/prisoner/skirt,


			/* Science */
			// Research director
			/obj/item/clothing/under/rank/rnd/research_director/skirt,
			/obj/item/clothing/under/rank/rnd/research_director/alt/skirt,
			/obj/item/clothing/under/rank/rnd/research_director/turtleneck/skirt,
			// Scientist
			/obj/item/clothing/under/rank/rnd/scientist/skirt,
			// Roboticist
			/obj/item/clothing/under/rank/rnd/roboticist/skirt,
			// Geneticist
			/obj/item/clothing/under/rank/rnd/geneticist/skirt,


			/* Engineering */
			// Chief Engineer
			/obj/item/clothing/under/rank/engineering/chief_engineer/skirt,
			/obj/item/clothing/under/rank/engineering/chief_engineer/turtleneck/skirt,
			// Engineer
			/obj/item/clothing/under/rank/engineering/engineer/skirt,
			// Atmos tech
			/obj/item/clothing/under/rank/engineering/atmospheric_technician/skirt,


			/* Medical */
			// Chief Medical Officer
			/obj/item/clothing/under/rank/medical/chief_medical_officer/skirt,
			/obj/item/clothing/under/rank/medical/chief_medical_officer/turtleneck/skirt,
			// Medical doctor
			/obj/item/clothing/under/rank/medical/doctor/skirt,
			/obj/item/clothing/under/rank/medical/virologist/skirt,
			// Coroner
			/obj/item/clothing/under/rank/medical/coroner/skirt,
			// Paramedic
			/obj/item/clothing/under/rank/medical/paramedic/skirt,
			// Chemist
			/obj/item/clothing/under/rank/medical/chemist/skirt,


			/* Cargo */
			// Quartermaster
			/obj/item/clothing/under/rank/cargo/qm/skirt,
			// Everyone else
			/obj/item/clothing/under/rank/cargo/tech/skirt,
)))
