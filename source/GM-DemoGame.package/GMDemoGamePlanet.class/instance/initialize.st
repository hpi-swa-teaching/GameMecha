initialization
initialize
	super initialize.
	self flag: #useImageLoader.
	self 
		collisionDetectionStrategy: GMCircleCollisionDetectionShape new;
		image: (GMDemoGameFixtures planet scaledIntoFormOfSize: self class defaultExtent).