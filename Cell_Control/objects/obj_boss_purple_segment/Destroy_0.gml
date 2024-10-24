//remove this segment from the object list
ds_list_delete(obj_boss_purple_head.segments, index);
obj_boss_purple_head.segment_count--;

//reorder index on following segments
var _removed_index = index;
with (obj_boss_purple_segment){
	if (index > _removed_index) {
		index--;
	}
}

//spawn feeder kill points
if (global.feeder_active = true){
	//spawn the "soul" particle and move it to the feeder
	var _particle = instance_create_layer(x, y, "Instances", obj_particle);
	_particle.target = global.current_feeder;
}