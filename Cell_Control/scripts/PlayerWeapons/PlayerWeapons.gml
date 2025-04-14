function use_weapon(_index) {
	switch (_index) {
		case 0: //normal gun
			// Create a bullet object instance
			var bullet = instance_create_layer(x, y, "Instances", obj_bullet);

			// Set the bullet's direction and speed
			bullet.direction = point_direction(x, y, mouse_x, mouse_y);
			bullet.speed = 16 + global.bullet_speed_mod;
			bullet.my_speed = bullet.speed;
			bullet.damage = 1 + global.damage_mod;

			// Subtract ammo
			ammo -= (1 - global.primary_bullet_discount);
			can_shoot_cooldown = 20;
			
			//shake screen
			screen_shake(1,8);
			break;
			
		case 1: //Disk launcher
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
			
			//shake screen
			screen_shake(8,10);
			break;
			
		case 2: //Gravity Gun
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
				
				//shake screen
				screen_shake(15,40);
			}
			break;
		
		case 3: //Shotbow type gun
	        if ((ammo - 5) >= 0){
				// Calculate the direction to the player
				var directionToCursor = point_direction(x, y, mouse_x, mouse_y);

				// Set up the bullet spread parameters
				var spreadAngle = 10;
				var numBullets = 3;

				// Loop through the number of bullets to create
				for (var i = 0; i < numBullets; i++) {
				    // Calculate the adjusted direction for each bullet in the spread
				    var adjustedDirection = (directionToCursor + (i - (numBullets - 1) / 2) * spreadAngle);// + irandom_range(-5,5);

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
				
				//shake screen
				screen_shake(2,8);
			}
	        break;
			
		case 4: //Tiny Bullets
	        //if (ammo > 0){
				// Calculate the direction to the player
				var _direction_to_cursor = point_direction(x, y, mouse_x, mouse_y);

				// Loop through both sides of the weapon
				for (var i = 0; i < 2; i++) {
					if (i = 0) {
						var _x = lengthdir_x(17, _direction_to_cursor - 90);
						var _y = lengthdir_y(17, _direction_to_cursor - 90);
						//var _offset = lengthdir_y(16, _direction_to_cursor);
						
						var _bullet = instance_create_layer(x + _x, y + _y , "Instances", obj_bullet_tracker);
						 // Set the bullet's stats
					    _bullet.direction = _direction_to_cursor;
					    _bullet.speed = 9 + global.bullet_speed_mod;
						_bullet.my_speed = _bullet.speed;
						_bullet.damage = 0.5 + global.damage_mod;
						_bullet.target_x = mouse_x;
						_bullet.target_y = mouse_y;
					}
					
					if (i = 1) {
						var _x = lengthdir_x(18, _direction_to_cursor + 90);
						var _y = lengthdir_y(18, _direction_to_cursor + 90);
						
						var _bullet = instance_create_layer(x + _x, y + _y, "Instances", obj_bullet_tracker);
						 // Set the bullet's stats
					    _bullet.direction = _direction_to_cursor;
					    _bullet.speed = 9 + global.bullet_speed_mod;
						_bullet.my_speed = _bullet.speed;
						_bullet.damage = 0.5 + global.damage_mod;
						_bullet.target_x = mouse_x;
						_bullet.target_y = mouse_y;
					}
				}
					
				// Subtract ammo
				ammo -= 1;
				can_shoot_cooldown = 3;
				
				//shake screen
				screen_shake(1.6,5);
			//}
	        break;
	
		case 5: //Homing bullets
		        if ((ammo - 3) >= 0){
					// Create a bullet object instance
					var bullet = instance_create_layer(x, y, "Instances", obj_bullet_tracker);

					// Set the bullet's direction and speed
					var _dir = point_direction(x, y, mouse_x, mouse_y)
					bullet.direction = _dir;
					bullet.speed = 12 + global.bullet_speed_mod;
					bullet.my_speed = bullet.speed;
					//bullet.fired_speed = bullet.speed;
					bullet.damage = 3 + global.damage_mod;
					bullet.direction_to_launch = _dir;
					bullet.image_angle= irandom(360);

					// Subtract ammo
					ammo -= 3;
					can_shoot_cooldown = 10;
					
					//shake screen
					screen_shake(2,5);
				};
			break;
			
		default:
			// code here
			break;
	}
}