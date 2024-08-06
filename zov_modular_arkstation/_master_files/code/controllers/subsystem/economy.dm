/datum/controller/subsystem/economy/proc/add_custom_department_account()
    department_accounts[ACCOUNT_INT] = ACCOUNT_INT_NAME
    department_accounts[ACCOUNT_TAR] = ACCOUNT_TAR_NAME

/datum/controller/subsystem/economy/Initialize()
    . = ..()
    add_custom_department_account()
