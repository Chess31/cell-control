//check if close enough to collect
if (point_distance(x, y, obj_player.x, obj_player.y) < collectDistance) && keyboard_check_pressed(ord("F")){
    // Collectible is close to the player, destroy it and increment a score variable
    instance_destroy();
	obj_player.AddAmmo(50);
	obj_player.shiftSlot = "shift1";
}