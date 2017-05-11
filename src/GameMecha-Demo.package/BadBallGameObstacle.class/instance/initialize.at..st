as yet unclassified
initialize: colisionWorld at: point
	| wrapper |
	self bounds: (point extent: 40@40).
	self color: Color black.
	
	wrapper := RectangleCollisionDecorator wrap: self.
	colisionWorld addCollider: wrapper.