segment_count = 8;

segments = ds_list_create();

// Initialize segments
for (var i = 0; i < segment_count; i++) {
    var _segment = instance_create_layer(x,y,"Instances",obj_boss_purple_segment);
	_segment.index = i;
	ds_list_add(segments, _segment);
}