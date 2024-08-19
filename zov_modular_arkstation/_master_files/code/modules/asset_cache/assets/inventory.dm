/datum/asset/simple/inventory/New()
	var/list/extra_assets = list(
		///Extra inventory
		"inventory-ears_extra.png" = 'zov_modular_arkstation/_master_files/icons/ui/inventory/ears_extra.png',
		"inventory-underwear.png" = 'zov_modular_arkstation/_master_files/icons/ui/inventory/underwear.png',
		"inventory-socks.png" = 'zov_modular_arkstation/_master_files/icons/ui/inventory/socks.png',
		"inventory-undershirt.png" = 'zov_modular_arkstation/_master_files/icons/ui/inventory/undershirt.png',
		"inventory-wrists.png" = 'zov_modular_arkstation/_master_files/icons/ui/inventory/wrists.png',
		"inventory-bra.png" = 'zov_modular_arkstation/_master_files/icons/ui/inventory/bra.png',
	)
	LAZYADD(assets, extra_assets)
	. = ..()
