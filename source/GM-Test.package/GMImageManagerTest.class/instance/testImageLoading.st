testing
testImageLoading
	self prepareTest.
	self should: [self cache getImageForm: TestResourceCreator testImageNamePNG] raise: Error.
	self imageManager
		loadResourceIntoCache: TestResourceCreator testImagePathPNG;
		getImageForm: TestResourceCreator testImageNamePNG.