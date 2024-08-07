var _menu_x = display_get_gui_width()/2;
var _menu_y = hotbar_y;
var _sprite_half = sprite_get_width(s_core_menu);

draw_sprite_ext(s_core_menu, tab, _menu_x, _menu_y, 2,2,0,c_white,1);

//draw menu title
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_text(_menu_x, _menu_y - 250, "Cell Upgrades"); //six from the top (256 is now half the sprite)
//draw available upgrades
var _points = "Power: " + string(global.core_power);
draw_text(_menu_x + _sprite_half - 80, _menu_y - 250, _points);

//draw current tab text
switch (tab) {
    case 0:
        //Draw tab title
		draw_text((_menu_x - _sprite_half) + 84, _menu_y - 224,"Buildings");
		//Draw Upgrade buttons
		
        break;
	case 1:
		//Draw tab title
		draw_text(_menu_x, _menu_y - 224,"Weapons");
		break;
	case 2:
		//Draw tab title
		draw_text((_menu_x - _sprite_half) + 432, _menu_y - 224,"Defences");
		break;
		
    default:
        // code here
        break;
}