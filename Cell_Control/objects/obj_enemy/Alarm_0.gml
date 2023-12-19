/// @description Assign Loot Tables

//Set up loot pools
switch (enemyType){
	case "Red":
		enemyLootPool = ds_list_create();
		ds_list_add(enemyLootPool, obj_collectible); // Add collectible to loot pool
		//show_debug_message("loot list created");
		break;
	
	case "Blue":
		enemyLootPool = ds_list_create();
		ds_list_add(enemyLootPool, obj_collectible); // Add collectible to loot pool
		//show_debug_message("loot list created");
		break;
		
	case "Green":
		enemyLootPool = ds_list_create();
		ds_list_add(enemyLootPool, obj_collectible); // Add collectible to loot pool
		//show_debug_message("loot list created");
		break;
		
	default:
		//default code
		break;
}