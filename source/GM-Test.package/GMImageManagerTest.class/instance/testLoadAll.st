testing
testLoadAll
	self prepareTest.
	self imageManager loadAllResourcesFrom: TestResourceCreator testResourceFolder;
		getImageForm: TestResourceCreator testImageNamePNG;
		getImageForm: (TestResourceCreator testImageNameJPEG);
		loadAllResourcesFrom: TestResourceCreator testResourceFolder.
	self assert: [self imageManager cache size >= 2].