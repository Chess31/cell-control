function destroy_offscreen(){
	if (x < 0 || y < 0 || x > room_width || y > room_height) {
	    instance_destroy();
	}
}