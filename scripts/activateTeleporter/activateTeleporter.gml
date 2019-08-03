var tele = argument0;
var index;
with(tele){
	index = ds_list_find_index(color_list, color);
	if (index < ds_list_size(color_list) - 1) color = ds_list_find_value(color_list, index + 1);
	else{
		index = 0;
		color = ds_list_find_value(color_list, 0)
	}
}