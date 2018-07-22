initialization
initialize
	super initialize.
	self 
		extent: self class defaultExtent;
		color: Color white.
	(self class numberOfColliders) timesRepeat: [self addCollidingMorph].