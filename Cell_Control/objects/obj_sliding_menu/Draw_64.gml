draw_set_color(c_orange);
draw_rectangle(0, hotbar_y, display_get_gui_width(), hotbar_y + hotbar_height, false);

// Draw the hotbar contents (replace this with your own content drawing)
draw_set_color(c_white);
draw_text(10, hotbar_y + 10, "Hotbar Content");