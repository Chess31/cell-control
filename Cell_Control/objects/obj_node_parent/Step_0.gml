growth_timer--;
if (growth_timer <= 0) {
    spread_infection();
    growth_timer = growth_rate;
}

if (node_type != "primary" and !instance_exists(creator)) {
	instance_destroy();
}