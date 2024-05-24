// Health check
if (enemyHealth <= 0) {
    // Destroy the enemy when health reaches zero
    instance_destroy();
}

if (iframes > 0){
	canBeHit = false;
	iframes--;
} else {
	canBeHit = true;
}

image_angle = point_direction(x, y, obj_player.x, obj_player.y) - 90;