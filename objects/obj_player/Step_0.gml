/// @description Insert description here
// You can write your code in this editor
playerMovement();

if (falling == true){
	fall_timer--;
}
if (fall_timer == 0) playerKill();