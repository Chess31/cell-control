var _hit_piece = instance_place(x, y, obj_infection);

instance_destroy();

if (_hit_piece != noone) {
	if (_hit_piece.is_shielded == false) {
		_hit_piece.node_health -= damage;
		with (_hit_piece) {
			if (node_health <= 0) {
				instance_destroy();
			}
		}
	}
}