event_inherited();
if (active == true){
	image_index = dir;

	//fire projectiles
	fire_timer--;
	if (fire_timer == 0){
		with(instance_create_layer(x + (CELL_SIZE / 2), y + (CELL_SIZE / 2), "Layer_Instance_Main", obj_projectile)){
			dir = other.dir;
			spd = other.projectile_speed;
		}
		fire_timer = fire_rate * room_speed;
	}
}
else image_index = 0;
	