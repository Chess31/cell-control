// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SparkParticles(){
	var _ps = part_system_create();
	part_system_draw_order(_ps, true);

	var _ptype1 = part_type_create();
	part_type_sprite(_ptype1, s_Spark, false, true, false)
	part_type_size(_ptype1, 1, 1, 0, 0.1);
	part_type_scale(_ptype1, 0.1, 0.1);
	part_type_speed(_ptype1, 2, 3, 0, 0);
	part_type_direction(_ptype1, 0, 360, 0, 0);
	part_type_gravity(_ptype1, 0.4, 270);
	part_type_orientation(_ptype1, 0, 0, 0, 0, true);
	part_type_colour3(_ptype1, $FFFFFF, $00FFFF, $0000FF);
	part_type_alpha3(_ptype1, 1, 1, 1);
	part_type_blend(_ptype1, false);
	part_type_life(_ptype1, 20, 25);

	var _pemit1 = part_emitter_create(_ps);
	part_emitter_region(_ps, _pemit1, -16, 16, -4, 4, ps_shape_rectangle, ps_distr_linear);
	part_emitter_burst(_ps, _pemit1, _ptype1, 20);

	part_system_position(_ps, x, y);
}