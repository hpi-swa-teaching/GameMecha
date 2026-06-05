initialize-release
initializeObjects

	| area |
	area := GMCollisionGameGlowingArea new
		center: self center;
		yourself.
	self addMorph: area