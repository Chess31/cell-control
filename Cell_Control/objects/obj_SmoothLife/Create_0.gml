						//Game of Life
						//// Define grid size
						//grid_width = 200//room_width/2;
						//grid_height = 200//room_height/2;
						//cell_size = 10; // Size of each cell in pixels

						//// Create grid
						//for (var _x = 0; _x < grid_width; _x++) {
						//    for (var _y = 0; _y < grid_height; _y++) {
						//        // Generate a random number to determine cell state (1 for alive, 0 for dead)
						//        grid[_x, _y] = irandom(1);
						//    }
						//}

						//// Function to count alive neighbors
						//function count_alive_neighbors(_x, _y) {
						//    var count = 0;
						//    for (var dx = -1; dx <= 1; dx++) {
						//        for (var dy = -1; dy <= 1; dy++) {
						//            var nx = (_x + dx + grid_width) % grid_width; // Wrap around grid edges
						//            var ny = (_y + dy + grid_height) % grid_height;
						//            if (!(dx == 0 && dy == 0) && grid[nx, ny] == 1) {
						//                count++;
						//            }
						//        }
						//    }
						//    return count;
						//}

						//// Update grid based on Game of Life rules
						//function update_grid() {
						//    var new_grid = array_create(grid_width, grid_height);
						//    for (var _x = 0; _x < grid_width; _x++) {
						//        for (var _y = 0; _y < grid_height; _y++) {
						//            var alive_neighbors = count_alive_neighbors(_x, _y);
						//            if (grid[_x, _y] == 1) {
						//                // Apply rules for alive cells
						//                if (alive_neighbors < 2 || alive_neighbors > 3) {
						//                    new_grid[_x, _y] = 0; // Dies due to underpopulation or overpopulation
						//                } else {
						//                    new_grid[_x, _y] = 1; // Survives
						//                }
						//            } else {
						//                // Apply rules for dead cells
						//                if (alive_neighbors == 3) {
						//                    new_grid[_x, _y] = 1; // Becomes alive due to reproduction
						//                } else {
						//                    new_grid[_x, _y] = 0; // Stays dead
						//                }
						//            }
						//        }
						//    }
						//    // Update grid with new states
						//    grid = new_grid;
						//}
//Smooth Life Approximation
// Define grid size
grid_width = 120;
grid_height = 60;
cell_size = 10; // Size of each cell in pixels
initial_alive_probability = 0.25; // Probability of initial cells being alive
initial_dead_probability = 0.20;

// Create grid
for (var _x = 0; _x < grid_width; _x++) {
    for (var _y = 0; _y < grid_height; _y++) {
        // Generate a random number to determine cell state (value between 0 and 1)
        grid[_x, _y] = 0;//random(1);
    }
}

// Function to update grid based on SmoothLife rules
function update_grid() {
    var new_grid = array_create(grid_width, grid_height);
    for (var _x = 0; _x < grid_width; _x++) {
        for (var _y = 0; _y < grid_height; _y++) {
            var average_state = calculate_average_state(_x, _y);
            // Apply SmoothLife rules
            if (average_state > 0.45) {
                new_grid[_x, _y] = 1; // Cell becomes alive
            } else {
                new_grid[_x, _y] = 0; // Cell remains dead
            }
        }
    }
    // Update grid with new states
    grid = new_grid;
}

// Function to calculate the average state of neighboring cells
function calculate_average_state(_x, _y) {
    var sum = 0;
    var count = 0;
    for (var dx = -1; dx <= 1; dx++) {
        for (var dy = -1; dy <= 1; dy++) {
            var nx = (_x + dx + grid_width) % grid_width; // Wrap around grid edges
            var ny = (_y + dy + grid_height) % grid_height;
            sum += grid[nx, ny];
            count++;
        }
    }
    return sum / count;
}


