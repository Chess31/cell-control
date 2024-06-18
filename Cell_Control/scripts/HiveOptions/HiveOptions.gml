function hive_options_menu(){
	MenuCreate(display_get_gui_width()- 230, 300,
				[
					["Transfer Reserves",transfer_reserves],
					["Collect",switch_to_collecting_drones],
					["Heal",switch_to_heal_drones],
					["Defend",switch_to_attack_drones]
				],
				"Switch Mode"
			);
}

function transfer_reserves(){
	if (instance_exists(global.hiveInActiveMenu)){
		obj_player.ammo += global.hiveInActiveMenu.ammo;
		global.hiveInActiveMenu.ammo = 0;
	}
}

function switch_to_collecting_drones(){
	if (instance_exists(global.hiveInActiveMenu)){
		global.hiveInActiveMenu.drone_mode = "collecting";
	}
}

function switch_to_heal_drones(){
	if (instance_exists(global.hiveInActiveMenu)){
		global.hiveInActiveMenu.drone_mode = "healing";
	}
}

function switch_to_attack_drones(){
	if (instance_exists(global.hiveInActiveMenu)){
		global.hiveInActiveMenu.drone_mode = "attacking";
	}
}