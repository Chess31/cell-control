enemyHealth = 100;
moveTimer = 50;
enemySpeed = 3;

gravity_affected = false;

while (place_meeting(x, y, obj_cellWall))
{
	instance_destroy(instance_place(x, y, obj_cellWall));
}

function TakeDamage(_damage)
{
	enemyHealth -= _damage;
}