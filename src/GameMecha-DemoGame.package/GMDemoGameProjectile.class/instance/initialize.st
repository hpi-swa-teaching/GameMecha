initialization
initialize
	super initialize.
	self 
		registerAtGame;
		"the porjectile should be able to collide with other entities. Thus it needs to have a collisionDetectionStrategy."
		gmCollisionDetectionStrategy: GMCircleCollisionDetectionShape new;
		"sets the image to a form stored in a method (see also: GMDemoGameFixtures class comment)"
		image: (self game imageLoader at: GMDemoGameFixtures projectilePath withSize: self class defaultExtent).