testing
testLoadAll
	self resourceManager loadAllResourcesFrom: GMTestResourceFixtures testResourceFolder;
		getImageForm: GMTestResourceFixtures testImagePathPNG;
		getImageForm: GMTestResourceFixtures testImagePathJPEG;
		loadAllResourcesFrom: GMTestResourceFixtures testResourceFolder.
	self assert: [self resourceManager cache size >= 2].