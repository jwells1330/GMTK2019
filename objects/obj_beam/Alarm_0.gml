var mirror = instance_position(x, y, obj_mirror);
if (mirror != noone){
	if (mirror.dir == mirror_dirs.up_left){
		if (dir == dirs.up) or (dir = dirs.down){
			if (source.y < mirror.y) dir = dirs.left; else {instance_destroy() exit;}
		}
		else{
			if (source.x < mirror.x) dir = dirs.up; else {instance_destroy() exit;}
		}
	}
	else if (mirror.dir == mirror_dirs.up_right){
		if (dir == dirs.up) or (dir = dirs.down){
			if (source.y < mirror.y) dir = dirs.right; else {instance_destroy() exit;}
		}
		else{
			if (source.x > mirror.x) dir = dirs.up; else {instance_destroy() exit;}
		}
	}
	else if (mirror.dir == mirror_dirs.down_left){
		if (dir == dirs.up) or (dir = dirs.down){
			if (source.y > mirror.y) dir = dirs.left; else {instance_destroy() exit;}
		}
		else{
			if (source.x < mirror.x) dir = dirs.down; else {instance_destroy() exit;}
		}
	}
	else if (mirror.dir == mirror_dirs.down_right){
		if (dir == dirs.up) or (dir = dirs.down){
			if (source.y > mirror.y) dir = dirs.right; else {instance_destroy() exit;}
		}
		else{
			if (source.x > mirror.x) dir = dirs.down; else {instance_destroy() exit;}
		}
	}
}

switch(dir){
	case dirs.left: with(instance_create_layer(x - CELL_SIZE, y, "Layer_Instance_Main", obj_beam)) {source = other.source; dir = other.dir} break;
	case dirs.right: with(instance_create_layer(x + CELL_SIZE, y, "Layer_Instance_Main", obj_beam)) {source = other.source; dir = other.dir} break;
	case dirs.up: with(instance_create_layer(x, y - CELL_SIZE, "Layer_Instance_Main", obj_beam)) {source = other.source; dir = other.dir} break;
	case dirs.down: with(instance_create_layer(x, y + CELL_SIZE, "Layer_Instance_Main", obj_beam)) {source = other.source; dir = other.dir} break;
}

if (dir = dirs.up) or (dir = dirs.down) image_index = 1;
visible = true;