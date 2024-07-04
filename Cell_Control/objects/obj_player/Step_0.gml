if (global.frozen = true) {
	exit;
}

if (global.gamemode = 0){
	if (!obj_freeze_controller.bars_explained && ammo != initial_ammo){global.frozen = true; global.tutorial_to_show = 1}
	if (instance_exists(obj_enemy)){
		var	_enemy = instance_nearest(x,y,obj_enemy);
		if (!obj_freeze_controller.enemies_explained && point_distance(x,y,_enemy.x,_enemy.y) < 430){global.frozen = true; global.tutorial_to_show = 2}
	}
	if (instance_exists(obj_well)){
		var	_well = instance_nearest(x,y,obj_well);
		if (!obj_freeze_controller.wells_explained && point_distance(x,y,_well.x,_well.y) < 330){
				global.frozen = true; 
				global.tutorial_to_show = 4; 
				obj_camera.follow = _well;
			}
	}
	if (!obj_freeze_controller.buildmode_explained && isDeployingWall) {global.frozen = true; global.tutorial_to_show = 5}
	if (!obj_freeze_controller.special_explained && weaponTokens != 0) {global.frozen = true; global.tutorial_to_show = 6}
	if (!obj_freeze_controller.upgrader_explained && instance_exists(global.current_upgrader)) {global.frozen = true; global.tutorial_to_show = 7}
}

// Set the player's image angle to the calculated direction
var _player_angle = point_direction(x, y, mouse_x, mouse_y);

//WASD Movement
var _key_left = keyboard_check(ord("A"));
var _key_right = keyboard_check(ord("D"));
var _key_up = keyboard_check(ord("W"));
var _key_down = keyboard_check(ord("S"));

var _input_direction = point_direction(0, 0, _key_right - _key_left, _key_down - _key_up);
var _input_magnitude = (_key_right - _key_left != 0) || (_key_down - _key_up != 0);

hSpeed = lengthdir_x(_input_magnitude * walkSpeed, _input_direction);
vSpeed = lengthdir_y(_input_magnitude * walkSpeed, _input_direction);

//move the player based on movement calculation
move_and_collide(hSpeed, vSpeed, obj_cellWall);

//Make sure the player is in the room bounds
x = min(x, room_width - sprite_width/2);
y = min(y, room_height - sprite_width/2);
x = max(x, sprite_width/2);	//if statements each checking if x/y is greater/less than threshhold, then add or subtracts 1 so it doesn't get stuck
y = max(y, sprite_width/2);

//grid_x = floor(x div 8);
//grid_y = floor(y div 8);

//chunk_x = floor(grid_x div global.chunk_size);
//chunk_y = floor(grid_y div global.chunk_size);

// Shooting logic
if (can_shoot_cooldown <= 0 && can_shoot = true){
	if (mouse_check_button(mb_left) && ammo > 0 && isDeployingWall = false) {
		if (keyboard_check(vk_shift) && keyboard_check(vk_alt)){
			comboWeapon(comboSlot);
		} else if (keyboard_check(vk_shift)){
			shiftWeapon(shiftSlot);
		} else if (keyboard_check(vk_alt)){
			altWeapon(altSlot);
		} else {
			primaryWeapon(primarySlot);
		}
	}
} else {
	can_shoot_cooldown--;
}

//Ability Usage
first_ability_cooldown = max (0, first_ability_cooldown-1);
second_ability_cooldown = max (0, second_ability_cooldown-1);
third_ability_cooldown = max (0, third_ability_cooldown-1);

if (keyboard_check(ord("Q")) and first_ability_cooldown = 0 and array_length(global.upgrades) > 0) {
	var _ability = array_get(global.upgrades,0);
	with (_ability) {
		effect_function(true);
		other.first_ability_cooldown = cooldown;
		if (duration != infinity) { // remove effect after duration
			
			if (!instance_exists(obj_timeline_helper)) { //create the helper and add the ability to a new timeline
				global.tl_ability_durations = timeline_add();
				var _helper = instance_create_layer(0,0,"Instances",obj_timeline_helper);
				with (_helper) {
					timeline_moment_add_script(global.tl_ability_durations, other.duration, other.effect_function);
				}
			} else { //helper already exists so add the ability to the current timeline at the correct moment
				with (obj_timeline_helper) {
					timeline_moment_add_script(global.tl_ability_durations, other.duration + timeline_position, other.effect_function);
				}
			}
		}
	}
}

if (keyboard_check(ord("E")) and second_ability_cooldown = 0 and array_length(global.upgrades) > 1) {
	var _ability = array_get(global.upgrades,1);
	with (_ability) {
		effect_function(true);
		other.second_ability_cooldown = cooldown;
		if (duration != infinity) { // remove effect after duration
			
			if (!instance_exists(obj_timeline_helper)) { //create the helper and add the ability to a new timeline
				global.tl_ability_durations = timeline_add();
				var _helper = instance_create_layer(0,0,"Instances",obj_timeline_helper);
				with (_helper) {
					timeline_moment_add_script(global.tl_ability_durations, other.duration, other.effect_function);
				}
			} else { //helper already exists so add the ability to the current timeline at the correct moment
				with (obj_timeline_helper) {
					timeline_moment_add_script(global.tl_ability_durations, other.duration + timeline_position, other.effect_function);
				}
			}
		}
	}
}

if (keyboard_check(ord("C")) and third_ability_cooldown = 0 and array_length(global.upgrades) > 2) {
	var _ability = array_get(global.upgrades,2);
	with (_ability) {
		effect_function(true);
		other.third_ability_cooldown = cooldown;
		if (duration != infinity) { // remove effect after duration
			
			if (!instance_exists(obj_timeline_helper)) { //create the helper and add the ability to a new timeline
				global.tl_ability_durations = timeline_add();
				var _helper = instance_create_layer(0,0,"Instances",obj_timeline_helper);
				with (_helper) {
					timeline_moment_add_script(global.tl_ability_durations, other.duration, other.effect_function);
				}
			} else { //helper already exists so add the ability to the current timeline at the correct moment
				with (obj_timeline_helper) {
					timeline_moment_add_script(global.tl_ability_durations, other.duration + timeline_position, other.effect_function);
				}
			}
		}
	}
}

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

// Restart the game when the countdown reaches 0
if (restartTimer == 0) {
    game_restart(); // Restart the game
}
	
// Check for Building Placement
if (keyboard_check_pressed(vk_space)) {
    //Toggle Placement Mode
	isDeployingWall = !isDeployingWall;
}

distance_to_core = point_distance(x, y, obj_cell_core.x, obj_cell_core.y);

if (distance_to_core > 550) {
	isDeployingWall = false;
}

// Placement Mode logic
if (isDeployingWall) {
    
	//these are supposed to be flipped because lists are weird
	var _scroll_up = mouse_wheel_up();
	var _scroll_down = mouse_wheel_down();
	
    // Check for cycling through building options
	if (keyboard_check_pressed(ord("Q"))) || (_scroll_up){
		global.currentBuildingIndex = (global.currentBuildingIndex - 1 + ds_list_size(global.buildingTypes)) mod ds_list_size(global.buildingTypes);
	}

	if (keyboard_check_pressed(ord("E"))) || (_scroll_down){
		global.currentBuildingIndex = (global.currentBuildingIndex + 1) mod ds_list_size(global.buildingTypes);
	}

	// Set the Building's position to be in front of the player
    var BuildingX = x + lengthdir_x(32, _player_angle);
    var BuildingY = y + lengthdir_y(32, _player_angle);

    // Check for building placement
	if (mouse_check_button_pressed(mb_left) && ammo >= ds_list_find_value(global.buildingCosts, global.currentBuildingIndex)) {
	    // Create a building instance
	    var _building = instance_create_layer(BuildingX, BuildingY, "Instances", obj_building);
		//set its properties based on the current building type
		_building.index = global.currentBuildingIndex; //store the index for later use in the building itself
		_building.type = ds_list_find_value(global.buildingTypes, global.currentBuildingIndex);
	    _building.buildingHealth = ds_list_find_value(global.buildingHealths, global.currentBuildingIndex);
	    _building.sprite_index = ds_list_find_value(global.buildingSprites, global.currentBuildingIndex);
	    _building.constructionCost = ds_list_find_value(global.buildingCosts, global.currentBuildingIndex);
		_building.image_angle = _player_angle;

		if (ds_list_find_value(global.buildingCount, global.currentBuildingIndex) < ds_list_find_value(global.buildingMaxNumber, global.currentBuildingIndex)) {
		    ds_list_replace(global.buildingCount, global.currentBuildingIndex, ds_list_find_value(global.buildingCount, global.currentBuildingIndex) + 1);
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
	} else if (mouse_check_button_pressed(mb_left)){
		var _warning_text = instance_create_layer(x, y - 30, "Instances", obj_message)
		_warning_text.message_text = "Energy Needed"
	}
}

//Hot Keys for Buildings:
if (keyboard_check_pressed(ord("1"))){global.currentBuildingIndex = 0 mod ds_list_size(global.buildingTypes)};
if (keyboard_check_pressed(ord("2"))){global.currentBuildingIndex = 1 mod ds_list_size(global.buildingTypes)};
if (keyboard_check_pressed(ord("3"))){global.currentBuildingIndex = 2 mod ds_list_size(global.buildingTypes)};
if (keyboard_check_pressed(ord("4"))){global.currentBuildingIndex = 3 mod ds_list_size(global.buildingTypes)};
if (keyboard_check_pressed(ord("5"))){global.currentBuildingIndex = 4 mod ds_list_size(global.buildingTypes)};
if (keyboard_check_pressed(ord("6"))){global.currentBuildingIndex = 5 mod ds_list_size(global.buildingTypes)};