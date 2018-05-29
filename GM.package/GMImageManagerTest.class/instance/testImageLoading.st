testing
testImageLoading
	self should: [self cache getImageForm: TestResourceFixtures testImageNamePNG] raise: Error.
	self imageManager
		loadResourceIntoCache: TestResourceFixtures testImagePathPNG;
		getImageForm: TestResourceFixtures testImageNamePNG.