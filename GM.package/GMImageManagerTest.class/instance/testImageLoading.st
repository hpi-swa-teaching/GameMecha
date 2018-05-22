testing
testImageLoading
	self prepareTest.
	self should: [self cache getImageForm: GMImageManagerTest testImageName] raise: Error.
	self imageManager
		loadResourceIntoCache: GMImageManagerTest testImagePath;
		getImageForm: GMImageManagerTest testImageName.