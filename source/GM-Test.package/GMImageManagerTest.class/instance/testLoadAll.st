testing
testLoadAll
	self resourceManager loadAllResourcesFrom: TestResourceFixtures testResourceFolder;
		getImageForm: TestResourceFixtures testImageNamePNG;
		getImageForm: TestResourceFixtures testImageNameJPEG;
		loadAllResourcesFrom: TestResourceFixtures testResourceFolder.
	self assert: [self resourceManager cache size >= 2].