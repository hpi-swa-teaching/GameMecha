as yet unclassified
initialize 
	super initialize.	
	self bounds: ((200@200) extent: 14 asPoint).
	self color: [Color random adjustSaturation: 1 brightness: 1] value.
	self collisionBehavior: (CircleCollisionBehavior newOn: self).
	self markAsObstacle.
	
	self randomDirection.
	self registerCollisionHandler: [:event | self reflect: event].