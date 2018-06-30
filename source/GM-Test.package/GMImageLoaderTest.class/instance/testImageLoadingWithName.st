testing
testImageLoadingWithName
	self should: [self cache getImageForm: GMTestResourceFixtures fileName] raise: Error.
	self resourceManager
		loadResourceFromDriveIntoCache: GMTestResourceFixtures testImagePathPNG withName: GMTestResourceFixtures fileName;
		getImageForm: GMTestResourceFixtures fileName.