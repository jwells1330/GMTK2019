switch(dir){
	case dirs.left: x -= spd; break;
	case dirs.right: x += spd; break;
	case dirs.up: y -= spd; break;
	case dirs.down: y += spd; break;
}

if (instance_position(x, y, obj_player) != noone) playerKill();
if (instance_position(x, y, obj_solid)  != noone) instance_destroy();
if (distance_to_object(obj_player) > 10000) instance_destroy();

//allow projectiles to flip switches
if (instance_position(x, y, obj_switch) != noone){
	var s = instance_position(x, y, obj_switch);
	switchFlip(s);
	instance_destroy();
}