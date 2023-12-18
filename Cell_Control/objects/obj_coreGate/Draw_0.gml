draw_self();
if (room == Room_Outside){
	var secondsLeft = ceil(timer / room_speed);
    draw_set_halign(fa_center);
	draw_text(room_width/2, 10, string(secondsLeft))
}