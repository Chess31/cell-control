boss_health = 100;
moveTimer = 50;
enemySpeed = 3;

while (place_meeting(x, y, obj_cellWall))
{
	instance_destroy(instance_place(x, y, obj_cellWall));
}