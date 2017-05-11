as yet unclassified
initialize: collisionWorld at: aPoint
	| wrapper |
	self bounds: (aPoint extent: 40 asPoint).
	self color: Color green.
	
	wrapper := RectangleCollisionDecorator wrap: self.
	collisionWorld addCollider: wrapper.