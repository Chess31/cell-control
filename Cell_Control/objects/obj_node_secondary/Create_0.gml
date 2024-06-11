event_inherited();
node_health = 250;
growth_rate = 180;
node_type = "secondary";

// Spread Infection Override
function spread_infection() {
    // Logic specific to secondary node spreading
    create_node_tertiary(x + random_range(-100, 100), y + random_range(-100, 100));
}

// Function to create a tertiary node
function create_node_tertiary(_x, _y) {
    var new_node = instance_create_layer(_x, _y, "NodesLayer", obj_node_tertiary);
    new_node.creator = id;
}