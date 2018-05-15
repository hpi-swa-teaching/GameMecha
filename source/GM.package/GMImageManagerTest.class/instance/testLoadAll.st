testing
testLoadAll
	self prepareTest.
	self imageManager loadAllResourcesFrom: 'testingResources/';
		getImageForm: GMImageManagerTest testImageName;
		getImageForm: (GMImageManagerTest testImageAdditionalName);
		loadAllResourcesFrom: 'testingResources/'.
	self assert: [self imageManager cache size >= 2].