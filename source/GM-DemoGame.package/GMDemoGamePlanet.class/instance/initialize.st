initialization
initialize
	super initialize.
	self 
		registerAtGame;
		gmCollisionDetectionStrategy: GMCircleCollisionDetectionShape new;
		image: (self game imageLoader at: GMDemoGameFixtures planetPath withSize: self class defaultExtent).