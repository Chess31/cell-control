//draw_set_color(c_navy);
//draw_rectangle(0, hotbar_y, display_get_gui_width(), hotbar_y + hotbar_height, false);



var _menu_x = display_get_gui_width()/2;
var _menu_y = hotbar_y;
var _sprite_half = sprite_get_width(s_core_menu);

draw_sprite_ext(s_core_menu, tab, _menu_x, _menu_y, 2,2,0,c_white,1);

//draw menu title
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_text(_menu_x, _menu_y - 250, "Cell Upgrades") //six from the top (256 is now half the sprite)

//draw current tab text
switch (tab) {
    case 0:
        //draw_set_halign(fa_center);
		draw_text((_menu_x - _sprite_half) + 80, _menu_y - 224,"Buildings")
        break;
	case 1:
		draw_text(_menu_x, _menu_y - 224,"Weapons")
		break;
	case 2:
		draw_text((_menu_x - _sprite_half) + 432, _menu_y - 224,"Defences")
		break;
		
    default:
        // code here
        break;
}




//// Draw the hotbar contents (replace this with your own content drawing)
//draw_set_color(c_white);
//draw_text(10, hotbar_y + 10, "Hotbar Content");
	
//for (var i = 0; i < array_length(global.upgrades); i++) {
//	var upgrade = global.upgrades[i];
//	draw_text(10, hotbar_y + 30 + (i * 20), string(upgrade.upgrade_name) + ": " + string(upgrade.description));
//}