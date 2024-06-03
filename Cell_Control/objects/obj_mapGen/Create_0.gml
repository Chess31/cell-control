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
	for (var _x = 0; _x < array_length(global.grid); _x++) {
	    for (var _y = 0; _y < array_length(global.grid[0]); _y++) {
	        if (global.grid[_x][_y] == 1) {
	            instance_create_layer(_x * 8, _y * 8, "Instances", obj_cellWall);
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

// Create objects based on the final grid
create_wall_instances();