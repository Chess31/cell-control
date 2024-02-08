// Set the player's image angle to the calculated direction
image_angle = point_direction(x, y, mouse_x, mouse_y);

//WASD Movement
var _key_left = keyboard_check(ord("A"));
var _key_right = keyboard_check(ord("D"));
var _key_up = keyboard_check(ord("W"));
var _key_down = keyboard_check(ord("S"));

var _input_direction = point_direction(0, 0, _key_right - _key_left, _key_down - _key_up);
var _input_magnitude = (_key_right - _key_left != 0) || (_key_down - _key_up != 0);

hSpeed = lengthdir_x(_input_magnitude * walkSpeed, _input_direction);
vSpeed = lengthdir_y(_input_magnitude * walkSpeed, _input_direction);

//x += hSpeed;
//y += vSpeed;

//move the player based on movement calculation
move_and_collide(hSpeed, vSpeed, obj_cellWall);

// Shooting logic
if (mouse_check_button_pressed(mb_left) && ammo > 0 && isDeployingWall = false) {
	if (keyboard_check(vk_shift) && keyboard_check(vk_alt)){
		comboWeapon(-1);
	} else if (keyboard_check(vk_shift)){
		shiftWeapon(shiftSlot);
	} else if (keyboard_check(vk_alt)){
		altWeapon(altSlot);
	} else {
		primaryWeapon(primarySlot);
	}
}

// Health check
if (playerHealth <= 0) {
    // Start the countdown timer
	global.playerAlive = false;
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
    var BuildingX = x + lengthdir_x(32, image_angle);
    var BuildingY = y + lengthdir_y(32, image_angle);

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
		_building.image_angle = image_angle;

		if (ds_list_find_value(global.buildingCount, global.currentBuildingIndex) < ds_list_find_value(global.buildingMaxNumber, global.currentBuildingIndex)) {
		    ds_list_replace(global.buildingCount, global.currentBuildingIndex, ds_list_find_value(global.buildingCount, global.currentBuildingIndex) + 1);
			AddAmmo(-_building.constructionCost);
			
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
	}
}

//Hot Keys for Buildings:
if (keyboard_check_pressed(ord("1"))){global.currentBuildingIndex = 0 mod ds_list_size(global.buildingTypes)};
if (keyboard_check_pressed(ord("2"))){global.currentBuildingIndex = 1 mod ds_list_size(global.buildingTypes)};
if (keyboard_check_pressed(ord("3"))){global.currentBuildingIndex = 2 mod ds_list_size(global.buildingTypes)};
if (keyboard_check_pressed(ord("4"))){global.currentBuildingIndex = 3 mod ds_list_size(global.buildingTypes)};
if (keyboard_check_pressed(ord("5"))){global.currentBuildingIndex = 4 mod ds_list_size(global.buildingTypes)};
if (keyboard_check_pressed(ord("6"))){global.currentBuildingIndex = 5 mod ds_list_size(global.buildingTypes)};