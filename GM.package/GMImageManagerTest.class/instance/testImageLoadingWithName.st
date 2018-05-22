testing
testImageLoadingWithName
	self prepareTest.
	self should: [self cache getImageForm: GMImageManagerTest testImageName] raise: Error.
	self imageManager
		loadResourceIntoCache: GMImageManagerTest testImagePath withName: GMImageManagerTest testImageName;
		getImageForm: GMImageManagerTest testImageName.