testing
testImageLoading
	self should: [self cache getImageForm: TestResourceFixtures testImageNamePNG] raise: Error.
	self resourceManager
		loadResourceIntoCache: TestResourceFixtures testImagePathPNG;
		getImageForm: TestResourceFixtures testImageNamePNG.