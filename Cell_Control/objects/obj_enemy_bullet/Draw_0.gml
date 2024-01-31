if big = true {
	draw_sprite_ext(sprite_index, image_index, x, y, 4, 4, direction, c_white, 1);
	//sprite_collision_mask(true, 1, 0, 0, 0, 0, 0, 0);
} else {
	draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, direction, c_white, 1);
}