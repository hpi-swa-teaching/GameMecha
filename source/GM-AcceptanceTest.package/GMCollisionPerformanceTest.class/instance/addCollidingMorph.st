as yet unclassified
addCollidingMorph
	GMCollisionPerformanceTestEntity new velocity: (10 atRandom) @ (10 atRandom);
		position: (self left to: self right - self class testMorphSize) atRandom @
			(self top to: self bottom - self class testMorphSize) atRandom;
		extent: self class testMorphSize @ self class testMorphSize;
		registerAtParentMorph: self.