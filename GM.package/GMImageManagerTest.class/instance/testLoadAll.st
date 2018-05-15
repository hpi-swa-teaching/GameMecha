testing
testLoadAll
	self prepareTest.
	self imageManager loadAllResourcesWithNamesFrom: '';
		getImageForm: GMImageManagerTest testImageName;
		getImageForm: (GMImageManagerTest testImageName , '2');
		loadAllResourcesWithNamesFrom: ''.
	self assert: [self imageManager cache size >= 2].