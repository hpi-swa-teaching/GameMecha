as yet unclassified
addCollidingMorph
	GMCollisionPerformanceTestEntity new
		velocity: (self class maxVelocity atRandom) @ (self class maxVelocity atRandom);
		position: (self left to: self right - GMCollisionPerformanceTest testMorphSize) atRandom @
			(self top to: self bottom - GMCollisionPerformanceTest testMorphSize) atRandom;
		extent: GMCollisionPerformanceTest testMorphSize @ GMCollisionPerformanceTest testMorphSize;
		registerAtParentMorph: self.
