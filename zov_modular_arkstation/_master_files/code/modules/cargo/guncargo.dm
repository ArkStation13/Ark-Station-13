#define MAX_HANDOUT_CHOICES 3

#define BASE_COST_MINIMUM 1000
#define BASE_COST_MAXIMUM 10000

SUBSYSTEM_DEF(cargo_companies)
	name = "Cargo Companies"
	wait = 10 MINUTES
	runlevels = RUNLEVEL_GAME
	/// Assoc list of companies that the subsystem has initialized, `"NAME" = datum_reference`
	var/list/companies = list()
	/// Assoc list of unpurchased companies
	var/list/unpurchased_companies = list()
	/// Assoc list of purchased companies
	var/list/purchased_companies = list()
	/// List of chosen handout company datums, for the user to pick 1
	var/list/chosen_handouts = list()
	/// Picked a free company yet?
	var/handout_picked = FALSE

/datum/controller/subsystem/cargo_companies/Initialize()
	// Adds the company refs to the unchanging companies list and the changing unpurchased_companies list
	for(var/datum/cargo_company/company as anything in subtypesof(/datum/cargo_company))
		var/datum/cargo_company/new_company = new company
		companies[new_company.name] = new_company
		unpurchased_companies[new_company.name] = new_company

	// Cargo gets to pick one company from several for free
	var/list/potential_handouts = list()
	for(var/company_name in unpurchased_companies)
		var/datum/cargo_company/picked_company = unpurchased_companies[company_name]
		if(!picked_company.can_roundstart_pick)
			continue
		potential_handouts += picked_company
	for(var/i in 1 to MAX_HANDOUT_CHOICES)
		chosen_handouts += pick_n_take(potential_handouts)
	fire() //Gotta get the prices randomized to start
	return SS_INIT_SUCCESS

/datum/controller/subsystem/cargo_companies/Destroy()
	for(var/company in companies)
		QDEL_NULL(company)
	for(var/company_unbought in unpurchased_companies)
		QDEL_NULL(unpurchased_companies)
	for(var/company_bought in purchased_companies)
		QDEL_NULL(purchased_companies)
	. = ..()

/datum/controller/subsystem/cargo_companies/Recover()
	companies = SScargo_companies.companies
	unpurchased_companies = SScargo_companies.unpurchased_companies
	purchased_companies = SScargo_companies.purchased_companies

/datum/controller/subsystem/cargo_companies/fire(resumed)
	// Company handling
	for(var/company in companies)
		var/datum/cargo_company/company_datum = companies[company]
		if(purchased_companies)
			company_datum.cost_mult = (LAZYLEN(purchased_companies) * 0.1) + company_datum.cost_mult

		// Set the prices of the companies, is intended to slowly scale up over time
		company_datum.base_cost += max(rand(company_datum.cost_change_lower, company_datum.cost_change_upper), 0)
		company_datum.base_cost = clamp(company_datum.base_cost, BASE_COST_MINIMUM, BASE_COST_MAXIMUM)
		company_datum.base_cost = company_datum.base_cost <= BASE_COST_MINIMUM ? BASE_COST_MINIMUM : company_datum.base_cost
		company_datum.cost = round(company_datum.base_cost * company_datum.cost_mult)

#undef MAX_HANDOUT_CHOICES
#undef BASE_COST_MINIMUM
#undef BASE_COST_MAXIMUM

// Monitor
/obj/machinery/computer/cargo
	var/sec_cargo = FALSE

/obj/machinery/computer/cargo/request/sec
	name = "security imports console"
	desc = "Used to access the cargo-impots."
	icon_screen = "supply"
	icon_keyboard = "security_key"
	circuit = /obj/item/circuitboard/computer/security/cargo
	light_color = COLOR_SOFT_RED
	sec_cargo = TRUE

	var/datum/component/armament/company_imports/used_guncargo_component = null

/obj/machinery/computer/cargo/request/sec/Initialize(mapload)
	. = ..()
	used_guncargo_component = GetComponent(/datum/component/armament/company_imports)
	used_guncargo_component.budget_name = "Security Budget"
	used_guncargo_component.buyer = SSeconomy.get_dep_account(ACCOUNT_SEC)

/obj/machinery/computer/cargo/request/sec/Destroy()
	used_guncargo_component = null
	return ..()

/obj/item/circuitboard/computer/security/cargo
	name = "Security Imports"
	greyscale_colors = CIRCUIT_COLOR_SECURITY
	build_path = /obj/machinery/computer/cargo/request/sec

// Crate
/obj/structure/closet/crate/secure/owned/security
	name = "security private crate"
	desc = "A crate cover designed to only open for who purchased its contents."
	icon_state = "secgearcrate"
	base_icon_state = "secgearcrate"
