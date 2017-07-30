as yet unclassified
initialize
	super initialize.
	self color: Color black.
	self collisionBehavior: (RectangleCollisionBehavior newOn: self).
	self markAsObstacle.