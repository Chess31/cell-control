// Destroy the bullet when it goes off-screen
if (x < 0 || y < 0 || x > room_width || y > room_height) {
    instance_destroy();
}

// Check for collision with enemies and destroy them
if (place_meeting(x, y, obj_enemy)) {
    var enemy = instance_place(x, y, obj_enemy);
    instance_destroy();
    enemy.TakeDamage(damage); // You need to define a TakeDamage function in the enemy object
}