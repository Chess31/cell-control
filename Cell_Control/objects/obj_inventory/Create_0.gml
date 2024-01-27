//draw_set_font(fnt_Small);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);

slot_count = 5;
item_pos = 0;
item_pos_index = 0;
item_array = array_create(slot_count, noone);
for(var i = 0; i < slot_count; i += 1)
{
    item_array[i][item_type] = item_none;
    item_array[i][item_sprite] = -1;
    item_array[i][item_amount] = 0;
}