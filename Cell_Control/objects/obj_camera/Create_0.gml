//make sure there is only one of these per room
x = room_width/2;
y = room_height/2;

cam = view_camera[0];
follow = obj_player;
view_w_half = camera_get_view_width(cam) / 2;
view_h_half = camera_get_view_height(cam) / 2;
xTo = xstart;
yTo = ystart;

//screen shake
shake_length = 0;
shake_magnitude = 0;
shake_remain = 0;


//global.cam_right = x + view_w_half;
//global.cam_left = x - view_w_half;
//global.cam_bottom = y + view_h_half;
//global.cam_top = y - view_h_half;

chunk_update_interval = 5; //scan for visible chunks every (this many) steps
step_counter = 0;
// Initialize queues for chunks to be activated and deactivated
global.chunks_to_activate = ds_queue_create();
global.chunks_to_deactivate = ds_queue_create();
