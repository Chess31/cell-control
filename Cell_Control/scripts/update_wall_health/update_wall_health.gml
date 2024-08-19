function update_wall_health(){
	global.building_healths[|1] += 25;
	with (obj_building) {
		if (type = "Wall") {
			buildingHealth += 25;
		}
	}
}