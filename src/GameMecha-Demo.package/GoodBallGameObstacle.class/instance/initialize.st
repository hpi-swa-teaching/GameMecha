initializing
initialize
	super initialize.
	self bounds: (0 asPoint extent: 40 asPoint).
	self color: Color green.
	
	self markAsObstacle.
	self registerCollisionHandler: [:event | self touchesPlayer: true]