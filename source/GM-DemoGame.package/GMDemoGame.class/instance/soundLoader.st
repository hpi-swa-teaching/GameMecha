accessing
soundLoader
	^ soundLoader ifNil: [soundLoader := GMSoundLoader new
		loadAllResourcesFrom: GMDemoGameFixtures resourceFolder;
		yourself]