if (global.frozen = true) {
	exit;
}

//Check for enemy bullet collisions
var bulletCollided = instance_place(x, y, obj_enemy_bullet);
if (bulletCollided != noone) {
	if (bulletCollided.damage > 0){
		cellHealth -= 1;
		cellHealth = max(cellHealth,0)
	}
	image_index++;
    instance_destroy(bulletCollided); // Destroy the enemy bullet
}

// Defeat logic
if (cellHealth = 0) {
	image_speed = 3;
	cellHealth = -1;
	alarm[0] = 3 * game_get_speed(gamespeed_fps);
    obj_player.playerHealth -= 1; // Restart the game
}

// Check if the core can create a new rift
if (ds_list_size(global.rift_types) > 0) {
	rift_cooldown--;
	if (rift_cooldown <= 0) {
		var _pos = irandom(ds_list_size(global.rift_types) - 1)
	    var _rift_type = ds_list_find_value(global.rift_types,_pos); 
		var _dist = irandom_range(100,create_rift_radius);
		var _dir = irandom(360);
	    var _rift_x = lengthdir_x(_dist,_dir);
	    var _rift_y = lengthdir_y(_dist,_dir);
	    instance_create_layer(x + _rift_x, y + _rift_y, "Instances", _rift_type);
    
	    rift_cooldown = 500; // Reset cooldown
	}
}

//Hold to heal logic
if (button_down_count >= room_speed * 2){
	cellHealth = maxHealth;
	with (obj_player) {ammo = 0;}
	button_down_count = 0;
	image_index = 0;
	var _warning_text = instance_create_layer(obj_player.x, obj_player.y - 30, "Instances", obj_message)
	_warning_text.message_text = "~ Core Healed ~"
	_warning_text.text_color = c_aqua;
}

if (keyboard_check(ord("R")) and obj_player.ammo >= min_to_heal){
	button_down_count ++;
} else {
	button_down_count = 0;
}

if (keyboard_check_pressed(ord("R")) and obj_player.ammo >= min_to_heal){
	var _warning_text = instance_create_layer(obj_player.x, obj_player.y - 30, "Instances", obj_message)
	_warning_text.message_text = "Hold R to heal the Core!"
} else if (keyboard_check_pressed(ord("R"))) {
	var _warning_text = instance_create_layer(obj_player.x, obj_player.y - 30, "Instances", obj_message)
	_warning_text.message_text = "minimum energy (" + string(min_to_heal) + ") not met"
}

if (draw_time < 30) {
	draw_alpha = lerp(draw_alpha, 0, 0.02);
} else {
	draw_alpha = 1;
}