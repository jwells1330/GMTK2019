var mirror = argument0;
with(mirror){
	var index;
	with(mirror){
		if (ds_list_size(dir_list) > 1){
			index = ds_list_find_index(dir_list, dir);
			if (index < ds_list_size(dir_list) - 1) dir = ds_list_find_value(dir_list, index + 1);
			else{
				index = 0;
				dir = ds_list_find_value(dir_list, 0)
			}
			laserRefresh();
		}
	}
}
