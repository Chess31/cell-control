var _bullet = instance_place(x,y,obj_bullet);

node_health -= _bullet.damage;

with (_bullet) {
	if (piercing < 1){
		instance_destroy()
	} else {
		piercing -= 1;
	}
}

if (node_health <= 0) {
	instance_destroy();
}