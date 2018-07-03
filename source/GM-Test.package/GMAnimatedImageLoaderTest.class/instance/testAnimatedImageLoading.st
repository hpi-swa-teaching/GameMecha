as yet unclassified
testAnimatedImageLoading
	self should: [self resourceManager at: GMTestResourceFixtures testImagePathPNG] raise: Error.
	self resourceManager loadResourceFromDriveIntoCache: GMTestResourceFixtures testImagePathGIF.
	self assert: [self resourceManager cache size = 1].
	self executeIfLocal: [(self resourceManager at: GMTestResourceFixtures testImagePathGIF) forms].