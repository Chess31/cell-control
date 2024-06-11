event_inherited();
node_health = 500;
growth_rate = 300;
growth_timer = growth_rate;
node_type = "primary";

function spread_infection() {
    // Logic specific to primary node spreading
    create_node_secondary(x + random_range(-100, 100), y + random_range(-100, 100));
}

// Function to create a secondary node
function create_node_secondary(_x, _y) {
    var new_node = instance_create_layer(_x, _y, "NodesLayer", obj_node_secondary);
    new_node.creator = id;
}