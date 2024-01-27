item = choose(item_food, item_bow, item_key, item_potion, item_sword);
switch(item)
{
case item_food:
    sprite_index = s_cursor;
    break;
case item_bow:
    sprite_index = s_enemy3;
    break;
case item_key:
    sprite_index = s_enemy2;
    break;
case item_potion:
    sprite_index = s_enemy;
    break;
case item_sword:
    sprite_index = s_eBullet;
    break;
}