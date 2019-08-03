 switch(dir){
	case dirs.left: with(instance_create_layer(x - CELL_SIZE, y, "Layer_Instance_Main", obj_beam)) {source = other.id; dir = source.dir} break;
	case dirs.right: with(instance_create_layer(x + CELL_SIZE, y, "Layer_Instance_Main", obj_beam)) {source = other.id; dir = source.dir} break;
	case dirs.up: with(instance_create_layer(x, y - CELL_SIZE, "Layer_Instance_Main", obj_beam)) {source = other.id; dir = source.dir} break;
	case dirs.down: with(instance_create_layer(x, y + CELL_SIZE, "Layer_Instance_Main", obj_beam)) {source = other.id; dir = source.dir} break;
}