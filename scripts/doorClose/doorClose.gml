var target_door = argument0;
with (target_door)
{
	open = false;
	assigned_solid = instance_create_layer(x, y, "Layer_Instance_main", obj_solid);
}