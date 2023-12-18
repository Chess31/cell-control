EnemyMovements();
EnemyWeapons();

// Health check
if (enemyHealth <= 0) {
    // Destroy the enemy when health reaches zero
    instance_destroy();
}