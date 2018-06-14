testing
testLoadAll
	self resourceManager loadAllResourcesFrom: GMTestResourceFixtures testResourceFolder;
		getImageForm: GMTestResourceFixtures testImageNamePNG;
		getImageForm: GMTestResourceFixtures testImageNameJPEG;
		loadAllResourcesFrom: GMTestResourceFixtures testResourceFolder.
	self assert: [self resourceManager cache size >= 2].