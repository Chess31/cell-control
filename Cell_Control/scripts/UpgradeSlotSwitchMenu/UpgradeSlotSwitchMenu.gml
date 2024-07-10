function UpgradeSlotSwitchMenu(){
	MenuCreate(display_get_gui_width()/2 + 50, display_get_gui_height()/2,
		[
			["Slot 1",replaceSlotOne],
			["Slot 2",replaceSlotTwo],
			["Slot 3",replaceSlotThree]
		],
		"Select Ability Slot"
	);
}

function replaceSlotOne(){
	array_set(global.upgrades, 0, global.selector_upgrade);
	global.frozen = false;
}
function replaceSlotTwo(){
	array_set(global.upgrades, 1, global.selector_upgrade);
	global.frozen = false;
}
function replaceSlotThree(){
	array_set(global.upgrades, 2, global.selector_upgrade);
	global.frozen = false;
}