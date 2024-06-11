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