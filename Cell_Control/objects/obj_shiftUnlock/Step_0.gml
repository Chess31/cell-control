//check if close enough to collect
if (point_distance(x, y, obj_player.x, obj_player.y) < collectDistance) && keyboard_check_pressed(ord("F")){
    instance_destroy();
	obj_player.AddAmmo(50);
	obj_player.shiftSlot = "shift1";
	
	//if (obj_player.shiftSlot != -1){}
}

//maybe just write an equip funciton




//Plan for upgrades:
//make the shiftSlot variable a integer so we can increment it with an upgrader option
//each boss is what unlocks the next weapon slot; upgrade coins are dropped from the feeder