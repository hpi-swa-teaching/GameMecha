as yet unclassified
initialize: colisionWorld
	| wrapper |
	self bounds: (20 asPoint corner: 40 asPoint).
	self color: Color red.
	
	wrapper := CircleCollisionDecorator wrap: self.
	colisionWorld addCollider: wrapper.
	self startStepping.