testing
testImageLoadingWithName
	self prepareTest.
	self should: [self cache getImageForm: TestResourceCreator testImageNamePNG] raise: Error.
	self imageManager
		loadResourceIntoCache: TestResourceCreator testImagePathPNG withName: TestResourceCreator testImageNamePNG;
		getImageForm: TestResourceCreator testImageNamePNG.