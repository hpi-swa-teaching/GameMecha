initialization
initialize
	super initialize.
	self collisionDetectionStrategy: GMCircleCollisionDetectionStrategy new.
	self image: (GMDemoGameFixtures planet scaledIntoFormOfSize: self class defaultExtent).