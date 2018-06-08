initialization
initialize
	super initialize.
	self 
		extent: 1000 @ 800;
		color: Color blue.
	self gmRegisterToKeyHandler.
	self collisionDetectionStrategy: GMRectangleCollisionDetectionStrategy new.
	GMDemoGameSpaceship new registerAtGame: self.