enemyType = "boss";
enemyHealth = 100;
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

//Call when hit
function TakeDamage(_damage)
{
	enemyHealth -= _damage;
	iframes = iframeMax;
}