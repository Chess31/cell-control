//// Draw grid
//for (var _x = 0; _x < grid_width; _x++) {
//    for (var _y = 0; _y < grid_height; _y++) {
//        var cell_x = _x * cell_size;
//        var cell_y = _y * cell_size;
//        if (grid[_x, _y] == 1) {
//            draw_rectangle(cell_x, cell_y, cell_x + cell_size, cell_y + cell_size, true);
//        }
//    }
//}




// Draw grid
for (var _x = 0; _x < grid_width; _x++) {
    for (var _y = 0; _y < grid_height; _y++) {
        var cell_x = _x * cell_size;
        var cell_y = _y * cell_size;
        var state = grid[_x, _y];
        draw_set_alpha(state); // Set alpha based on cell state
        draw_rectangle(cell_x, cell_y, cell_x + cell_size, cell_y + cell_size, true);
        draw_set_alpha(1); // Reset alpha
    }
}