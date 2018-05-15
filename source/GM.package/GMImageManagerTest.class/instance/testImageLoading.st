testing
testImageLoading
	self prepareTest;
		should: [self cache getImageForm: GMImageManagerTest testImagePath asSymbol] raise: Error.
	self imageManager 
		loadResourceIntoCache: GMImageManagerTest testImagePath withName: GMImageManagerTest testImageName;
		getImageForm: GMImageManagerTest testImageName;
		flushCache;
		loadResourceIntoCache: GMImageManagerTest testImagePath;
		loadResourceIntoCache: GMImageManagerTest testImagePath withName: GMImageManagerTest testImageName.