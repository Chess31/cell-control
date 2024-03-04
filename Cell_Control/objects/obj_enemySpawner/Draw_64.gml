var secondsToNextWave = ceil(EspawnTimer / room_speed);
draw_set_halign(fa_center);
draw_text(obj_camera.view_w_half, 10, string(secondsToNextWave));