accessing
imageLoader
	^ imageLoader ifNil: [imageLoader := GMImageLoader new
		loadAllResourcesFromDrive: GMDemoGameFixtures resourceFolder;
		yourself]