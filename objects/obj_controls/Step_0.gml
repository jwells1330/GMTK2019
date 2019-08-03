global.input_move_left = keyboard_check(ord("A"));
global.input_move_right = keyboard_check(ord("D"));
global.input_move_up = keyboard_check(ord("W"));
global.input_move_down = keyboard_check(ord("S"));
global.input_break_switch_stun = (keyboard_check_pressed(ord("A")) or keyboard_check_pressed(ord("D")) or keyboard_check_pressed(ord("W")) or keyboard_check_pressed(ord("S")));