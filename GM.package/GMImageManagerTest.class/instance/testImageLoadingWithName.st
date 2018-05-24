testing
testImageLoadingWithName
	self prepareTest.
	self should: [self cache getImageForm: TestResourceFixtures testImageNamePNG] raise: Error.
	self imageManager
		loadResourceIntoCache: TestResourceFixtures testImagePathPNG withName: TestResourceFixtures testImageNamePNG;
		getImageForm: TestResourceFixtures testImageNamePNG.