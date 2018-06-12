testing
testImageLoadingWithName
	self should: [self cache getImageForm: GMTestResourceFixtures testImageNamePNG] raise: Error.
	self resourceManager
		loadResourceIntoCache: GMTestResourceFixtures testImagePathPNG withName: GMTestResourceFixtures fileName;
		getImageForm: GMTestResourceFixtures fileName.