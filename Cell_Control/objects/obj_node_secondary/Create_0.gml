event_inherited();
node_health = 5;
growth_rate = 180;
node_type = "secondary";
can_grow = true;

//generate growth directions
var _f = function() {return random_range(0,360)};
max_children = 3;
node_branches = array_create_ext(max_children, _f);
branch_to_grow = 0;
number_of_children = 0;

function spread_infection() {
    // Logic specific to primary node spreading
	if (can_grow = true and number_of_children < array_length(node_branches)) {
		var _length = random_range(20,150);
	    create_node_tertiary(x + lengthdir_x(_length, node_branches[branch_to_grow]), y + lengthdir_y(_length, node_branches[branch_to_grow]));
		branch_to_grow = (branch_to_grow + 1) mod max_children;
		number_of_children++;
	}
}

// Function to create a tertiary node
function create_node_tertiary(_x, _y) {
    var new_node = instance_create_layer(_x, _y, "NodesLayer", obj_node_tertiary);
    new_node.creator = id;
}