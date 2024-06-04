function generate_walls() {
	// Grid dimensions
	var gridWidth = room_width/sprite_get_width(s_CellWall);
	var gridHeight = room_height/sprite_get_height(s_CellWall);

	// Probability of initial wall (0 to 100)
	var wallProbability = 45;

	// Create a 2D array to represent the grid
	global.grid = array_create(gridWidth);
	for (var _x = 0; _x < gridWidth; _x++) {
	    global.grid[_x] = array_create(gridHeight);
	    for (var _y = 0; _y < gridHeight; _y++) {
	        if (random(100) < wallProbability) {
	            global.grid[_x][_y] = 1; // Wall
	        } else {
	            global.grid[_x][_y] = 0; // Empty space
	        }
	    }
	}
}

function apply_generation_rules() {
	// Copy the current grid to apply rules
	var newGrid = array_create(array_length(global.grid));
	for (var _x = 0; _x < array_length(global.grid); _x++) {
	    newGrid[_x] = array_create(array_length(global.grid[0]));
	    for (var _y = 0; _y < array_length(global.grid[0]); _y++) {
	        var wallCount = 0;
	        // Count surrounding walls
	        for (var dx = -1; dx <= 1; dx++) {
	            for (var dy = -1; dy <= 1; dy++) {
	                if (dx == 0 && dy == 0) continue; // Skip the current cell
	                var nx = _x + dx;
	                var ny = _y + dy;
	                if (nx >= 0 && ny >= 0 && nx < array_length(global.grid) && ny < array_length(global.grid[0])) {
	                    wallCount += global.grid[nx][ny];
	                } else {
	                    wallCount++; // Treat out-of-bounds cells as walls
	                }
	            }
	        }

	        // Apply rules
	        if (global.grid[_x][_y] == 1) {
	            // Current cell is a wall
	            if (wallCount >= 4) {
	                newGrid[_x][_y] = 1;
	            } else {
	                newGrid[_x][_y] = 0;
	            }
	        } else {
	            // Current cell is empty
	            if (wallCount >= 5) {
	                newGrid[_x][_y] = 1;
	            } else {
	                newGrid[_x][_y] = 0;
	            }
	        }
	    }
	}
	
	// Copy the new grid back to the global grid
	for (var _x = 0; _x < array_length(global.grid); _x++) {
	    for (var _y = 0; _y < array_length(global.grid[0]); _y++) {
	        global.grid[_x][_y] = newGrid[_x][_y];
	    }
	}
}

function create_wall_instances() {
	// Calculate the number of chunks in both dimensions
	var chunkCountX = ceil(array_length(global.grid) / global.chunk_size);
	var chunkCountY = ceil(array_length(global.grid[0]) / global.chunk_size);

	// Initialize global.chunk_data as a list of lists
	global.chunk_data = array_create(chunkCountX);
	for (var cx = 0; cx < chunkCountX; cx++) {
	    global.chunk_data[cx] = array_create(chunkCountY);
	    for (var cy = 0; cy < chunkCountY; cy++) {
	        global.chunk_data[cx][cy] = ds_list_create();
	    }
	}

	// Instantiate objects and store their IDs in the appropriate chunks
	for (var _x = 0; _x < array_length(global.grid); _x++) {
	    for (var _y = 0; _y < array_length(global.grid[0]); _y++) {
	        if (global.grid[_x][_y] == 1) {
	            // Create the wall object
	            var wall_id = instance_create_layer(_x * 8, _y * 8, "Instances", obj_cellWall);
            
	            // Determine which chunk this cell belongs to
	            var chunkX = _x div global.chunk_size;
	            var chunkY = _y div global.chunk_size;
            
	            // Add the wall object's ID to the corresponding chunk's list
	            ds_list_add(global.chunk_data[chunkX][chunkY], wall_id);
	        }
	    }
	}
}

// Initialize the grid
generate_walls();

// Run the cellular automata rules multiple times to smooth out the cave
for (var i = 0; i < 8; i++) {
    apply_generation_rules();
}

// Create objects based on the final grid and assign them to chunks
global.chunk_size = 16; //size in wall blocks
global.chunk_data = ds_list_create();
create_wall_instances(); //do this once and assign walls to chunks here
deactivate_all_chunks(); //start with chunks off