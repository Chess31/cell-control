// Drop a random number of items from the loot pool
var numberOfItems = irandom_range(1, 5); // Adjust the range as needed

for (var i = 0; i < numberOfItems; i++) {
    // Randomly select an item from the loot pool
    var randomIndex = irandom(ds_list_size(enemyLootPool) - 1);
    var selectedItem = ds_list_find_value(enemyLootPool, randomIndex);

    // Spawn the selected item at the enemy's position
    instance_create_layer(x + random_range(-10, 10), y + random_range(-10, 10), "Instances", selectedItem);
}

if (global.feeder_active = true){
	//spawn the "soul" particle and move it to the feeder
	var _particle = instance_create_layer(x, y, "Instances", obj_particle);
	_particle.target = global.current_feeder;
}

// Clean up the loot pool
ds_list_destroy(enemyLootPool);

//shake screen
screen_shake(12,30);