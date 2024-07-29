if (global.frozen = true) {
	exit;
}

// Health check
if (enemyHealth <= 0) {
    // Destroy the enemy when health reaches zero
    instance_destroy();
}

if (iframes > 0){
	canBeHit = false;
	iframes--;
} else {
	canBeHit = true;
}

//image_angle = point_direction(x, y, obj_player.x, obj_player.y) - 90;

//get unstuck from walls
pos_check_timer--;

if (pos_check_timer <= 0)
{
	pos_check_timer = 5;
	
	if (point_distance(x, y, last_x, last_y) < stuck_threshold and instance_exists(obj_well))
	{
		var _nearest_well = instance_nearest(x, y, obj_well);
		var _dir = point_direction(x, y, _nearest_well.x, _nearest_well.y);
		
		while (place_meeting(x, y, obj_cellWall))
		{
			var _x_move = lengthdir_x(5,_dir);
			var _y_move = lengthdir_y(5,_dir);
			
			x += _x_move;
			y += _y_move;
		}
	}
	
	last_x = x;
	last_y = y;
	
}

//health bar things
if (time_to_draw < 30) {
	bar_alpha = lerp(bar_alpha, 0, 0.02);
} else {
	bar_alpha = 1;
}