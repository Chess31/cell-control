function primaryWeapon(_type){
	switch (_type) {
	    case "primary1":
	        // Create a bullet object instance
			var bullet = instance_create_layer(x, y, "Instances", obj_bullet);

			// Set the bullet's direction and speed
			bullet.direction = point_direction(x, y, mouse_x, mouse_y);
			bullet.speed = 8 + global.bullet_speed_mod;
			bullet.my_speed = bullet.speed;
			bullet.damage = 1 + global.damage_mod;

			// Subtract ammo
			ammo -= (1 - global.primary_bullet_discount);
			can_shoot_cooldown = 20;
	        break;
			
		case "primary2":
			if ((ammo - 1) >= 0){
				// Create a bullet object instance
				var bullet = instance_create_layer(x + irandom_range(-2,2), y+ irandom_range(-2,2), "Instances", obj_bullet_small);

				// Set the bullet's direction and speed
				bullet.direction = point_direction(x, y, mouse_x, mouse_y) + irandom_range(-1,1);
				bullet.speed = 26 + global.bullet_speed_mod;
				bullet.my_speed = bullet.speed;
				bullet.damage = .2 + global.damage_mod;

				// Subtract ammo
				ammo -= 0;
				can_shoot_cooldown = 3;
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
			//Disk launcher
	        if ((ammo - 5) >= 0){
				// Create a bullet object instance
				var bullet = instance_create_layer(x, y, "Instances", obj_bullet);

				// Set the bullet's direction and speed
				bullet.direction = point_direction(x, y, mouse_x, mouse_y);
				bullet.speed = 16 + global.bullet_speed_mod;
				bullet.my_speed = bullet.speed;
				bullet.damage = 5 + global.damage_mod;
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
				bullet.speed = 3 + global.bullet_speed_mod;
				bullet.my_speed = bullet.speed;
				bullet.damage = 1 + global.damage_mod;
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
				    bullet.speed = 8 + global.bullet_speed_mod;
					bullet.my_speed = bullet.speed;
					bullet.damage = 1 + global.damage_mod;
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