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
			can_shoot_cooldown = 20;
	        break;
			
		case "primary2":
			//if ((ammo - 5) >= 0){
			//	// Create a bullet object instance
			//	var bullet = instance_create_layer(x, y, "Instances", obj_bullet);

			//	// Set the bullet's direction and speed
			//	bullet.direction = point_direction(x, y, mouse_x, mouse_y);
			//	bullet.speed = 16;
			//	bullet.damage = 5;
			//	bullet.sprite_index = s_cursor;

			//	// Subtract ammo
			//	ammo -= 5;
			//};
	        break;
			
	    default:
	        // code here
	        break;
	}
}

function shiftWeapon(_type){
	switch (_type) {
	    case "shift1":
			//Disk launcher
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
				can_shoot_cooldown = 20;
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
			//Gravity ball gun
	        if ((ammo - 10) >= 0){
				// Create a bullet object instance
				var bullet = instance_create_layer(x, y, "Instances", obj_gravity_ball);

				// Set the bullet's direction and speed
				bullet.direction = point_direction(x, y, mouse_x, mouse_y);
				bullet.speed = 3;
				bullet.damage = 1;
				bullet.piercing = 100;
				//bullet.sprite_index = s_GravityBall;

				// Subtract ammo
				ammo -= 10;
				can_shoot_cooldown = 60;
			}
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
			//Shotbow type gun
	        if ((ammo - 5) >= 0){
				// Calculate the direction to the player
				var directionToCursor = point_direction(x, y, mouse_x, mouse_y);

				// Set up the bullet spread parameters
				var spreadAngle = 10;
				var numBullets = 3;

				// Loop through the number of bullets to create
				for (var i = 0; i < numBullets; i++) {
				    // Calculate the adjusted direction for each bullet in the spread
				    var adjustedDirection = (directionToCursor + (i - (numBullets - 1) / 2) * spreadAngle) + irandom_range(-5,5);

				    // Create a bullet
				    var bullet = instance_create_layer(x, y, "Instances", obj_bullet);

				    // Set the bullet's stats
				    bullet.direction = adjustedDirection;
				    bullet.speed = 8;
					bullet.damage = 1;
					bullet.piercing = 2;
				}
					
				// Subtract ammo
				ammo -= 5;
				can_shoot_cooldown = 25;
			}
	        break;
			
		case "combo2":
	        // code here
	        break;
			
	    default:
	        // code here
	        break;
	}
}