as yet unclassified
initialize
	super initialize.
	self 
		extent: 1500 @ 900;
		color: Color white.
	(GMCollisionPerformanceTest numberOfColliders) timesRepeat: [self addCollidingMorph].