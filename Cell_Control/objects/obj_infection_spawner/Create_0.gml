/// @description Periodically spawns enemies
event_inherited();

image_index = 2;
image_angle = irandom(360);

node_health = 100;
max_health = node_health;

radius = 200;
spawn_cooldown = 480;
spawn_timer = 0;