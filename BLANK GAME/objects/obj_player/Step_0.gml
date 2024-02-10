//Movement
move_x = keyboard_check(vk_right) - keyboard_check(vk_left);
move_x *= move_speed;


//Dead condition
if (y > room_height) {
    room_goto(rm_gameover);
}

//Solve double jump
if (place_meeting(x, y+2, obj_ground))
{
	move_y = 0;
	jumptime=2;

}
	if (keyboard_check_pressed(vk_space)&&jumptime!=0){
	if(jumptime=2){
	audio_play_sound(snd_player_jump_press,8,false);
	}
	if(jumptime=1){
		audio_play_sound(snd_player_jump_release2,8,false);
	}
		jumptime-=1;
	move_y = -jump_speed;
	}
	
	if (keyboard_check_released(vk_space)&&(y<=-1)){
			move_y=move_y/3;
	}
	
else if (move_y < 10) move_y += 1;

move_and_collide(move_x, move_y, obj_ground);

if (move_x != 0) image_xscale = sign(move_x);

if (move_y>max_vspeed){move_y=max_vspeed;}


//Player sprite status
if (keyboard_check(vk_right) or keyboard_check(vk_left)){
sprite_index=spr_player_run;
}

else if (keyboard_check(vk_space) or move_y<0){
sprite_index=spr_player_jump;
}

else if (move_y>=0){ 
	sprite_index=spr_player_fall;
	}

else{
	sprite_index=spr_player_idle;
}


//Solve bullet gen
if (keyboard_check_pressed(ord("Z"))&&can_shoot){
audio_play_sound(snd_shooting,8,false);
var _bullet = instance_create_depth(obj_player.x,obj_player.y,2,obj_bullet);
_bullet.speed=25;
_bullet.direction=point_direction(0,0,image_xscale,0);
_bullet.image_angle=_bullet.direction;
can_shoot=false;
alarm[0]=15;
}








