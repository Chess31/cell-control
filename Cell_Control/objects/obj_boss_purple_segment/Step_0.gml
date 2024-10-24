if (index - 1 != -1) {
	//Get segment to follow
	var _follow_me = obj_boss_purple_head.segments[|index - 1];
	
    // Calculate the direction to the previous segment
    var dir = point_direction(x, y, _follow_me.x, _follow_me.y);

    // Calculate the target position
    var target_x = _follow_me.x - lengthdir_x(follow_distance, dir);
    var target_y = _follow_me.y - lengthdir_y(follow_distance, dir);

    // Move the segment towards the target position
    x = lerp(x, target_x, 0.2);
    y = lerp(y, target_y, 0.2);
}

if (segment_health <= 0) {
	instance_destroy();
}

if (iframes > 0){
	canBeHit = false;
	iframes--;
} else {
	canBeHit = true;
}

//health bar things
if (time_to_draw < 30) {
	bar_alpha = lerp(bar_alpha, 0, 0.02);
} else {
	bar_alpha = 1;
}