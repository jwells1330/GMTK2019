var cannon = argument0;
with(cannon){
	switch(type){
		case cannon_types.basic:
		{
			if (active == true) active = false;
			else active = true;
		} break;
		
		case cannon_types.swap:
		{
			var index;
			with(cannon){
				index = ds_list_find_index(modes, dir);
				if (index < ds_list_size(modes) - 1) dir = ds_list_find_value(modes, index + 1);
				else{
					index = 0;
					dir = ds_list_find_value(modes, 0)
				}
			}
		} break;
	}
}