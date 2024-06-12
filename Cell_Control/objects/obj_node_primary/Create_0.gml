event_inherited();
node_health = 500;
growth_rate = 300;
growth_timer = growth_rate;
node_type = "primary";

//generate growth directions
var _f = function() {return random_range(0,360)};
max_children = 3;
node_branches = array_create_ext(max_children, _f);
branch_to_grow = 0;
number_of_children = 0;

function spread_infection() {
    // Logic specific to primary node spreading
	if (number_of_children < array_length(node_branches)) {
		var _length = random_range(200,300);
	    create_node_secondary(x + lengthdir_x(_length, node_branches[branch_to_grow]), y + lengthdir_y(_length, node_branches[branch_to_grow]));
		branch_to_grow = (branch_to_grow + 1) mod max_children;
		number_of_children++;
	}
}

// Function to create a secondary node
function create_node_secondary(_x, _y) {
    var new_node = instance_create_layer(_x, _y, "NodesLayer", obj_node_secondary);
    new_node.creator = id;
}