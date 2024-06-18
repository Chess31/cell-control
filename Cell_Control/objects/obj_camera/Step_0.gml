if (global.frozen = true) {
	exit;
}

//update destination
if (instance_exists(follow))
{
	xTo = follow.x;
	yTo = follow.y;
}

//Update cam object position
x += (xTo - x) / 10;
y += (yTo -y) / 10;

x= clamp(x,view_w_half, room_width-view_w_half);
y= clamp(y,view_h_half, room_height-view_h_half);

//Update view of cam
camera_set_view_pos(cam,x-view_w_half,y-view_h_half);

//global.cam_right = x + view_w_half;
//global.cam_left = x - view_w_half;
//global.cam_bottom = y + view_h_half;
//global.cam_top = y - view_h_half;

step_counter++;
if (step_counter = chunk_update_interval) {
	activate_visible_chunks();
	step_counter = 0;
}

process_chunk_queues();