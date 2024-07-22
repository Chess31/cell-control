////Get action points
//var _action_points = obj_infection_brain.action_points;

////Use action points to move
//var _nearest_neighbor = instance_nearest_exclude_self(x,y,obj_infection);

//if (_nearest_neighbor != noone and point_distance(x, y, _nearest_neighbor.x, _nearest_neighbor.y) < 100 and _action_points > 1){
//	var _dir = point_direction(x, y, _nearest_neighbor.x, _nearest_neighbor.y);
//	x += lengthdir_x(1, _dir*-1);
//	y += lengthdir_y(1, _dir*-1);
//	obj_infection_brain.action_points--;
//}

// Get action points
//var _action_points = obj_infection_brain.action_points;

//Set min distance between instances
var _min_dis = 100;

// Initialize cumulative vectors
var _cumulative_vector_x = 0;
var _cumulative_vector_y = 0;
var _neighbor_count = 0;

// Loop through all instances of obj_infection
with (obj_infection) {
    if (id != other.id) { // Exclude the current instance itself
        var _distance = point_distance(other.x, other.y, x, y);
        if (_distance < _min_dis) {
            var _dir = point_direction(other.x, other.y, x, y);
            _cumulative_vector_x += lengthdir_x(_min_dis - _distance, _dir);
            _cumulative_vector_y += lengthdir_y(_min_dis - _distance, _dir);
            _neighbor_count++;
        }
    }
}

// Calculate the average vector direction
if (_neighbor_count > 0) {
    var _average_vector_x = _cumulative_vector_x / _neighbor_count;
    var _average_vector_y = _cumulative_vector_y / _neighbor_count;

    // Normalize the average vector
    var _length = point_distance(0, 0, _average_vector_x, _average_vector_y);
    if (_length > 0) {
        var _normalized_vector_x = _average_vector_x / _length;
        var _normalized_vector_y = _average_vector_y / _length;

        // Move the instance away from the neighbors
        x -= _normalized_vector_x;
        y -= _normalized_vector_y;

        // Deduct action points
        obj_infection_brain.action_points--;
    }
}