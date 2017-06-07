as yet unclassified
initialize 
	super initialize.	
	self bounds: ((200@200) extent: 14 asPoint).
	self color: Color random.
	self markAsObstacle.
	
	self randomDirection.
	self registerCollisionHandler: [:event | self reflect: event]