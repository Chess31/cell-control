// Create Event
loading = false;

// Initialize the list of entities
enemies = ds_list_create();
buildings = ds_list_create();

// Add entities (enemies/buildings) to the list
var enemy1 = {
    sprite: s_NewArtTest,
    description: "Red: A basic enemy that moves towards and shoots at the player."
};
var enemy2 = {
    sprite: s_enemyB,
    description: "Blue: Slow-moving and shoots 3 projectiles."
};
var enemy3 = {
    sprite: s_enemyG,
    description: "Green: Ignores walls and attacks buildings."
};
var enemy4 = {
    sprite: s_enemyP,
    description: "Purple: Heals nearby enemies."
};
var enemy5 = {
    sprite: s_enemyY,
    description: "Yellow: Shoots lots of projectiles and splits into 3 Red when defeated."
};

var building1 = {
    sprite: s_Wall,
    description: "Wall: Simple defensive structure good for blocking projectiles."
};
var building2 = {
    sprite: s_Turret,
    description: "Turret: Shoots at nearby enemies."
};
var building3 = {
    sprite: s_Forge,
    description: "Forge: Generates energy for the player to collect."
};
var building4 = {
    sprite: s_Upgrader,
    description: "Upgrader: Essential for healing the player and unlocking more buildings to place."
};

var building5 = {
    sprite: s_ProxMine,
    description: "Proximity Mine: Explodes and damages enemies. Needs to charge before being able to explode."
};
var building6 = {
    sprite: s_Feeder,
    description: "Feeder: Generates Special Energy for the player to collect."
};
var building7 = {
    sprite: s_Hive,
    description: "Hive: Automatically collects Energy and stores it. The player can choose to take a hive's energy reserve or have the hive enter one of its modes. Defend mode will have the hive attack enemies, and heal mode will have the hive heal nearby buildings."
};

// Add them to the list
ds_list_add(enemies, enemy1);
ds_list_add(enemies, enemy2);
ds_list_add(enemies, enemy3);
ds_list_add(enemies, enemy4);
ds_list_add(enemies, enemy5);
ds_list_add(enemies, building1);
ds_list_add(buildings, building2);
ds_list_add(buildings, building3);
ds_list_add(buildings, building4);
ds_list_add(buildings, building5);
ds_list_add(buildings, building6);
ds_list_add(buildings, building7);

// Set initial drawing position
start_x = 100;
start_y = 60;
spacing_y = 95; // Vertical spacing between each item

// Maximum width for the description text
text_width = 400;

// Helper function to wrap text
function wrap_text(_text, _width) {
    var lines = ds_list_create();
    var words = string_split(_text, " ");
    var line = "";
    
    for (var i = 0; i < array_length(words); i++) {
        var word = words[i];
        
        // Check if adding the next word would exceed the width
        if (string_width(line + word) > _width) {
            ds_list_add(lines, line);
            line = word + " ";
        } else {
            line += word + " ";
        }
    }
    
    // Add the last line
    ds_list_add(lines, line);
    
    return lines;
}