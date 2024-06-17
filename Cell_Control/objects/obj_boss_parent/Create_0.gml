enemyType = "boss";
enemyHealth = 25 + global.infections_destroyed*25;
moveTimer = 50;
enemySpeed = 3;

gravity_affected = false;

//while (place_meeting(x, y, obj_cellWall))
//{
//	instance_destroy(instance_place(x, y, obj_cellWall));
//}

canBeHit = true;
iframes = 0;
iframeMax = 10;

time_to_draw = -1; //used to draw health bar (not added yet)

//Call when hit
function TakeDamage(_damage)
{
	enemyHealth -= _damage;
	iframes = iframeMax;
}