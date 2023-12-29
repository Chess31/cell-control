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

	//removed _player_direction = point_direction (x,y,mouseX,mouseY) because it was redundant

	// Set the Building's position to be in front of the player
    var BuildingX = x + lengthdir_x(32, image_angle);
    var BuildingY = y + lengthdir_y(32, image_angle);

    // Check for building placement
	if (mouse_check_button_pressed(mb_left) && ammo >= ds_list_find_value(global.buildingCosts, global.currentBuildingIndex)) {
	    // Create a building instance based on the current building type
	    var _building = instance_create_layer(BuildingX, BuildingY, "Instances", obj_building);
		//set its properties
		_building.index = global.currentBuildingIndex;
		_building.type = ds_list_find_value(global.buildingTypes, global.currentBuildingIndex);
	    _building.buildingHealth = ds_list_find_value(global.buildingHealths, global.currentBuildingIndex);
	    _building.sprite_index = ds_list_find_value(global.buildingSprites, global.currentBuildingIndex);
	    _building.constructionCost = ds_list_find_value(global.buildingCosts, global.currentBuildingIndex);
		_building.image_angle = image_angle;
		//obj_player.AddAmmo(-_building.constructionCost);
 
		if (ds_list_find_value(global.buildingCount, global.currentBuildingIndex) < ds_list_find_value(global.buildingMaxNumber, global.currentBuildingIndex)) {
		        ds_list_replace(global.buildingCount, global.currentBuildingIndex, ds_list_find_value(global.buildingCount, global.currentBuildingIndex) + 1); //this never gets removed!!! need to fix with the unused funtion in the create event
				obj_player.AddAmmo(-_building.constructionCost);
		    } else {
				//there are too many buildings so remove the one that was just created
				instance_destroy(_building);
		        // Show a message or take other actions if the limit is reached
		        show_max_built_message = true;
		    }
		// Increment building count when a building is placed
		//var buildingType = ds_list_find_value(global.buildingTypes, global.currentBuildingIndex);
		
		
		//var maxBuildingCount;

		//// Set specific limits for each building type
		//switch (_building.type) {
		//    case "Wall":
		//        maxBuildingCount = 30;
		//        break;
		//    case "Turret":
		//        maxBuildingCount = 15;
		//        break;
		//	case "Forge":
		//        maxBuildingCount = 10;
		//        break;
		//	case "Upgrader":
		//        maxBuildingCount = 1;
		//        break;
		//	case "Proximity Mine":
		//        maxBuildingCount = 5;
		//        break;
		//    default:
		//        maxBuildingCount = 10;  // Default limit if not specified for a type
		//}
		
		//if (!ds_map_exists(global.buildingCounts, _building.type)) {
		//    // If building type doesn't exist in the map, initialize it with a count of 1
		//    ds_map_add(global.buildingCounts, _building.type, 1);
		//	obj_player.AddAmmo(-_building.constructionCost);
		//} else {
		//    // Increment the count for the existing building type
		//    var currentCount = ds_map_find_value(global.buildingCounts, _building.type);
    
		    
		//}
		
		//// Check for collisions with existing buildings
		//with (_building){
		//	var _collision_with_existing_building = place_meeting(x, y, obj_building);
		//	if(_collision_with_existing_building){
		//		instance_destroy(_building);
		//		show_debug_message("tried to place building");
		//	} else{
		//		// Decrease ammo based on construction cost
		//		obj_player.AddAmmo(-_building.constructionCost);
		//	}
		//}
	}
}