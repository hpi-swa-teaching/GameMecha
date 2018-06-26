game logic
spawnProjectile
	self flag: #useSoundLoade.
	GMDemoGameProjectile new
		registerAtGame: self game;
		center: self spatialMorph center;
		velocity: (1 @ 0 rotateBy: self transformationMorph angle about: 0 @ 0) * GMDemoGameProjectile maxVelocity;
		creator: self.
	GMDemoGameFixtures pewSound play.