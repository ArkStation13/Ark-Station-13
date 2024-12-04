/proc/bloom_filter(threshold, size, offset, alpha)
	. = list("type" = "bloom")
	if(!isnull(threshold))
		.["threshold"] = threshold
	if(!isnull(size))
		.["size"] = size
	if(!isnull(offset))
		.["offset"] = offset
	if(!isnull(alpha))
		.["alpha"] = alpha
