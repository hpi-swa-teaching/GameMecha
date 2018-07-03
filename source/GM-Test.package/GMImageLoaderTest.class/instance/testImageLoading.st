testing
testImageLoading
	self should: [self resourceManager at: GMTestResourceFixtures testImagePathPNG] raise: Error.
	self resourceManager loadResourceFromDriveIntoCache: GMTestResourceFixtures testImagePathPNG.
	self assert: [self resourceManager cache size = 1].
	self resourceManager at: GMTestResourceFixtures testImagePathPNG.