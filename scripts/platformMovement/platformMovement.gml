if (active == true){
	switch(moving){
		case dirs.left:
			{
				if (instance_position(bbox_left - spd, y, obj_pit) != noone) and (instance_position(bbox_left - spd, y, obj_platform) == noone){
					x -= spd;
					if (obj_player.current_platform == id) obj_player.x -= spd;
					with(obj_prop) if (current_platform == other.id) x -= other.spd;
				}
				else if (wait_timer == -1){
					wait_timer = wait_time;
				}
			}break;
		case dirs.right: 
			{
				if (instance_position(bbox_right + spd, y, obj_pit) != noone) and (instance_position(bbox_right + spd, y, obj_platform) == noone){
					x += spd;
					if (obj_player.current_platform == id) obj_player.x += spd;
					with(obj_prop) if (current_platform == other.id) x += other.spd;
				}
				else if (wait_timer == -1){
					wait_timer = wait_time;
				}
			}break;
		case dirs.up: 
			{
				if (instance_position(x, bbox_top - spd, obj_pit) != noone) and (instance_position(x, bbox_top - spd, obj_platform) == noone){
					y -= spd;
					if (obj_player.current_platform == id) obj_player.y -= spd;
					with(obj_prop) if (current_platform == other.id) y -= other.spd;
				}
				else if (wait_timer == -1){
					wait_timer = wait_time;
				}
			}break;
		case dirs.down: 
			{
				if (instance_position(x, bbox_bottom + spd, obj_pit) != noone) and (instance_position(x, bbox_bottom + spd, obj_platform) == noone){
					y += spd;
					if (obj_player.current_platform == id) obj_player.y += spd;
					with(obj_prop) if (current_platform == other.id) y += other.spd;
				}
				else if (wait_timer == -1){
					wait_timer = wait_time;
				}
			}break;
	}


	//Handle wait time triggers
	if (wait_timer > 0) wait_timer--;
	if (wait_timer == 0){
		switch(type){
			case platform_types.two_point_simple: //Sends the platform back in the opposite way in which it came
			{
				switch(moving){
					case dirs.left: moving = dirs.right; break;
					case dirs.right: moving = dirs.left; break;
					case dirs.up: moving = dirs.down; break;
					case dirs.down: moving = dirs.up; break;
				}
			}break;
			
			case platform_types.two_point_swap: //Sends the platform back in the opposite way in which it came
			{
				switch(moving){
					case dirs.left: moving = dirs.right; break;
					case dirs.right: moving = dirs.left; break;
					case dirs.up: moving = dirs.down; break;
					case dirs.down: moving = dirs.up; break;
				}
			}break;
			
			case platform_types.four_point_simple: //Sends the platform back in the opposite way in which it came
			{
				if (clockwise == true){
					switch(moving){
						case dirs.left: moving = dirs.up; break;
						case dirs.right: moving = dirs.down; break;
						case dirs.up: moving = dirs.right; break;
						case dirs.down: moving = dirs.left; break;
					}
				} else {
					switch(moving){
						case dirs.left: moving = dirs.down; break;
						case dirs.right: moving = dirs.up; break;
						case dirs.up: moving = dirs.left; break;
						case dirs.down: moving = dirs.right; break;
					}
				}
			}break;
		}
		wait_timer--;
	}
}
