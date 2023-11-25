// Define the speed at which the object follows the mouse
var followSpeed = 0.1; // You can adjust this value to control the lag effect

// Get the mouse coordinates
var mouseX = mouse_x;
var mouseY = mouse_y;

// Calculate the distance to the mouse
var distanceToMouseX = mouseX - x;
var distanceToMouseY = mouseY - y;

// Get the direction towards the mouse
var playerDirection = point_direction(x, y, mouse_x, mouse_y);

// Set the player's image angle to the calculated direction
image_angle = playerDirection;

// Move the object towards the mouse using interpolation
if(mouse_check_button(mb_right))
{
	x += distanceToMouseX * followSpeed;
	y += distanceToMouseY * followSpeed;
}

// Shooting logic
if (mouse_check_button_pressed(mb_left) && ammo > 0 && isDeployingWall = false) {
   // Create a bullet object instance
   var bullet = instance_create_layer(x, y, "Instances", obj_bullet);

   // Set the bullet's direction and speed
   bullet.direction = point_direction(x, y, mouse_x, mouse_y);
   bullet.speed = 8; // Adjust the bullet speed as needed

   // Subtract ammo
   ammo -= 1;
}

//Taking Damage
function TakeDamage()
{
	playerHealth -= 1;
}

// Health check
if (playerHealth <= 0) {
    // Start the countdown timer
	playerAlive = false;
	//instance_destroy();
}

// Countdown logic
if (restartTimer > 0) and (playerAlive = false) {
    restartTimer -= 1;
}

// Restart the game when the countdown reaches 0
if (restartTimer == 0) {
    game_restart(); // Restart the game
}
	
	
	
	
// Check for Ability Usage
if (keyboard_check_pressed(ord("W"))) {
    //Toggle Placement Mode
	isDeployingWall = !isDeployingWall;
}

// Placement Mode logic
if (isDeployingWall) {
    // Set the wall's position to be in front of the player
    var BuildingX = x + lengthdir_x(32, playerDirection);
    var BuildingY = y + lengthdir_y(32, playerDirection);

    // Check for confirmation (left mouse button)
    if (mouse_check_button_pressed(mb_left) && ammo >= wallCost) {
        // Create a wall object
        var Building = instance_create_layer(BuildingX, BuildingY, "Instances", obj_wall);
        Building.image_angle = playerDirection; // Set the wall's direction
		ammo -= wallCost;
    }
}

	
	
	
	
	
	
	
	
