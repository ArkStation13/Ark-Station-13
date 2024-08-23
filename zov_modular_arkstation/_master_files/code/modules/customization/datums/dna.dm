/datum/dna/update_body_size()
	. = ..()
	//Handle the small icon
	var/HSize = get_size(holder) //переменная для взятого размера holder
	if(!holder.small_sprite)
		holder.small_sprite = new(holder)
	if(HSize >= (RESIZE_A_BIGNORMAL + RESIZE_NORMAL) / 2)
		holder.small_sprite.Grant(holder)
	else
		holder.small_sprite.Remove(holder)
