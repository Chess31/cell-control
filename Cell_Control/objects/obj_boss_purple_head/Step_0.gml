// Move the head segment

var _dir = point_direction(x, y, obj_player.x, obj_player.y);
var _diff = angle_difference(_dir, direction);
direction += _diff * 0.05;
image_angle = direction;

// Update the position of the first segment
if (segment_count > 0 and instance_exists(segments[|0])) {
    segments[|0].x = x;
    segments[|0].y = y;
} else if (segment_count <= 0) {
	instance_destroy();
}