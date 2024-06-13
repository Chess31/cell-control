event_inherited();
node_health = 50;
growth_rate = 40;
node_type = "tertiary";
merge_radius = 10;

function spread_infection() {
    // Logic specific to tertiary node spreading or merging
	var _nearby_node = instance_nearest_exclude_self(x,y,obj_node_tertiary);
	
	if (instance_number(obj_node_tertiary) > 1) {
	    if (point_distance(x,y, _nearby_node.x, _nearby_node.y) < merge_radius) {
	        merge_to_secondary(_nearby_node);
	    } else {
	        //move closer to a nearby tertiary node
			var _dir = point_direction(x,y, _nearby_node.x, _nearby_node.y);
			x += lengthdir_x(3,_dir);
			y += lengthdir_y(3,_dir);
	    }
	}
}

// Function to merge into a secondary node
function merge_to_secondary(_node_to_merge) {
    var new_node = instance_create_layer(x, y, "NodesLayer", obj_node_secondary);
    new_node.creator = creator;
	new_node.can_grow = false;
	with (_node_to_merge){
		instance_destroy();
	}
    instance_destroy();
}