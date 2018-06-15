initialization
initialize
	super initialize.
	self 
		collisionDetectionStrategy: GMCircleCollisionDetectionStrategy new;
		image: (GMDemoGameFixtures planet scaledIntoFormOfSize: self class defaultExtent).