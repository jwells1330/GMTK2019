var trapdoor = argument0;
with(trapdoor){
	if (active == true) active = false;
	else {
		active = true;
		with(obj_player){
			if (instance_position(x, y, obj_trapdoor) == trapdoor) falling = true;
		}
	}
}