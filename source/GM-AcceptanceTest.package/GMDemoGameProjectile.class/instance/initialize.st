initialization
initialize
	super initialize.
	self 
		collisionDetectionStrategy: GMCircleCollisionDetectionStrategy new;
		image: (GMDemoGameFixtures projectile scaledIntoFormOfSize: self class defaultExtent).