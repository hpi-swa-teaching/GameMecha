testing
testImageLoading
	self prepareTest;
		should: [self cache getImageForm: GMImageManagerTest testImageName asSymbol] raise: Error.
	self imageManager 
		loadResourceIntoCache: GMImageManagerTest testImageName , '.png' withName: GMImageManagerTest testImageName asSymbol;
		getImageForm: GMImageManagerTest testImageName asSymbol;
		flushCache;
		loadResourceIntoCache: GMImageManagerTest testImageName , '.png';
		loadResourceIntoCache: GMImageManagerTest testImageName , '.png' withName: GMImageManagerTest testImageName asSymbol.