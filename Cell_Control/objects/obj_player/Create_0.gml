//starting position
x = room_width/2;
y = room_width/2;

//movement variables
hSpeed = 0;
vSpeed = 0;
walkSpeed = 6.0;

//grid_x = -1;
//grid_y = -1;
//chunk_x = -1;
//chunk_y = -1;

//Define starting variables
ammo = 10; // Initialize ammo
playerHealth = 15; //Initialize player health
initialHealth = 15;
weaponTokens = 0;
global.playerAlive = true; // Player starts alive
restartTimer = 3 * room_speed; //Initialize the restart timer
isDeployingWall = false; //If the player is building a wall currently
//canTeleport = true;
global.current_upgrader = noone;
can_shoot_cooldown = 15;
can_shoot = true;
distance_to_core = 0;

//Set Up weapon slots
primarySlot = "primary1"; // default weapon initially
shiftSlot = -1; // No weapon initially
altSlot = -1; // No weapon initially
comboSlot = -1; //test combo

// AddAmmo Function
function AddAmmo(_amount) {
    ammo += _amount;
}

//Take Damage Function
function TakeDamage(_amount)
{
	playerHealth -= _amount;
}