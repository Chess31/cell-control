if (global.frozen = true or global.isPaused = true) {
	exit;
}

if (global.gamemode = 0){
	if (!obj_freeze_controller.bars_explained && obj_freeze_controller.buildmode_explained){global.frozen = true; global.tutorial_to_show = 1}
	if (instance_exists(obj_enemy)){
		var	_enemy = instance_nearest(x,y,obj_enemy);
		if (!obj_freeze_controller.enemies_explained && point_distance(x,y,_enemy.x,_enemy.y) < 430){global.frozen = true; global.tutorial_to_show = 2}
	}
	if (instance_exists(obj_well)){
		var	_well = instance_nearest(x,y,obj_well);
		if (!obj_freeze_controller.wells_explained && point_distance(x,y,_well.x,_well.y) < 430) {
				global.frozen = true; 
				global.tutorial_to_show = 4; 
				obj_camera.follow = _well;
		}
	}
	if (!obj_freeze_controller.buildmode_explained && isDeployingWall) {global.frozen = true; global.tutorial_to_show = 5}
	if (!obj_freeze_controller.corepower_explained && obj_freeze_controller.bars_explained) {global.frozen = true; global.tutorial_to_show = 7}
	if (!obj_freeze_controller.bossdrops_explained && instance_exists(obj_target_key)) {global.frozen = true; global.tutorial_to_show = 6}
	
	if (instance_exists(obj_enemy_green)) {
		var _nearest_green = instance_nearest(x,y,obj_enemy_green);
		if (!obj_freeze_controller.green_explained and point_distance(x,y,_nearest_green.x,_nearest_green.y) < 430) {
			global.frozen = true;
			global.tutorial_to_show = 8;
		}
	}
	if (instance_exists(obj_enemy_purple)) {
		var _nearest_purple = instance_nearest(x,y,obj_enemy_purple);
		if (!obj_freeze_controller.purple_explained and point_distance(x,y,_nearest_purple.x,_nearest_purple.y) < 430) {
			global.frozen = true;
			global.tutorial_to_show = 9;
		}
	}
}

// Set the player's image angle to the calculated direction
var _player_angle = point_direction(x, y, mouse_x, mouse_y);

//WASD Movement
var _key_left = keyboard_check(ord("A"));
var _key_right = keyboard_check(ord("D"));
var _key_up = keyboard_check(ord("W"));
var _key_down = keyboard_check(ord("S"));
var _key_slow = keyboard_check(vk_shift);

var _input_direction = point_direction(0, 0, _key_right - _key_left, _key_down - _key_up);
var _input_magnitude = (_key_right - _key_left != 0) || (_key_down - _key_up != 0);

hSpeed = lengthdir_x(_input_magnitude * walkSpeed, _input_direction);
vSpeed = lengthdir_y(_input_magnitude * walkSpeed, _input_direction);

if (_key_slow) {
	hSpeed = hSpeed * 0.5;
	vSpeed = vSpeed * 0.5;
}

//move the player based on movement calculation
move_and_collide(hSpeed, vSpeed, obj_cellWall);

//Make sure the player is in the room bounds
x = min(x, room_width - sprite_width/2);
y = min(y, room_height - sprite_width/2);
x = max(x, sprite_width/2);	//if statements each checking if x/y is greater/less than threshhold, then add or subtracts 1 so it doesn't get stuck
y = max(y, sprite_width/2);

// Health check
if (playerHealth <= 0) {
	if (global.gamemode = 0) {
		if (!obj_freeze_controller.death_explained){
			global.tutorial_to_show = 3;
			global.frozen = true;
		}
	}
    // Start the restart countdown timer
	global.playerAlive = false;
	if (current_time mod 5 = 0) {
		SparkParticles();
	}
	x += irandom_range(-3,3);
	y += irandom_range(-3,3);
}

// Countdown logic
if (restartTimer > 0) and (global.playerAlive = false) {
    restartTimer -= 1;
}

// Restart the player when the countdown reaches 0
if (restartTimer == 0) {
    x = obj_cell_core.x;
	y = obj_cell_core.y;
	global.playerAlive = true;
	playerHealth = initialHealth;
	ammo = initial_ammo;
	restartTimer = 3 * game_get_speed(gamespeed_fps);
	obj_cell_core.cellHealth--;
}

// Check for Building Placement
if (keyboard_check_pressed(vk_space)) {
    //Toggle Placement Mode
	isDeployingWall = !isDeployingWall;
	obj_buildings_hotbar.menu_up = isDeployingWall;
}

//distance_to_core = point_distance(x, y, obj_cell_core.x, obj_cell_core.y);

//if (distance_to_core > 750) {
//	isDeployingWall = false;
//	obj_buildings_hotbar.menu_up = false;
//}

// Placement Mode logic
if (isDeployingWall) {
	//set sprite to not have a weapon
	image_index = 0;
	//these are supposed to be flipped because lists are weird
	var _scroll_up = mouse_wheel_up();
	var _scroll_down = mouse_wheel_down();
	
    // Check for cycling through building options
	if (keyboard_check_pressed(ord("Q"))) || (_scroll_up){
		current_building_index = (current_building_index - 1 + array_length(available_buildings)) mod array_length(available_buildings);
	}

	if (keyboard_check_pressed(ord("E"))) || (_scroll_down){
		current_building_index = (current_building_index + 1) mod array_length(available_buildings);
	}

	// Set the Building's position to be in front of the player
    var BuildingX = x + lengthdir_x(32, _player_angle);
    var BuildingY = y + lengthdir_y(32, _player_angle);

    // Check for building placement
	var _global_list_index = available_buildings[current_building_index];
	global_index = _global_list_index;
	if (mouse_check_button_pressed(mb_left) && ammo >= ds_list_find_value(global.building_costs, _global_list_index) and get_mouse_on_button() = false) {
	    // Create a building instance
	    var _building = instance_create_layer(BuildingX, BuildingY, "Instances", obj_building);
		//set its properties based on the current building type
		_building.index = _global_list_index; //store the index for later use in the building itself
		_building.type = ds_list_find_value(global.building_types, _global_list_index);
	    _building.buildingHealth = ds_list_find_value(global.building_healths, _global_list_index);
	    _building.sprite_index = ds_list_find_value(global.building_sprites, _global_list_index);
	    _building.constructionCost = ds_list_find_value(global.building_costs, _global_list_index);
		_building.image_angle = _player_angle;

		if (ds_list_find_value(global.building_count, _global_list_index) < ds_list_find_value(global.building_max_number, _global_list_index)) {
		    ds_list_replace(global.building_count, _global_list_index, ds_list_find_value(global.building_count, _global_list_index) + 1);
			AddAmmo(-_building.constructionCost);
			var _warning_text = instance_create_layer(x, y - 50, "Instances", obj_message)
			_warning_text.message_text = "-" + string(_building.constructionCost);
			
			//if it is a special building store its id
			if (_building.type = "Upgrader"){
				global.current_upgrader = _building.id;	
			} else if (_building.type = "Feeder"){
				global.feeder_active = true;
				global.current_feeder = _building.id;
			}
			
		} else {
		    // Show a message about which building 
		    var _warning_text = instance_create_layer(x, y - 30, "Instances", obj_message)
			_warning_text.message_text = "Maximum " + string(_building.type) + "s Built!"
			
			//there are too many buildings so remove the one that was just created
			instance_destroy(_building);
		}
	} else if (mouse_check_button_pressed(mb_left) and get_mouse_on_button() = false){
		var _warning_text = instance_create_layer(x, y - 30, "Instances", obj_message)
		_warning_text.message_text = "Energy Needed"
	}
} else { //gun mode logic
	//these are supposed to be flipped because lists are weird
	var _scroll_up = mouse_wheel_up();
	var _scroll_down = mouse_wheel_down();
	
    // Check for cycling through building options
	if (_scroll_up){
		current_weapon_index = (current_weapon_index - 1 + array_length(available_weapons)) mod array_length(available_weapons);
	}

	if (_scroll_down){
		current_weapon_index = (current_weapon_index + 1) mod array_length(available_weapons);
	}
	
	//get weapon index from the list based on scroll wheel index
	image_index = available_weapons[current_weapon_index] + 1;
	
	// Shooting logic
	if (can_shoot_cooldown <= 0 && can_shoot = true and get_mouse_on_button() = false){
		if (mouse_check_button(mb_left) && ammo > 0) {
			use_weapon(available_weapons[current_weapon_index]);
		}
	} else {
		can_shoot_cooldown--;
	}
}

////Hot Keys for Buildings:
//if (keyboard_check_pressed(ord("1"))){global.currentBuildingIndex = 0 mod ds_list_size(global.buildingTypes)};
//if (keyboard_check_pressed(ord("2"))){global.currentBuildingIndex = 1 mod ds_list_size(global.buildingTypes)};
//if (keyboard_check_pressed(ord("3"))){global.currentBuildingIndex = 2 mod ds_list_size(global.buildingTypes)};
//if (keyboard_check_pressed(ord("4"))){global.currentBuildingIndex = 3 mod ds_list_size(global.buildingTypes)};
//if (keyboard_check_pressed(ord("5"))){global.currentBuildingIndex = 4 mod ds_list_size(global.buildingTypes)};
//if (keyboard_check_pressed(ord("6"))){global.currentBuildingIndex = 5 mod ds_list_size(global.buildingTypes)};