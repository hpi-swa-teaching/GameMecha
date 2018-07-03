testing
testImageLoadingWithName
	self should: [self resourceManager at: GMTestResourceFixtures fileName] raise: Error.
	self resourceManager
		loadResourceFromDriveIntoCache: GMTestResourceFixtures testImagePathPNG withName: GMTestResourceFixtures fileName;
		at: GMTestResourceFixtures fileName.