// Inherit the parent event
event_inherited();

// Check distance to player
var dist_to_player = point_distance(x, y, obj_player.x, obj_player.y);
    
// If the player is within the radius and the cooldown has finished
if (dist_to_player <= radius && spawn_timer <= 0) {
    // Spawn a pack of 3 enemies
    for (var i = 0; i < 3; i++) {
        // Randomize spawn positions slightly around the spawner
        var spawn_x = x + irandom_range(-20, 20);
        var spawn_y = y + irandom_range(-20, 20);
            
        // Create the enemy instance
		var _enemy = choose(obj_enemy_red, obj_enemy_blue);
        var _summon = instance_create_layer(spawn_x, spawn_y, layer, _enemy);
		_summon.target = obj_player;
    }
    
	//show message
	var _warning_text = instance_create_layer(x, y - 50, "UI", obj_message);
	_warning_text.message_text = "Player Seen! Must Defend";
	
    // Reset the spawn timer to start cooldown
    spawn_timer = spawn_cooldown;
}

// Countdown the spawn timer if it's above 0
if (spawn_timer > 0) {
    spawn_timer--;
}