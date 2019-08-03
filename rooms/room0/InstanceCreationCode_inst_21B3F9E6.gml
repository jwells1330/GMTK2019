dir = dirs.down;
fire_rate = 3;
fire_timer = room_speed * fire_rate;
projectile_speed = 4;
active = true;
type = cannon_types.swap;
modes = ds_list_create();
ds_list_add(modes, dirs.down, dirs.up);