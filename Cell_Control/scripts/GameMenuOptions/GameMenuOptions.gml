function firstMenu(){
	MenuCreate(room_width/2 - (string_width("Start Game ")/2), room_height/2,
		[
			["Start Game",startGame],
			["Testing Lab",startLab],
			["Options",launchOptions],
			["Quit",quitGame]
		],
		//"Cell Control"
	);
}

//First level of menu options
function startGame(){
	
	MenuCreate(room_width/2 - (string_width("Select Difficulty")/2), room_height/2,
		[
			["Tutorial",start_tutorial],
			["Normal",start_normal],
			["Challenge",start_challenge],
			["Back",firstMenu]
		],
		"Select Difficulty"
	);
	
	//randomize(); //sets a completely random seed
	//show_debug_message(random_get_seed()); //prints the seed
	//room_goto(Room_Core);
}

function start_tutorial(){
	randomize(); //sets a completely random seed
	show_debug_message(random_get_seed()); //prints the seed
	global.gamemode = 0;
	global.win_level = 5;
	global.energy_rate = 6;
	global.cell_health = 8;
	global.core_power = 10000;
	room_goto(Room_Tutorial);
}

function start_normal(){
	randomize(); //sets a completely random seed
	show_debug_message(random_get_seed()); //prints the seed
	global.gamemode = 1;
	//global.win_level = 10;
	global.energy_rate = 10;
	global.cell_health = 8;
	global.core_power = 10;
	//room_goto(rm_hub);
	room_goto(Room_Loading);
}

function start_challenge(){
	randomize(); //sets a completely random seed
	show_debug_message(random_get_seed()); //prints the seed
	global.gamemode = 2;
	//global.win_level = 15;
	global.energy_rate = 16;
	global.cell_health = 4;
	global.core_power = 0;
	room_goto(Room_Loading);
}

function startLab(){
	room_goto(Room_Lab);
}

function launchOptions(){
	MenuCreate(room_width/2 - string_width("Controls")/2, room_height/2,
		[
			["Controls",controlsOptions],
			//["Video",firstMenu],
			//["Sound",firstMenu],
			["Back", firstMenu]
		],
		"Options"
	);
}

function quitGame(){
	game_end();
}

//Second level of menu options
function controlsOptions(){
	MenuCreate(room_width/2 - string_width("Toggle Building Mode  -  Space")/2, room_height/2,
		[
			["Movement  -  WASD",controlsOptions],
			["Shoot  -  Left Mouse",controlsOptions],
			["Toggle Building Mode  -  Space",controlsOptions],
			["Switch Building  -  Scroll",controlsOptions],
			["Open Menu  -  Ctrl",controlsOptions],
			["Back", launchOptions]
		],
		"Controls"
	);
}

////pause options
//function pause_controls(){
//	MenuCreate(room_width/2 - string_width("Toggle Building Mode  -  Space")/2, room_height/2,
//		[
//			["Movement  -  WASD",controlsOptions],
//			["Shoot  -  Left Mouse",controlsOptions],
//			["Toggle Building Mode  -  Space",controlsOptions],
//			["Switch Building  -  Scroll",controlsOptions],
//			["Open Menu  -  Ctrl",controlsOptions],
//			["Back", pauseMenu]
//		],
//		"Controls"
//	);
//}

//Pause Menu Stuff
function pauseMenu(){
	MenuCreate(display_get_gui_width()/2 - string_width("Game Paused")/2, display_get_gui_height() / 2,
				[
					["Continue",unPause],
					//["Controls",pause_controls],
					["Quit",quitToTitle]
				],
				"Game Paused"
			);
}

function unPause(){
	global.isPaused = false;
	global.frozen = false;
	//room_goto(Room_Core);
	//instance_activate_all();
}

function quitToTitle(){
	global.isPaused = false;
	//game_restart(); //this is unlikely to be problem free in the future
	//room_restart();
	room_goto(Room_StartScreen);
}
