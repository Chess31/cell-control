//starting position
x = room_width/2; //obj_camera.view_w_half;
y = room_width/2; //obj_camera.view_h_half;

//movement variables
hSpeed = 0;
vSpeed = 0;
walkSpeed = 6.0;

//Define starting variables
ammo = 2500; // Initialize ammo
playerHealth = 1500; //Initialize player health
initialHealth = 15;
weaponTokens = 110;
global.playerAlive = true; // Player starts alive
restartTimer = 5 * room_speed; //Initialize the restart timer
isDeployingWall = false; //If the player is building a wall currently
canTeleport = true;
global.current_upgrader = noone;
can_shoot_cooldown = 15;

//Set Up weapon slots
primarySlot = "primary1"; // default weapon initially
shiftSlot = -1; // No weapon initially
altSlot = -1; // No weapon initially
comboSlot = -1; //test combo

////Arm Variables
//arm_end_x = x;
//arm_end_y = y;
//arm_active = false;
//hook_1 = instance_create_layer(x,y,"Instances",obj_hook);

// AddAmmo Function
function AddAmmo(_amount) {
    ammo += _amount;
}

//Take Damage Function
function TakeDamage(_amount)
{
	playerHealth -= _amount;
}