segment_health = 5;

index = 0;

//segment_to_follow = index - 1;

follow_distance = 40;

//act like an enemy
enemyType = "boss";

canBeHit = true;
iframes = 0;
iframeMax = 10;

time_to_draw = 0;
bar_alpha = 1;
max_health = segment_health;

//Call when hit
function TakeDamage(_damage)
{
	segment_health -= _damage;
	iframes = iframeMax;
}