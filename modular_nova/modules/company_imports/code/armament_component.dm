#define MAX_AMMO_AMOUNT 10
#define CARGO_CONSOLE 1
#define IRN_CONSOLE 2
#define SEC_CARGO_CONSOLE 3 // ARK STATION ADDITION

/datum/component/armament/company_imports
	/// Selected amount of ammo to purchase
	var/ammo_purchase_num = 1
	/// Is this set to private order
	var/self_paid = FALSE
	/// Cooldown to announce a requested order
	COOLDOWN_DECLARE(radio_cooldown)
	/// To cut down on redundant istypes(), what this component is attached to
	var/console_state = null
	/// If this is a tablet, the parent budgetordering
	var/datum/computer_file/program/budgetorders/parent_prog

	var/budget_name = "Cargo Budget" // ARK STATION ADDTION
	var/datum/bank_account/buyer // ARK STATION ADDTION

/datum/component/armament/company_imports/Initialize(list/required_products, list/needed_access)
	. = ..()
	if(istype(parent, /obj/machinery/computer/cargo))
		console_state = CARGO_CONSOLE
// ARK STATION ADDITION START
	if(istype(parent, /obj/machinery/computer/cargo/request/sec))
		console_state = SEC_CARGO_CONSOLE
// ARK STATION ADDTION END
	else if(istype(parent, /obj/item/modular_computer))
		console_state = IRN_CONSOLE

	buyer = SSeconomy.get_dep_account(ACCOUNT_CAR) // ARK STATION ADDTION

/datum/component/armament/company_imports/Destroy(force)
	parent_prog = null
	. = ..()

/datum/component/armament/company_imports/on_attack_hand(datum/source, mob/living/user)
	return

/datum/component/armament/company_imports/on_attackby(atom/target, obj/item, mob/user)
	return

/datum/component/armament/company_imports/ui_data(mob/user)
	var/list/data = list()

	var/mob/living/carbon/human/the_person = user
	var/obj/item/card/id/id_card
	// var/datum/bank_account/buyer = SSeconomy.get_dep_account(ACCOUNT_CAR) // ARK STATION REMOVED

	if(console_state == IRN_CONSOLE)
		id_card = parent_prog.computer.computer_id_slot?.GetID()
	else
		if(istype(the_person))
			id_card = the_person.get_idcard(TRUE)

	//var/budget_name = "Cargo Budget" // ARK STATION REMOVED

	if(id_card?.registered_account && (console_state == IRN_CONSOLE))
		if((ACCESS_COMMAND in id_card.access) || (ACCESS_QM in id_card.access))
			parent_prog.requestonly = FALSE
			buyer = SSeconomy.get_dep_account(id_card.registered_account?.account_job.paycheck_department)
			parent_prog.can_approve_requests = TRUE
		else
			parent_prog.requestonly = TRUE
			parent_prog.can_approve_requests = FALSE
	else
		parent_prog?.requestonly = TRUE

	if(id_card)
		budget_name = self_paid ? id_card.name : buyer.account_holder

	data["budget_name"] = budget_name

	var/cant_buy_restricted = TRUE

	if(console_state == CARGO_CONSOLE)
		var/obj/machinery/computer/cargo/console = parent
		if(!console.requestonly)
			cant_buy_restricted = FALSE

// ARK STATION ADDITION START
	if(console_state == SEC_CARGO_CONSOLE)
		cant_buy_restricted = FALSE
// ARK STATION ADDITION END

	else if((console_state == IRN_CONSOLE) && id_card?.registered_account)
		if((ACCESS_COMMAND in id_card.access) || (ACCESS_QM in id_card.access))
			if((buyer == SSeconomy.get_dep_account(id_card.registered_account.account_job.paycheck_department)) && !self_paid)
				cant_buy_restricted = FALSE

	data["cant_buy_restricted"] = !!cant_buy_restricted
	data["budget_points"] = self_paid ? id_card?.registered_account?.account_balance : buyer?.account_balance
	data["ammo_amount"] = ammo_purchase_num
	data["self_paid"] = !!self_paid
	data["armaments_list"] = list()

	for(var/armament_category as anything in SSarmaments.entries)
// ARK STATION ADDITION START
		var/illegal_failure

		for(var/company as anything in SScargo_companies.companies)
			if(company != armament_category)
				continue

			var/datum/cargo_company/selected_company = SScargo_companies.companies[company]

			if(!(console_state == CARGO_CONSOLE) && selected_company.illegal)
				illegal_failure = TRUE
				break

			var/obj/machinery/computer/cargo/cargo_comp = parent
			if(selected_company.illegal && !(cargo_comp.obj_flags & EMAGGED))
				illegal_failure = TRUE
				break

		if(illegal_failure)
			continue
// ARK STATION ADDITION END

		var/list/armament_subcategories = list()

		for(var/subcategory as anything in SSarmaments.entries[armament_category][CATEGORY_ENTRY])
			var/list/subcategory_items = list()
			for(var/datum/armament_entry/armament_entry as anything in SSarmaments.entries[armament_category][CATEGORY_ENTRY][subcategory])
				if(products && !(armament_entry.type in products))
					continue

				var/datum/armament_entry/company_import/gun_entry = armament_entry

				if(gun_entry.contraband)
					if(!(console_state == CARGO_CONSOLE))
						continue
					var/obj/machinery/computer/cargo/parent_console = parent
					if(!parent_console.contraband)
						continue

				subcategory_items += list(list(
					"ref" = REF(armament_entry),
					"icon" = armament_entry.cached_base64,
					"name" = armament_entry.name,
					"cost" = armament_entry.cost,
					"buyable_ammo" = armament_entry.magazine ? TRUE : FALSE,
					"magazine_cost" = armament_entry.magazine_cost,
					"purchased" = purchased_items[armament_entry] ? purchased_items[armament_entry] : 0,
					"description" = armament_entry.description,
					"armament_category" = armament_entry.category,
					"equipment_subcategory" = armament_entry.subcategory,
					"restricted" = !!armament_entry.restricted,
				))

			if(!LAZYLEN(subcategory_items))
				continue

			armament_subcategories += list(list(
				"subcategory" = subcategory,
				"items" = subcategory_items,
			))

		if(!LAZYLEN(armament_subcategories))
			continue

// ARK STATION ADDITION START
		var/purchased_company = FALSE
		var/company_cost = 0
		var/handout_company = FALSE

		for(var/company as anything in SScargo_companies.companies)
			if(company != armament_category)
				continue

			if(company in SScargo_companies.purchased_companies)
				purchased_company = TRUE

			var/datum/cargo_company/company_datum = SScargo_companies.companies[company]

			if((company_datum in SScargo_companies.chosen_handouts) && !SScargo_companies.handout_picked)
				handout_company = TRUE

			company_cost = company_datum.cost
// ARK STATION ADDITION END

		data["armaments_list"] += list(list(
			"category" = armament_category,
			"category_purchased" = !!purchased_company, // ARK STATION ADDITION
			"category_uses" = used_categories[armament_category],
			"subcategories" = armament_subcategories,
			"cost" = company_cost, // ARK STATION ADDITION
			"handout" = !!handout_company, // ARK STATION ADDITION
		))

	return data

/datum/component/armament/company_imports/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "CargoImportConsole")
		ui.open()

/datum/component/armament/company_imports/select_armament(mob/user, datum/armament_entry/company_import/armament_entry)
	//var/datum/bank_account/buyer = SSeconomy.get_dep_account(ACCOUNT_CAR) // ARK STATION REMOVED
	var/obj/item/modular_computer/possible_downloader
	var/obj/machinery/computer/cargo/possible_console

	if(console_state == CARGO_CONSOLE)
		possible_console = parent

// ARK STATION ADDITION START
	if(console_state == SEC_CARGO_CONSOLE)
		possible_console = parent
// ARK STATION ADDITION END

	else if(console_state == IRN_CONSOLE)
		possible_downloader = parent

	if(!istype(armament_entry))
		return

	var/mob/living/carbon/human/the_person = user

	if(istype(the_person))

		var/obj/item/card/id/id_card

		if(console_state == IRN_CONSOLE)
			id_card = parent_prog.computer.computer_id_slot?.GetID()
		else
			id_card = the_person.get_idcard(TRUE)

		if(id_card?.registered_account && (console_state == IRN_CONSOLE))
			if((ACCESS_COMMAND in id_card.access) || (ACCESS_QM in id_card.access))
				parent_prog.requestonly = FALSE
				buyer = SSeconomy.get_dep_account(id_card.registered_account.account_job.paycheck_department)
				parent_prog.can_approve_requests = TRUE
			else
				parent_prog.requestonly = TRUE
				parent_prog.can_approve_requests = FALSE
		else
			parent_prog?.requestonly = TRUE

		if(self_paid)
			if(!istype(id_card))
				to_chat(user, span_warning("No ID card detected."))
				return

			if(istype(id_card, /obj/item/card/id/departmental_budget))
				to_chat(user, span_warning("[id_card] cannot be used to make purchases."))
				return

			var/datum/bank_account/account = id_card.registered_account

			if(!istype(account))
				to_chat(user, span_warning("Invalid bank account."))
				return

			buyer = account

	if(issilicon(user) && (console_state == IRN_CONSOLE))
		parent_prog.can_approve_requests = TRUE
		parent_prog.requestonly = FALSE

	if(!buyer)
		to_chat(user, span_warning("No budget found!"))
		return

	if(!ishuman(user) && !issilicon(user))
		return

	if(!buyer.has_money(armament_entry.cost))
		to_chat(user, span_warning("Not enough money!"))
		return

	var/name

	if(issilicon(user))
		name = user.real_name
	else
		the_person.get_authentification_name()

	var/reason = ""

	if(possible_console)
		if(possible_console.requestonly && !self_paid)
			reason = tgui_input_text(user, "Reason", name, max_length = MAX_MESSAGE_LEN)
// ARK STATION ADDITION START
			if(console_state == SEC_CARGO_CONSOLE)
				reason = "SECURITY DEPARTMENT: "+"[reason]"
// ARK STATION ADDITION END
			if(isnull(reason))
				return

	else if(possible_downloader)
		var/datum/computer_file/program/budgetorders/parent_file = parent_prog
		if((parent_file.requestonly && !self_paid) || !(possible_downloader.computer_id_slot?.GetID()))
			reason = tgui_input_text(user, "Reason", name, max_length = MAX_MESSAGE_LEN)
			if(isnull(reason))
				return

	used_categories[armament_entry.category]++

	purchased_items[armament_entry]++

	var/datum/supply_pack/armament/created_pack = new
	created_pack.name = initial(armament_entry.item_type.name)
	created_pack.cost = cost_calculate(armament_entry.cost) //Paid for seperately
	created_pack.contains = list(armament_entry.item_type)

	var/rank

	if(issilicon(user))
		rank = "Silicon"
	else
		rank = the_person.get_assignment(hand_first = TRUE)

	var/ckey = user.ckey

	var/datum/supply_order/company_import/created_order
	if(buyer != SSeconomy.get_dep_account(ACCOUNT_CAR))
		created_order = new(created_pack, name, rank, ckey, paying_account = buyer, reason = reason, can_be_cancelled = TRUE)
	else
		created_pack.goody = FALSE // Cargo ordered stuff should just show up in a box I think
		created_order = new(created_pack, name, rank, ckey, reason = reason, can_be_cancelled = TRUE)
	created_order.selected_entry = armament_entry
	created_order.used_component = src
	if(console_state == CARGO_CONSOLE)
		created_order.generateRequisition(get_turf(parent))
		if(possible_console.requestonly && !self_paid)
			SSshuttle.request_list += created_order
		else
			SSshuttle.shopping_list += created_order
// ARK STATION ADDITION START
	if(console_state == SEC_CARGO_CONSOLE)
		created_order.generateRequisition(get_turf(parent))
		if(possible_console.requestonly && !self_paid)
			SSshuttle.request_list += created_order
		else
			SSshuttle.shopping_list += created_order
// ARK STATION ADDITION END
	else if(console_state == IRN_CONSOLE)
		var/datum/computer_file/program/budgetorders/comp_file = parent_prog
		created_order.generateRequisition(get_turf(parent))
		if(comp_file.requestonly && !self_paid)
			SSshuttle.request_list += created_order
		else
			SSshuttle.shopping_list += created_order

/datum/component/armament/company_imports/proc/cost_calculate(cost)
	. = cost
	. *= SSeconomy.pack_price_modifier

/datum/component/armament/company_imports/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return

	switch(action)
// ARK STATION ADDITION START

		if("buy_company")
			var/target = params["selected_company"]
			var/obj/machinery/computer/cargo/possible_console

			if(console_state == CARGO_CONSOLE)
				possible_console = parent
				if(possible_console.requestonly && !self_paid)
					return

			else if(console_state == SEC_CARGO_CONSOLE)
				to_chat(usr, span_warning("You cannot purchase companies on a department import cargo computer!"))
				return

			else if(console_state == IRN_CONSOLE)
				if(!self_paid)
					to_chat(usr, span_warning("You cannot purchase companies on a tablet without privately ordering them!"))
					return

			for(var/find_company in SScargo_companies.unpurchased_companies)
				if(find_company != target)
					continue

				var/datum/cargo_company/found_company = SScargo_companies.unpurchased_companies[target]

				var/mob/living/carbon/human/user = usr

				if(!istype(user))
					return

				var/obj/item/card/id/id_card = user.get_idcard(TRUE)

				if(id_card?.registered_account && (console_state == IRN_CONSOLE))
					if((ACCESS_COMMAND in id_card.access) || (ACCESS_QM in id_card.access))
						parent_prog.requestonly = FALSE
						buyer = SSeconomy.get_dep_account(id_card.registered_account.account_job.paycheck_department)
						parent_prog.can_approve_requests = TRUE
					else
						parent_prog.requestonly = TRUE
						parent_prog.can_approve_requests = FALSE
				else
					parent_prog?.requestonly = TRUE

				if(self_paid)

					if(!istype(id_card))
						to_chat(user, span_warning("No ID card detected."))
						return

					if(istype(id_card, /obj/item/card/id/departmental_budget))
						to_chat(user, span_warning("[id_card] cannot be used to make purchases."))
						return

					var/datum/bank_account/account = id_card.registered_account

					if(!istype(account))
						to_chat(user, span_warning("Invalid bank account."))
						return

					buyer = account

				var/assigned_cost = -found_company.cost
				var/do_payment = TRUE
				if(!SScargo_companies.handout_picked && (found_company in SScargo_companies.chosen_handouts))
					do_payment = FALSE
					SScargo_companies.handout_picked = TRUE
				if(do_payment)
					if(!buyer.adjust_money(assigned_cost))
						return
				if(possible_console)
					possible_console.radio_wrapper(possible_console, "[find_company] has been purchased by [user] on [self_paid ? "[buyer.account_holder]'s balance" : "Cargo Budget"] for [abs(assigned_cost)].", RADIO_CHANNEL_SUPPLY)

				SScargo_companies.purchased_companies[find_company] = found_company
				SScargo_companies.unpurchased_companies.Remove(find_company)
				SScargo_companies.fire()
				break
// ARK STATION ADDITION END
		if("toggleprivate")
			var/obj/item/card/id/id_card
			var/mob/living/carbon/human/the_person = ui.user

			if(!istype(the_person))
				if(issilicon(the_person))
					self_paid = FALSE
				return

			if(console_state == IRN_CONSOLE)
				id_card = parent_prog.computer.computer_id_slot?.GetID()
			else
				id_card = the_person.get_idcard(TRUE)

			if(!id_card)
				return

			self_paid = !self_paid

#undef MAX_AMMO_AMOUNT
#undef CARGO_CONSOLE
#undef IRN_CONSOLE
#undef SEC_CARGO_CONSOLE // ARK STATION ADDITION
