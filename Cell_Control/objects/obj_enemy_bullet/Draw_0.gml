if big = true {
	draw_sprite_ext(sprite_index, image_index, x, y, 4, 4, direction, bcolor, 1);
	//sprite_collision_mask(true, 1, 0, 0, 0, 0, 0, 0);
} else {
	draw_sprite_ext(sprite_index, image_index, x, y, 1.3, 1.3, direction, bcolor, 1);
}