control
shoot
	GMDemoProjectile new
		registerAtGame: self game;
		center: self transformationMorph center;
		velocity: (1 @ 0 rotateBy: self transformationMorph angle about: 0 @ 0) * GMDemoProjectile maxVelocity.