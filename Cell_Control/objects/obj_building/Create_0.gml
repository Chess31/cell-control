// obj_building initial variables
index = -1;
type = "";
buildingHealth = 25;
constructionCost = 5;
maxBuildingCount = 1;

//Turret specific variables
maxDetectionRange = 300;
turretBulletSpeed = 6;
fireTimer = 0;
firingRate = game_get_speed(gamespeed_fps) / 3;

//Upgrader specific variables
interactionRange = 100;
playerInRange = false;

//Proximity Mine specific variables
explosionRadius = 64;
rotationSpeed = 1;
rotationAngle = 0;
primed = false;

//Feeder specific variables
enemies_defeated = 0;

//Hive specific variables
ammo = 0;
//interactionRange is used from the upgrader
drone_mode = "collecting";
my_drones = 0;
my_drone_capacity = 25;
max_drones = 1;