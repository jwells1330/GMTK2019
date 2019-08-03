var teleporter = instance_position(x, y, obj_teleporter);
if (teleporter != noone)
{
	with(obj_teleporter){
		if (color = teleporter.color) and (id != teleporter){
			obj_player.x = x + (CELL_SIZE / 2);
			obj_player.y = y + (CELL_SIZE / 2);
			obj_player.teleport_stun = true;
		}
	}
}