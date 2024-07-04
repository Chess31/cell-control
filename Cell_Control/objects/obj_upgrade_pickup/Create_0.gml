index = irandom(ds_list_size(global.upgrade_name) - 1);

image_speed = 0;
image_index = index;

collect_distance = 55;

var _name = ds_list_find_value(global.upgrade_name,index);
var _description = ds_list_find_value(global.upgrade_description,index);
var _function = ds_list_find_value(global.upgrade_function,index);
var _cooldown = ds_list_find_value(global.upgrade_cooldown,index);
var _duration = ds_list_find_value(global.upgrade_duration,index);

my_upgrade = new Upgrade(_name, index, _description, _function, _cooldown, _duration);

//to swap: either add buttons in the menu that shake like apple app icons, or summon a menu to drop them