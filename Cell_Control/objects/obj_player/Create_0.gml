ammo = 0; // Initialize ammo
playerHealth = 15; //Initialize player health
playerAlive = true; // Player starts alive
restartTimer = 5 * room_speed; //Initialize the restart timer
isDeployingWall = false; //If the player is building a wall currently
canTeleport = true;

// Player Object - AddAmmo Function
function AddAmmo() {
    ammo += 1; // You can adjust the amount of ammo added per collectible
}

//Take Damage Function
function TakeDamage()
{
	playerHealth -= 1;
}