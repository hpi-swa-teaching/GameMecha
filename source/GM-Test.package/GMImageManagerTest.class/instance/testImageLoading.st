testing
testImageLoading
	self should: [self cache getImageForm: TestResourceFixtures testImageNamePNG] raise: Error.
	self resourceManager loadResourceIntoCache: TestResourceFixtures testImagePathPNG.
	self assert: [self resourceManager cache size = 1].
	self resourceManager getImageForm: TestResourceFixtures testImageNamePNG.