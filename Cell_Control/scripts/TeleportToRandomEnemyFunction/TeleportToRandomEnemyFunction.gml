/// Function to teleport the enemy to a random location around another enemy
function TeleportToRandomEnemy() {
    // Check if there are any enemy instances actually move to
    if (instance_number(obj_enemy) > 0) {
        // Select a random enemy
        var targetEnemy = instance_find(obj_enemy, irandom(instance_number(obj_enemy) - 1));

        // Calculate teleportation position around the target enemy
        var teleportDistance = 30; // Distance from the enemy to appear
        var teleportAngle = random(360);
        var teleportX = targetEnemy.x + lengthdir_x(teleportDistance, teleportAngle);
        var teleportY = targetEnemy.y + lengthdir_y(teleportDistance, teleportAngle);

        // Teleport the enemy
        x = teleportX;
        y = teleportY;
    }
}