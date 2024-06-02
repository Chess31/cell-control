function save_wall_data(wall) {
    // Script: save_wall_data

	var wall_key = string(wall.x) + "," + string(wall.y);
	var wall_info = ds_map_create();

	ds_map_add(wall_info, "x", wall.x);
	ds_map_add(wall_info, "y", wall.y);
	ds_map_add(wall_info, "buildingHealth", wall.buildingHealth);

	ds_map_add(global.wall_data, wall_key, wall_info);

	instance_destroy(wall);
}

function load_wall_data(){
	// Arguments: x, y
	var _x = argument0;
	var _y = argument1;
	var wall_key = string(_x) + "," + string(_y); //this might be redundant...

	if (ds_map_exists(global.wall_data, wall_key)) {
	    // Retrieve the data directly from the global wall_data map
	    var wall_info = global.wall_data[? wall_key];

	    // Extract individual properties
	    var wall_x = wall_info[? "x"];
	    var wall_y = wall_info[? "y"];
	    var buildingHealth = wall_info[? "buildingHealth"];

	    // Create the wall instance
	    var wall = instance_create_layer(wall_x, wall_y, layer, obj_cellWall);
	    wall.buildingHealth = buildingHealth;

	    // Remove the wall data from the map
	    ds_map_delete(global.wall_data, wall_key);
	    ds_map_destroy(wall_info); // Clean up the temporary map
	}
}





//function Init_chunks() {
//	// Assign existing walls to chunks
//	var _all_walls = [];

//	for (var i = 0; i < instance_number(obj_cellWall); ++i;)
//	{
//	   _all_walls[i] = instance_find(obj_cellWall,i);
//	}
//	//var all_walls = instance_find _all(obj_wall);
//	for (var i = 0; i < array_length(_all_walls); i++) {
//	    var _wall = _all_walls[i];
//		show_debug_message("initial wall data stored")
//	    store_wall_data(_wall);
//	}	
//}