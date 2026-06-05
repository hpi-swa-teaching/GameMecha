game logic
tryShoot
	
	((self shootTimer >= self shootInterval and: [self ammo > 1]) and: [self direction ~= (0 @ 0)]) ifTrue: [self shoot]