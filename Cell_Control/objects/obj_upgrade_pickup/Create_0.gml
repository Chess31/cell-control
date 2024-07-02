index = 0;

//define 4 global lists, description, function, cooldown, duration. Then create a new instance of this object with a random index

array_push(global.upgrades, new Upgrade (UpgradeID.speedboost, index, "Increases move speed by 3", effect_sprint_boost, 120, 15));
array_push(global.upgrades, new Upgrade (UpgradeID.sniper, index, "Increases damage by 5", effect_precision_rounds, 120, 120));
array_push(global.upgrades, new Upgrade (UpgradeID.bulletspeedboost, index, "Increases bullet speed", effect_fast_rounds, 120, 120));