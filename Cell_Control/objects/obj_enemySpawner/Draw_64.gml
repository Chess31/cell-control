var secondsToNextWave = ceil(EspawnTimer / room_speed);
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_text(obj_camera.view_w_half, 10, string(secondsToNextWave));