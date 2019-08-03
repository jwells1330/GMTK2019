var flip_timer = CELL_SIZE / 2;

//Ajust for standing on a platform is nessesary
current_platform = instance_position(x, y, obj_platform);

if (switch_stun_timer > 0) switch_stun_timer--;
if (global.input_break_switch_stun == true) {switch_stun = false; teleport_stun = false;}
if (switch_stun_timer == 0) switch_stun = false;
if (move_timer > 0){
	switch(moving){
		case dirs.left: x -= spd; break;
		case dirs.right: x += spd; break;
		case dirs.up: y -= spd; break;
		case dirs.down: y += spd; break;
	}
	
	move_timer -= spd;
	if (move_timer == 0) 
	{
		
		//Toggles falling in pit if thats a thing
		var trapdoor = instance_position(x, y, obj_trapdoor);
		if (instance_position(x, y, obj_pit) != noone) and (current_platform == noone){
			falling = true;
		}
		else if (trapdoor != noone){
			if (trapdoor.active == true) falling = true;
		}
		else if (current_platform != noone){ //Snaps to platform if standing on one
			var offset_x = x - current_platform.x;
			var offset_y = y - current_platform.y;
			
			x = current_platform.x + ((offset_x div CELL_SIZE) * CELL_SIZE) + (CELL_SIZE / 2);
			y = current_platform.y + ((offset_y div CELL_SIZE) * CELL_SIZE) + (CELL_SIZE / 2);
		}
		else{ //snap to regular floor
			if (flipping == false)
			{
				x = ((x div CELL_SIZE) * CELL_SIZE) + (CELL_SIZE / 2);
				y = ((y  div CELL_SIZE) * CELL_SIZE) + (CELL_SIZE / 2);
			}
		}
		
		if (flipping){
			move_timer = flip_timer;
			flipping = false;
			switch_stun = true;
			switchFlip(target_switch);
			target_switch = noone;
			switch_stun_timer = room_speed / 2;
			switch(moving){
				case dirs.left: moving = dirs.right; break;
				case dirs.right: moving = dirs.left; break;
				case dirs.up: moving = dirs.down; break;
				case dirs.down: moving = dirs.up; break;
			}
		}
		else moving = dirs.none;
		
		if (teleport_stun == false) playerTeleport();
	}

}
else{
	if (switch_stun == false) and (falling == false)
	{
		
		
		//Attempts to move in the desired direction unless blocked by a wall
		if (global.input_move_left) and (instance_position(x - CELL_SIZE, y, obj_solid) == noone) moving = dirs.left;
		else if (global.input_move_right) and (instance_position(x + CELL_SIZE, y, obj_solid) == noone)  moving = dirs.right;
		else if (global.input_move_up) and (instance_position(x, y - CELL_SIZE, obj_solid) == noone)  moving = dirs.up;
		else if (global.input_move_down) and (instance_position(x, y + CELL_SIZE, obj_solid) == noone)  moving = dirs.down;
	
		//Sets the player to either moving or flipping, depending on if they are moving onto the same tile as a switch or not
		if (moving != dirs.none){
		
			move_timer = CELL_SIZE;
			switch(moving){
			case dirs.left: target_switch = instance_position(x - CELL_SIZE, y, obj_switch); break;
			case dirs.right: target_switch = instance_position(x + CELL_SIZE, y, obj_switch); break;
			case dirs.up: target_switch = instance_position(x, y - CELL_SIZE, obj_switch); break;
			case dirs.down: target_switch = instance_position(x, y + CELL_SIZE, obj_switch); break;
			}
			if (target_switch != noone){
				move_timer = flip_timer; 
				flipping = true;
			}
		}
		else moving = dirs.none;
		
		switch(moving){
		case dirs.left: {x -= spd; move_timer -= spd;} break;
		case dirs.right: {x += spd; move_timer -= spd;}  break;
		case dirs.up: {y -= spd; move_timer -= spd;}  break;
		case dirs.down: {y += spd; move_timer -= spd;}  break;
		}
	}
}