initializing
initialize: colisionWorld
	| wrapper |
	self bounds: (20 asPoint corner: 40 asPoint).
	self color: Color red.
	
	wrapper := CircleCollider wrap: self.
	"wrapper registerCollisionHandler: [:eventObject | colisionWorld delete]."
	colisionWorld addCollider: wrapper.
	self startStepping.