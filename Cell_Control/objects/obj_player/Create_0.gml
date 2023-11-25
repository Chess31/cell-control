ammo = 0; // Initialize ammo
playerHealth = 5; //Initialize player health
playerAlive = true; // Player starts alive
restartTimer = 5 * room_speed; //Initialize the restart timer
isDeployingWall = false; //If the player is building a wall currently

// Player Object - AddAmmo Function
function AddAmmo() {
    ammo += 1; // You can adjust the amount of ammo added per collectible
}

//Building Prices
wallCost = 5