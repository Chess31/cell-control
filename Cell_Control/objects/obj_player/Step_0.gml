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

x += hSpeed;
y += vSpeed;

// Shooting logic
if (mouse_check_button_pressed(mb_left) && ammo > 0 && isDeployingWall = false) {
	if (keyboard_check(vk_shift) && keyboard_check(vk_alt)){
		comboWeapon(-1);
	} else if (keyboard_check(vk_shift)){
		shiftWeapon(-1);
	} else if (keyboard_check(vk_alt)){
		altWeapon(-1);
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
    
	var _scroll_up = mouse_wheel_down();
	var _scroll_down = mouse_wheel_up();
	
    // Check for cycling through building options
	if (keyboard_check_pressed(ord("Q"))) || (_scroll_up){
    global.currentBuildingIndex = (global.currentBuildingIndex - 1 + ds_list_size(global.buildingTypes)) mod ds_list_size(global.buildingTypes);
	}

	if (keyboard_check_pressed(ord("E"))) || (_scroll_down){
    global.currentBuildingIndex = (global.currentBuildingIndex + 1) mod ds_list_size(global.buildingTypes);
	}

	// Get the direction towards the mouse
	var playerDirection = point_direction(x, y, mouse_x, mouse_y);

	// Set the Building's position to be in front of the player
    var BuildingX = x + lengthdir_x(32, playerDirection);
    var BuildingY = y + lengthdir_y(32, playerDirection);

	// Check for collisions with existing buildings
    var _collision = instance_place(BuildingX, BuildingY, obj_building);

    // Check for building placement
	if (mouse_check_button_pressed(mb_left) && ammo >= ds_list_find_value(global.buildingCosts, global.currentBuildingIndex) && !_collision) {
	    // Create a building object based on the current building type
	    var building = instance_create_layer(BuildingX, BuildingY, "Instances", obj_building);

	    // Check if the creation was successful before setting properties
	    if (instance_exists(building)) {
	        building.type = ds_list_find_value(global.buildingTypes, global.currentBuildingIndex);
	        building.buildingHealth = ds_list_find_value(global.buildingHealths, global.currentBuildingIndex);
	        building.sprite_index = ds_list_find_value(global.buildingSprites, global.currentBuildingIndex);
	        building.constructionCost = ds_list_find_value(global.buildingCosts, global.currentBuildingIndex);
			//Set image angle
			building.image_angle = playerDirection;
	        // Decrease ammo based on construction cost
	        ammo -= building.constructionCost;
			// Enable precise collision checking for this instance
			building.mask_index = building.sprite_index;
	    }
	}
}