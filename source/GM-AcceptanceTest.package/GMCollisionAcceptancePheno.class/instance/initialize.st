initialization
initialize
	
	super initialize.
	self initializeLayout.
	self collisionMorph: (GMCollisionAcceptanceHandlerMorph new
		position: 0 @ 100;
		extent: 400 @ 400;
		chooseCollisionScenario: #circleCollisionMorph with: #rectangleCollisionMorph).
	self addMorph: self collisionMorph.