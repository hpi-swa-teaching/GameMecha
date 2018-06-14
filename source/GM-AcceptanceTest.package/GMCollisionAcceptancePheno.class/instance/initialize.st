initialization
initialize
	super initialize.
	self initializeLayout.
	self collisionMorph: (GMCollisionAcceptanceHandlerMorph new
		position: 0 @ 300;
		extent: 400 @ 500;
		chooseCollisionScenario: #circleCollisionMorph with: #rectangleCollisionMorph).
	self addMorph: self collisionMorph.