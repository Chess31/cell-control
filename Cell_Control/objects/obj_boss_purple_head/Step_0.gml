// Move the head segment
speed = 4;
direction += 1;

// Update the position of the first segment
if (segment_count > 0 and instance_exists(segments[|0])) {
    segments[|0].x = x;
    segments[|0].y = y;
} else if (segment_count <= 0) {
	instance_destroy();
}