initialization
initialize
	super initialize.
	self 
		collisionDetectionStrategy: GMCircleCollisionDetectionShape new;
		image: (GMDemoGameFixtures planet scaledIntoFormOfSize: self class defaultExtent).