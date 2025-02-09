/datum/controller/subsystem/processing/quirks/proc/add_custom_quirk_blacklist()
    GLOB.quirk_blacklist += list(list(/datum/quirk/dominant_aura, /datum/quirk/well_trained))

/datum/controller/subsystem/processing/quirks/Initialize()
    . = ..()
    add_custom_quirk_blacklist()
