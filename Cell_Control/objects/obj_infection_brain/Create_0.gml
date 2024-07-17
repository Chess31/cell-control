type = "Brain"
action_points = 100;
state = 0; //growth mode
actions_per_step = 4;

//Create the appropriate number of cores to start

enum ACTION_COSTS
{
    BASIC = 25,
    BARRIER = 25,
    SPAWNER = 50,
    HEALER = 20,
    HARVESTER = 40,
    ALARM = 30,
    VISION = 35,
	ENERGYDRAIN = 50,
	ENHANCER = 80,
	EXPANDER = 60,
	SHIELD = 45,
	FORTIFICATION = 100
}