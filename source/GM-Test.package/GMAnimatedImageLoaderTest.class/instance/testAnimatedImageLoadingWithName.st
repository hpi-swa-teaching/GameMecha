as yet unclassified
testAnimatedImageLoadingWithName
	self should: [self resourceManager at: GMTestResourceFixtures testImageNamePNG] raise: Error.
	self resourceManager loadResourceFromDriveIntoCache: GMTestResourceFixtures testImageNameGIF withName: 'testName'.
	self assert: [self resourceManager cache size = 1].
	self resourceManager at: 'testName'.