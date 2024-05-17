//destroy if too close to the core
if (point_distance(x, y, obj_cell_core.x, obj_cell_core.y) < 300){instance_destroy()};

buildingHealth = 5;