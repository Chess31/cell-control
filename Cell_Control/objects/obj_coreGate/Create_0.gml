isGateOpen = false;
timeLimit = room_speed * 50; // 60 seconds (adjust as needed)
timer = timeLimit;

//instance_create_layer(x + irandom_range(-100, 100), y + irandom_range(-100, 100), "Instances", obj_pickup_temp);