initializeEnums();
//Center player tile
x += CELL_SIZE / 2;
y += CELL_SIZE / 2;

moving = dirs.none;
flipping = false;
falling = false;
fall_timer = room_speed / 2;
switch_stun = false;
teleport_stun = false;
switch_stun_timer = 0;
target_switch = noone;
move_timer = 0;
spd = 2;
current_platform = noone;