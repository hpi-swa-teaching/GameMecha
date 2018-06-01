as yet unclassified
initialize
	
	super initialize.
	self initializeLayout.
	self 
		gmRegisterToKeyHandler;
		chooseCollisionScenario: #circleCollisionMorph with: #rectangleCollisionMorph.
			