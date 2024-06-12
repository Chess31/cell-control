////function for getting the nearest instance of an object excuding the calling instance
//function instance_nearest_exclude_self(_x, _y, _obj) {
//    var _nearest = noone;
//    var _min_dist = -1;
	
//    // Loop through all instances of the specified object
//    with (_obj) {
//        if (id != other.id) { // Exclude the calling instance
//            var _dist = point_distance(_x, _y, other.x, other.y);
//            if (_min_dist == -1 || _dist < _min_dist) {
//                _min_dist = _dist;
//                _nearest = id;
//            }
//        }
//    }
//    show_debug_message(id)
//    return _nearest;
//}

function instance_nearest_exclude_self(_x, _y, obj) {
    var instance_list = ds_list_create();
    var nearest = noone;
    var min_dist = -1;
    
    // Collect all instances of the specified object
    with (obj) {
        if (id != other.id) {
            ds_list_add(instance_list, id);
        }
    }
    
    // Loop through the collected instances
    for (var i = 0; i < ds_list_size(instance_list); i++) {
        var inst = ds_list_find_value(instance_list, i);
        var dist = point_distance(_x, _y, inst.x, inst.y);
        
        if (min_dist == -1 || dist < min_dist) {
            min_dist = dist;
            nearest = inst;
        }
    }
    
    ds_list_destroy(instance_list);
    return nearest;
}