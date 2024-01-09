//starting position
x = obj_camera.view_w_half;
y = obj_camera.view_h_half;

//movement variables
hSpeed = 0;
vSpeed = 0;
walkSpeed = 6.0;

//Define starting variables
ammo = 100000; // Initialize ammo
playerHealth = 150000; //Initialize player health
global.playerAlive = true; // Player starts alive
restartTimer = 5 * room_speed; //Initialize the restart timer
isDeployingWall = false; //If the player is building a wall currently
canTeleport = true;
global.current_upgrader = noone;

//Set Up weapon slots
primarySlot = "primary1"; // default weapon initially
shiftSlot = -1; // No weapon initially
altSlot = -1; // No weapon initially

// AddAmmo Function
function AddAmmo(_amount) {
    ammo += _amount;
}

//Take Damage Function
function TakeDamage(_amount)
{
	playerHealth -= _amount;
}