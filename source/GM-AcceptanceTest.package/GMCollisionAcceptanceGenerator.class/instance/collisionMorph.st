accessing
collisionMorph
	^ collisionMorph ifNil: [collisionMorph := GMCollisionAcceptanceHandlerMorph new
		position: 0 @ 300;
		extent: 400 @ 500;
		chooseCollisionScenario: #circleCollisionMorph with: #rectangleCollisionMorph;
		yourself]