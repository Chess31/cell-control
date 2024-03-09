//starting health
cellHealth = 10;

//starting position
x = room_width/2; //obj_camera.view_w_half;
y = room_width/2; //obj_camera.view_h_half;

//starting buildings
var wallDistance = 64; // Adjust the distance of walls from the cell core

// Place walls in the four cardinal directions
var wallEast = instance_create_layer(x + wallDistance, y, "Instances", obj_building);
var wallWest = instance_create_layer(x - wallDistance, y, "Instances", obj_building);
var wallNorth = instance_create_layer(x, y - wallDistance, "Instances", obj_building);
var wallSouth = instance_create_layer(x, y + wallDistance, "Instances", obj_building);

wallEast.type = "Wall";
wallEast.buildingHealth = 75;
wallEast.sprite_index = s_Wall;
wallEast.image_angle = 0;
wallEast.index = 0;

wallWest.type = "Wall";
wallWest.buildingHealth = 75;
wallWest.sprite_index = s_Wall;
wallWest.image_angle = 180;
wallWest.index = 0;


wallNorth.type = "Wall";
wallNorth.buildingHealth = 75;
wallNorth.sprite_index = s_Wall;
wallNorth.image_angle = 90;
wallNorth.index = 0;

wallSouth.type = "Wall";
wallSouth.buildingHealth = 75;
wallSouth.sprite_index = s_Wall;
wallSouth.image_angle = 270;
wallSouth.index = 0;