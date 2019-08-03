var target_door = argument0;
with (target_door)
{
	open = true;
	with(assigned_solid) instance_destroy();
	assigned_solid = noone;
}