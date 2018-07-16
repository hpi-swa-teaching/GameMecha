initialization
initialize
	super initialize.
	self 
		extent: 1500 @ 900;
		color: Color white.
	(self class numberOfColliders) timesRepeat: [self addCollidingMorph].