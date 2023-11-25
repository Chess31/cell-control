// Destroy the bullet when it goes off-screen
if (x < 0 || y < 0 || x > room_width || y > room_height) {
    instance_destroy();
}

// Check for collision with enemies and destroy them
if (place_meeting(x, y, obj_player)) {
    instance_destroy();
    obj_player.TakeDamage();
}