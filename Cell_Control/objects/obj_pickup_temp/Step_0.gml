//check if close enough to collect
if (point_distance(x, y, obj_player.x, obj_player.y) < collectDistance) && keyboard_check_pressed(ord("F")){
    instance_destroy();
	obj_player.AddAmmo(50);
	obj_player.shiftSlot = "shift1";
	
	//if (obj_player.shiftSlot != -1){}
}

//maybe just write an equip funciton