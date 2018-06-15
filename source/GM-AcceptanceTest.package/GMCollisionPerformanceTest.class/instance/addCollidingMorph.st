as yet unclassified
addCollidingMorph
	GMCollisionPerformanceTestEntity new velocity: (10 atRandom) @ (10 atRandom);
		position: (self left to: self right - GMCollisionPerformanceTest testMorphSize) atRandom @
			(self top to: self bottom - GMCollisionPerformanceTest testMorphSize) atRandom;
		extent: GMCollisionPerformanceTest testMorphSize @ GMCollisionPerformanceTest testMorphSize;
		registerAtParentMorph: self.