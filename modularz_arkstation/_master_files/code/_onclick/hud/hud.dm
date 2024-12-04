GLOBAL_LIST_INIT(ark_ui_styles, list(
	"Midnight" = 'modularz_arkstation/_master_files/icons/ui_icons/ark_ui_styles/screen_midnight.dmi',
	"Retro" = 'modularz_arkstation/_master_files/icons/ui_icons/ark_ui_styles/screen_retro.dmi',
	"Plasmafire" = 'modularz_arkstation/_master_files/icons/ui_icons/ark_ui_styles/screen_plasmafire.dmi',
	"Slimecore" = 'modularz_arkstation/_master_files/icons/ui_icons/ark_ui_styles/screen_slimecore.dmi',
	"Operative" = 'modularz_arkstation/_master_files/icons/ui_icons/ark_ui_styles/screen_operative.dmi',
	"Clockwork" = 'modularz_arkstation/_master_files/icons/ui_icons/ark_ui_styles/screen_clockwork.dmi',
	"Glass" = 'modularz_arkstation/_master_files/icons/ui_icons/ark_ui_styles/screen_glass.dmi',
	"Trasen-Knox" = 'modularz_arkstation/_master_files/icons/ui_icons/ark_ui_styles/screen_trasenknox.dmi',
	"Detective" = 'modularz_arkstation/_master_files/icons/ui_icons/ark_ui_styles/screen_detective.dmi',
))

/proc/ark_ui_style2icon(ui_style)
	return GLOB.ark_ui_styles[ui_style] || GLOB.ark_ui_styles[GLOB.ark_ui_styles[1]]
