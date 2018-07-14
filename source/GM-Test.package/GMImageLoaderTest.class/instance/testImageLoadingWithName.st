testing
testImageLoadingWithName
	self should: [self resourceManager at: GMTestResourceFixtures fileName] raise: Error.
	self resourceManager
		loadResourceFromDrive: self testFile withName: GMTestResourceFixtures fileName;
		at: GMTestResourceFixtures fileName.