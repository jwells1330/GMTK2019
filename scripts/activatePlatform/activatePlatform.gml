var cannon = argument0;
with(cannon){
	switch(type){
		case platform_types.two_point_simple:
		{
			if (active == true) active = false;
			else active = true;
		}break;
		
		case platform_types.two_point_swap:
		{
			if (moving == dirs.left) or (moving == dirs.right) moving = dirs.down;
			else if (moving == dirs.up) or (moving == dirs.down) moving = dirs.right;
		}break;
	}
}