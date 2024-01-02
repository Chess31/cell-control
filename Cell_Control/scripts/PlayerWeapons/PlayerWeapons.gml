function primaryWeapon(_type){
	switch (_type) {
	    case "primary1":
	        // Create a bullet object instance
			var bullet = instance_create_layer(x, y, "Instances", obj_bullet);

			// Set the bullet's direction and speed
			bullet.direction = point_direction(x, y, mouse_x, mouse_y);
			bullet.speed = 8;
			bullet.damage = 1;

			// Subtract ammo
			ammo -= 1;
	        break;
			
		case "primary2":
			if ((ammo - 5) >= 0){
				// Create a bullet object instance
				var bullet = instance_create_layer(x, y, "Instances", obj_bullet);

				// Set the bullet's direction and speed
				bullet.direction = point_direction(x, y, mouse_x, mouse_y);
				bullet.speed = 16;
				bullet.damage = 5;
				bullet.sprite_index = s_cursor;

				// Subtract ammo
				ammo -= 5;
			};
	        break;
			
	    default:
	        // code here
	        break;
	}
}

function shiftWeapon(_type){
	switch (_type) {
	    case "shift1":
	        if ((ammo - 5) >= 0){
				// Create a bullet object instance
				var bullet = instance_create_layer(x, y, "Instances", obj_bullet);

				// Set the bullet's direction and speed
				bullet.direction = point_direction(x, y, mouse_x, mouse_y);
				bullet.speed = 16;
				bullet.damage = 5;
				bullet.sprite_index = s_cursor;

				// Subtract ammo
				ammo -= 5;
			};
	        break;
			
		case "shift2":
	        // code here
	        break;
			
	    default:
	        // code here
	        break;
	}
}

function altWeapon(_type){
	switch (_type) {
	    case "alt1":
	        // code here
	        break;
			
		case "alt2":
	        // code here
	        break;
			
	    default:
	        // code here
	        break;
	}
}

function comboWeapon(_type){
	switch (_type) {
	    case "combo1":
	        // code here
	        break;
			
		case "combo2":
	        // code here
	        break;
			
	    default:
	        // code here
	        break;
	}
}