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

function startGame(){
	//random_set_seed(1);
	randomize(); //sets a completely random seed
	show_debug_message(random_get_seed()); //prints the seed
	room_goto(Room_Core);
}

function launchOptions(){
	MenuCreate(room_width/2, room_height/2,
		[
			["Controls",firstMenu],
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