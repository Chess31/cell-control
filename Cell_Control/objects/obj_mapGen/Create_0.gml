spawn_squares = function() {
	
	instance_destroy(obj_cellWall);
	
	var _spacing = sprite_get_width(s_CellWall);
	for (var col = 0; col < my_map.width; col +=1) {
		for (var row = 0; row < my_map.height; row +=1) {
			if (my_map.map[col][row]) {
				instance_create_layer(col * _spacing, row * _spacing, "Generated_Cell_Walls", obj_cellWall);
			}
		}
	}
}

my_map = new CellularAutomataMap(ceil(room_width / sprite_get_width(s_CellWall)), ceil(room_width / sprite_get_height(s_CellWall)), 0.7, 5, 5);
my_map.iterate(26);
spawn_squares();