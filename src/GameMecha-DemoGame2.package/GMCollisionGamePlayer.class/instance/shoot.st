game logic
shoot

	| projectile |
	projectile := GMCollisionGameProjectile new
		center: self center;
		direction: self direction;
		layers: (Array new: 2);
		mask: (Array new: 2).
	projectile collider symbol: self projectileSymbol.
	projectile layers
		atWrap: 1 put: 5; "notify enemies on collision"
		atWrap: 2 put: (self layers at: 2) + 4."notify the other player on collision"
	projectile mask
		atWrap: 1 put: 4; 	"be notified on collision with enemies"
		atWrap: 2 put: (self mask at: 2) - 4. "be notified on collision with the other player"
	self
		shootTimer: 0;
		ammo: self ammo - 1.
	game addMorph: projectile