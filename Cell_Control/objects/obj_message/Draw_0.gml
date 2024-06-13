draw_set_color(text_color);
draw_set_alpha(image_alpha);
draw_set_halign(fa_middle);
draw_text_transformed(x, y, message_text, 1, 1, 0);
//reset alpha and halign
draw_set_alpha(1);
draw_set_halign(fa_left);