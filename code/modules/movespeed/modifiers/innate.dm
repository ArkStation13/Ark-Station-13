/datum/movespeed_modifier/strained_muscles
	multiplicative_slowdown = -0.55
	blacklisted_movetypes = (FLYING|FLOATING)

/datum/movespeed_modifier/pai_spacewalk
	multiplicative_slowdown = 2
	flags = IGNORE_NOSLOW

<<<<<<< HEAD
=======
/datum/movespeed_modifier/snail
	blacklisted_movetypes = FLYING
	variable = TRUE

// no reason for leg loss (or gain) to affect speed if drifting
>>>>>>> 0ca5442a3f8... [MIRROR] Fixed limb slowdown and hunger affecting your speed in nograv [MDB IGNORE] (#3316)
/datum/movespeed_modifier/bodypart
	blacklisted_movetypes = (FLYING|FLOATING)
	variable = TRUE

/datum/movespeed_modifier/dna_vault_speedup
	blacklisted_movetypes = (FLYING|FLOATING)
	multiplicative_slowdown = -0.4
