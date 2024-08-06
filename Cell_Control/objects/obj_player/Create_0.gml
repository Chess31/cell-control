//starting position
x = room_width/2;
y = room_width/2;

//movement variables
hSpeed = 0;
vSpeed = 0;
walkSpeed = 7.0;

//grid_x = -1;
//grid_y = -1;
//chunk_x = -1;
//chunk_y = -1;

//Define starting variables
ammo = 15;
initial_ammo = 10;
playerHealth = 15;
initialHealth = 15;
weaponTokens = 0;
upgrade_parts = 0;
global.playerAlive = true; // Player starts alive
restartTimer = 3 * game_get_speed(gamespeed_fps);
isDeployingWall = false; //If the player is building a wall currently
player_color = c_white;
global.damage_mod = 0;
global.bullet_speed_mod = 0;
global.primary_bullet_discount = 0;

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

//Upgrades
global.upgrades = [];
ability_cooldown = array_create(3,0);