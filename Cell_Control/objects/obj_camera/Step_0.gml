if (follow != obj_player && global.frozen = false) {
	follow = obj_player;
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

//screen shake
x += random_range(-shake_remain,shake_remain);
y += random_range(-shake_remain,shake_remain);
shake_remain = max(0,shake_remain-((1/shake_length)*shake_magnitude));

//screen clamp
x= clamp(x, view_w_half, room_width-view_w_half);
y= clamp(y, view_h_half, room_height-view_h_half);

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