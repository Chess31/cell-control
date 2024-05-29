function is_outside_view(_x, _y, width, height) {
    var cam_x = camera_get_view_x(view_camera[0]);
    var cam_y = camera_get_view_y(view_camera[0]);
    var cam_w = camera_get_view_width(view_camera[0]);
    var cam_h = camera_get_view_height(view_camera[0]);

    return (_x + width < cam_x || _x > cam_x + cam_w || _y + height < cam_y || _y > cam_y + cam_h);
}

function get_chunk_coords(_x, _y) {
    return [floor(_x / global.chunk_size), floor(_y / global.chunk_size)];
}

function store_wall_data(wall) {
    var chunk_coords = get_chunk_coords(wall.x, wall.y);
    var wall_data = ds_map_create();
    ds_map_add(wall_data, "x", wall.x);
    ds_map_add(wall_data, "y", wall.y);
    ds_map_add(wall_data, "buildingHealth", wall.buildingHealth);

    var chunk_data = ds_grid_get(global.wall_chunks, chunk_coords[0], chunk_coords[1]);
    if (chunk_data == undefined) {
        chunk_data = ds_list_create();
        ds_grid_set(global.wall_chunks, chunk_coords[0], chunk_coords[1], chunk_data);
    }
    ds_list_add(chunk_data, wall_data);
    instance_destroy(wall);
}

function recreate_walls_in_view() {
    var cam_x = camera_get_view_x(view_camera[0]);
    var cam_y = camera_get_view_y(view_camera[0]);
    var cam_w = camera_get_view_width(view_camera[0]);
    var cam_h = camera_get_view_height(view_camera[0]);

    var start_x = max(0, floor(cam_x / global.chunk_size));
    var start_y = max(0, floor(cam_y / global.chunk_size));
    var end_x = min(ds_grid_width(global.wall_chunks) - 1, floor((cam_x + cam_w) / global.chunk_size));
    var end_y = min(ds_grid_height(global.wall_chunks) - 1, floor((cam_y + cam_h) / global.chunk_size));

    for (var gx = start_x; gx <= end_x; gx++) {
        for (var gy = start_y; gy <= end_y; gy++) {
            var chunk_data = ds_grid_get(global.wall_chunks, gx, gy);
            if (chunk_data != undefined) {
                for (var i = ds_list_size(chunk_data) - 1; i >= 0; i--) {
                    var wall_data = ds_list_find_value(chunk_data, i);
                    var wall_x = ds_map_find_value(wall_data, "x");
                    var wall_y = ds_map_find_value(wall_data, "y");

                    if (!is_outside_view(wall_x, wall_y, sprite_width, sprite_height)) {
                        var new_wall = instance_create_layer(wall_x, wall_y, layer, obj_cellWall);
                        new_wall.buildingHealth = ds_map_find_value(wall_data, "buildingHealth");

                        ds_list_delete(chunk_data, i);
                        ds_map_destroy(wall_data);
                    }
                }
                if (ds_list_size(chunk_data) == 0) {
                    ds_list_destroy(chunk_data);
                    ds_grid_set(global.wall_chunks, gx, gy, undefined);
                }
            }
        }
    }
}
