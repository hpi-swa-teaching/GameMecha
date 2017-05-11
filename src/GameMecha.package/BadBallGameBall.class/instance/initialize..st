as yet unclassified
initialize: colisionWorld
	| wrapper |
	self bounds: (20@20 corner: 40@40).
	self color: Color red.
	
	wrapper := CircleCollisionDecorator wrap: self.
	colisionWorld addCollider: wrapper.
	self startStepping.