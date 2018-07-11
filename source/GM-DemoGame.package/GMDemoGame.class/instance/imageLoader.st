accessing
imageLoader
	^ imageLoader ifNil: [imageLoader := GMImageLoader new
		loadAllResourcesFrom: GMDemoGameFixtures resourceFolder;
		yourself]