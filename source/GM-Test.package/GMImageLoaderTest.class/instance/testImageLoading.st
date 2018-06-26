testing
testImageLoading
	self should: [self cache getImageForm: GMTestResourceFixtures testImageNamePNG] raise: Error.
	self resourceManager loadResourceFromDriveIntoCache: GMTestResourceFixtures testImagePathPNG.
	self assert: [self resourceManager cache size = 1].
	self resourceManager getImageForm: GMTestResourceFixtures testImageNamePNG.