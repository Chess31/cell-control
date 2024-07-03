if timeline_position > timeline_max_moment(timeline_index) + 1{
	timeline_delete(timeline_index);
	instance_destroy();
}