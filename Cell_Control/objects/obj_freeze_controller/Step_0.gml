if (global.gamemode = 0){
	//display_tutorial(300,300,"Hey this is a test tutorial message! Welcome to cell control, hope this is fun... epic sauce","TUTORIAL TITLE") //...welcome cell controller blah blah blah
	if (global.frozen) {
		if (!core_explained && !instance_exists(obj_tutorial)) {
			obj_camera.follow = obj_cell_core;
			if (point_distance(obj_cell_core.x,obj_cell_core.y,obj_camera.x,obj_camera.y) < 50){
				display_tutorial(display_get_gui_width()/2 - 192,120,TUTORIAL_CORE,"Welcome Cell Controller");
				core_explained = true;
			}
		}
		if (!bars_explained && global.tutorial_to_show = 1 && !instance_exists(obj_tutorial)) {
			display_tutorial(display_get_gui_width()/2 - 192, display_get_gui_height()-240,TUTORIAL_BARS,"Health and Energy");
			bars_explained = true;
		}
		if (!enemies_explained && global.tutorial_to_show = 2 && !instance_exists(obj_tutorial)) {
			var _enemy = instance_nearest(obj_player.x,obj_player.y,obj_enemy);
			obj_camera.follow = _enemy;
			if (point_distance(_enemy.x,_enemy.y,obj_camera.x,obj_camera.y) < 50){
				display_tutorial(display_get_gui_width()/2 - 192,display_get_gui_height()/2 + 40,TUTORIAL_ENEMIES,"Enemies");
				enemies_explained = true;
			}
		}
		if (!death_explained && global.tutorial_to_show = 3 && !instance_exists(obj_tutorial)) {
			display_tutorial(display_get_gui_width()/2 - 192,display_get_gui_height()/2 + 40,TUTORIAL_DEATH);
			death_explained = true;
		}
		if (!wells_explained && global.tutorial_to_show = 4 && !instance_exists(obj_tutorial)) {
			display_tutorial(display_get_gui_width()/2 - 192,display_get_gui_height()/2 + 100,TUTORIAL_WELLS, "Infection Bases");
			wells_explained = true;
		}
		if (!buildmode_explained && global.tutorial_to_show = 5 && !instance_exists(obj_tutorial)) {
			display_tutorial(display_get_gui_width()/2 - 192,display_get_gui_height()/2 - 250,TUTORIAL_BUILDMODE, "Build Mode");
			buildmode_explained = true;
		}
		if (!bossdrops_explained && global.tutorial_to_show = 6 && !instance_exists(obj_tutorial)) {
			display_tutorial(50,display_get_gui_height()/2,TUTORIAL_BOSSDROPS, "Boss Defeated!");
			bossdrops_explained = true;
		}
		if (!corepower_explained && global.tutorial_to_show = 7 && !instance_exists(obj_tutorial)) {
			display_tutorial(10, 70,TUTORIAL_COREPOWER, "Core Power");
			corepower_explained = true;
		}
		if (!green_explained && global.tutorial_to_show = 8 && !instance_exists(obj_tutorial)) {
			
			var _enemy = instance_nearest(obj_player.x,obj_player.y,obj_enemy_green);
			obj_camera.follow = _enemy;
			if (point_distance(_enemy.x,_enemy.y,obj_camera.x,obj_camera.y) < 50){
				display_tutorial(display_get_gui_width()/2 - 192,display_get_gui_height()/2 + 40,TUTORIAL_GREEN, "Green Enemies");
				green_explained = true;
			}
			
		}
		if (!purple_explained && global.tutorial_to_show = 9 && !instance_exists(obj_tutorial)) {
			
			var _enemy = instance_nearest(obj_player.x,obj_player.y,obj_enemy_purple);
			obj_camera.follow = _enemy;
			if (point_distance(_enemy.x,_enemy.y,obj_camera.x,obj_camera.y) < 50){
				display_tutorial(display_get_gui_width()/2 - 192,display_get_gui_height()/2 + 40,TUTORIAL_PURPLE, "Purple Enemies");
				purple_explained = true;
			}
			
		}
	}
} else {
	instance_destroy()
}
