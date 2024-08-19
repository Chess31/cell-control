/// @description Targets and shields other pieces
event_inherited();

node_health = 30;
max_health = node_health;

image_index = 10;

target = noone; // The infection piece being shielded
shield_radius = 32; // Radius of the shield circle
shield_range = 500; // Max distance a target can be from this instance;