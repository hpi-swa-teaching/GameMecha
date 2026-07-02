game logic
shoot

	| projectile |

	projectile := GMCollisionGameProjectile new
		center: self center;
		direction: self direction;
		layers:  self projectileLayers;
		mask: self projectileMask;
		yourself.
	
	projectile collider symbol: self projectileSymbol.
	
	self
		shootTimer: 0;
		ammo: self ammo - 1.
	
	self game addMorph: projectile