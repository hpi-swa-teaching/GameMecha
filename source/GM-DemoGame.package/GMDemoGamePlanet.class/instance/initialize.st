initialization
initialize
	super initialize.
	self flag: #useImageLoader.
	self 
		gmCollisionDetectionStrategy: GMCircleCollisionDetectionShape new;
		image: (GMDemoGameFixtures planet scaledIntoFormOfSize: self class defaultExtent).