move_x = keyboard_check(vk_right) - keyboard_check(vk_left);
move_x *= move_speed;


if (place_meeting(x, y+2, obj_ground))
{
	move_y = 0;
	jumptime=2;

}
	if (keyboard_check_pressed(vk_space)&&jumptime!=0){
		jumptime-=1;
	move_y = -jump_speed;
	}
	
else if (move_y < 10) move_y += 1;

move_and_collide(move_x, move_y, obj_ground);

if (move_x != 0) image_xscale = sign(move_x);

if (move_y>max_vspeed){move_y=max_vspeed;}







