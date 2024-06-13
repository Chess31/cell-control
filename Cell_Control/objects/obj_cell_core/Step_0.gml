//Check for enemy bullet collisions
var bulletCollided = instance_place(x, y, obj_enemy_bullet);
if (bulletCollided != noone) {
    cellHealth -= 1;
	image_index++;
    instance_destroy(bulletCollided); // Destroy the enemy bullet
}

// Defeat logic
if (cellHealth <= 0) {
	image_speed = 3;
    global.playerAlive = false; // Restart the game
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