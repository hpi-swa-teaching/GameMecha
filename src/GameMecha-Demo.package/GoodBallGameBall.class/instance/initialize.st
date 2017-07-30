initializing
initialize 
	super initialize.	
	self color: Color blue.
	self collisionBehavior: (CircleCollisionBehavior newOn: self).
	self startStepping.
	self markAsObstacle.