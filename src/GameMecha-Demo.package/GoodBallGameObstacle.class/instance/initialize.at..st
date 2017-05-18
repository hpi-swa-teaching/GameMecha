initializing
initialize: collisionWorld at: aPoint
	| wrapper |
	self bounds: (aPoint extent: 40 asPoint).
	self color: Color green.
	
	wrapper := RectangleCollider wrap: self.
	collisionWorld addCollider: wrapper.
	wrapper markAsObstacle.