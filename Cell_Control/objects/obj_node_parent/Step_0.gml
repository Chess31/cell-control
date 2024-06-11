growth_timer--;
if (growth_timer <= 0) {
    spread_infection();
    growth_timer = growth_rate;
}