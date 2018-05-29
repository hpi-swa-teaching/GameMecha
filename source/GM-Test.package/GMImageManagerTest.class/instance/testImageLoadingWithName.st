testing
testImageLoadingWithName
	self should: [self cache getImageForm: TestResourceFixtures testImageNamePNG] raise: Error.
	self resourceManager
		loadResourceIntoCache: TestResourceFixtures testImagePathPNG withName: TestResourceFixtures testImageNamePNG;
		getImageForm: TestResourceFixtures testImageNamePNG.