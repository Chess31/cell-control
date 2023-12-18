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