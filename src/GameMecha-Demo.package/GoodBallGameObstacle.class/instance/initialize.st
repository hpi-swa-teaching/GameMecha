initializing
initialize
	super initialize.
	"self bounds: (0 asPoint extent: 40 asPoint)."
	self color: Color green.
	
	self collisionBehavior: (RectangleCollisionBehavior newOn: self).
	self markAsObstacle.
	self registerCollisionHandler: [:event | self touchesPlayer: true].