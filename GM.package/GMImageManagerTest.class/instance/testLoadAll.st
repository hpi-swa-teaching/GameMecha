testing
testLoadAll
	self prepareTest.
	self imageManager loadAllResourcesFrom: TestResourceFixtures testResourceFolder;
		getImageForm: TestResourceFixtures testImageNamePNG;
		getImageForm: (TestResourceFixtures testImageNameJPEG);
		loadAllResourcesFrom: TestResourceFixtures testResourceFolder.
	self assert: [self imageManager cache size >= 2].