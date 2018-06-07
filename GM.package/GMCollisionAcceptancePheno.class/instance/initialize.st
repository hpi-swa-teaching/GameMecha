initialization
initialize
	
	super initialize.
	self 
		initializeLayout;
		chooseCollisionScenario: #circleCollisionMorph with: #rectangleCollisionMorph.