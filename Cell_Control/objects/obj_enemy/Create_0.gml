//Call when hit
function TakeDamage(_damage)
{
	enemyHealth -= _damage;
	iframes = iframeMax;
}

last_x = xstart;
last_y = ystart;
pos_check_timer = 5;
stuck_threshold = 5;

time_to_draw = 0;
bar_alpha = 1;
max_health = enemyHealth;
