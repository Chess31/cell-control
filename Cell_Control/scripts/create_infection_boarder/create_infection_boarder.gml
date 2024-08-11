//function create_infection_boarder() {
//    // Array to store the new positions
//    var points = [];
    
//    // Distance to move each point away from obj_well
//    var move_distance = 50;
    
//    // Iterate over each obj_infection instance
//    with (obj_infection) {
//        var closest_well = noone;
//        var min_dist = 999999; // Some large number
        
//        // Find the closest obj_well
//        with (obj_well) {
//            var dist_to_well = point_distance(x, y, other.x, other.y);
//            if (dist_to_well < min_dist) {
//                min_dist = dist_to_well;
//                closest_well = id;
//            }
//        }
        
//        if (closest_well != noone) {
//            // Calculate the direction away from the closest obj_well
//            var dir = point_direction(closest_well.x, closest_well.y, x, y);
            
//            // Calculate the new position, 50 pixels farther away
//            var new_x = x + lengthdir_x(move_distance, dir);
//            var new_y = y + lengthdir_y(move_distance, dir);
            
//            // Add the new position to the points array
//            array_push(points, [new_x, new_y]);
//        }
//    }
    
//    // Now, draw a smooth perimeter around the points
//    if (array_length(points) > 2) {
//        draw_set_color(c_red); // Set color for the perimeter
        
//        // Smooth border drawing logic
//        for (var i = 0; i < array_length(points); i++) {
//            var p0 = points[i];
//            var p1 = points[(i + 1) mod array_length(points)];
            
//            // Draw a line segment between the current point and the next
//            draw_line(p0[0], p0[1], p1[0], p1[1]);
//        }
//    }
//}