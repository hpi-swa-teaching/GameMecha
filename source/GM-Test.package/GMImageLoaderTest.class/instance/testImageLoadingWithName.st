testing
testImageLoadingWithName
	self should: [self resourceManager at: GMTestResourceFixtures fileName] raise: Error.
	self resourceManager
		loadResourceFromDriveIntoCache: self testFile withName: GMTestResourceFixtures fileName;
		at: GMTestResourceFixtures fileName.