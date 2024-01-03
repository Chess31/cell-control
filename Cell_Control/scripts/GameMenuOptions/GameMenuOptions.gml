function firstMenu(){
	MenuCreate(room_width/2, room_height/2,
		[
			["Start Game",startGame],
			["Options",launchOptions],
			["Quit",quitGame]
		],
		"Cell Control"
	);
}

//First level of menu options
function startGame(){
	//random_set_seed(1);
	randomize(); //sets a completely random seed
	show_debug_message(random_get_seed()); //prints the seed
	room_goto(Room_Core);
}

function launchOptions(){
	MenuCreate(room_width/2, room_height/2,
		[
			["Controls",controlsOptions],
			["Video",firstMenu],
			["Sound",firstMenu],
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
	MenuCreate(room_width/2, room_height/2,
		[
			["Movement - WASD",controlsOptions],
			["Shoot - Left Mouse",controlsOptions],
			["Toggle Building Mode - Space",controlsOptions],
			["Switch Building - Scroll",controlsOptions],
			["Back", launchOptions]
		],
		"Controls"
	);
}

//Pause Menu Stuff
function pauseMenu(){
	MenuCreate(display_get_gui_width() / 2, display_get_gui_height() / 2,
				[
					["Continue",unPause],
					["Quit",quitToTitle]
				],
				"Game Paused"
			);
}

function unPause(){
	global.isPaused = false;
	instance_activate_all();
}

function quitToTitle(){
	global.isPaused = false;
	game_restart(); //this is unlikely to be problem free in the future
	//room_restart();
	//room_goto(Room_StartScreen);
}
