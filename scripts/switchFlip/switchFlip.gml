var target_switch = argument0;
with(target_switch){
	if (active) {
		active = false;
	}
	else {
		active = true;
	}
	for(var i = 0; i < ds_list_size(target_switch.connected_props); i++;)
	{
		propSwitch(ds_list_find_value(target_switch.connected_props, i));
	}
}