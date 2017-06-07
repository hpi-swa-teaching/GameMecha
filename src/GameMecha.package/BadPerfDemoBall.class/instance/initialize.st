as yet unclassified
initialize 
	super initialize.	
	self bounds: ((200@200) extent: 20 asPoint).
	self color: Color red.
	self startStepping.
	self markAsObstacle.
	
	self randomSpeeds.
	
	self registerCollisionHandler: [:event | self randomSpeeds. ]