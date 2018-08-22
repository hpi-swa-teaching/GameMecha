game logic
spawnProjectile
	(GMDemoGameProjectile newFromGame: self game)
		center: self spatialMorph center;
		velocity: (1 @ 0 rotateBy: self transformationMorph angle about: 0 @ 0) * GMDemoGameProjectile maxVelocity;
		creator: self.
	self game soundLoader playSound: GMDemoGameFixtures pewSoundPath.