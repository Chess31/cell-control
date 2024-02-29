//start position
//image_xscale = 3;
//image_yscale = 3;
x = random(room_width);
y = random(room_height);

//blue specific variables
wave_attack_cooldown = room_speed * 2;
big_attack_cooldown = room_speed * 5;

//wave attack variables
_wave_spread = 90; //angle of the wave attack
bulletSpeed = 6; // Set the speed of the bullets
bulletDamage = 3; // Set the damage value of the bullets
totalBullets = 10; // Set the total number of bullets in the wave
global.current_bullet = 0;
attackDirection = -1;
bullet_spacing = 3; //time between each bullet

// Inherit the parent event
event_inherited();

//make this also a child of the enmy object somehow