initialization
initialize
	super initialize.
	self 
		"the porjectile should be able to collide with other entities. Thus it needs to have a collisionDetectionStrategy."
		collisionDetectionStrategy: GMCircleCollisionDetectionShape new;
		"sets the image to a form stored in a method (see also: GMDemoGameFixtures class comment)"
		image: (GMDemoGameFixtures projectile scaledIntoFormOfSize: self class defaultExtent).