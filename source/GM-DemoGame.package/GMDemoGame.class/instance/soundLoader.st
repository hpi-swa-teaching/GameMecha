accessing
soundLoader
	^ soundLoader ifNil: [soundLoader := GMSoundLoader new
		loadAllResourcesFromDrive: GMDemoGameFixtures resourceFolder;
		yourself]