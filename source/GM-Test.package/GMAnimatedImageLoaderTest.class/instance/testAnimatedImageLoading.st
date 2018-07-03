as yet unclassified
testAnimatedImageLoading
	self executeIfLocal: 
		[self should: [self resourceManager at: GMTestResourceFixtures testImagePathPNG] raise: Error.
		self resourceManager loadResourceFromDriveIntoCache: GMTestResourceFixtures testImagePathGIF.
		self assert: [self resourceManager cache size = 1].
		(self resourceManager at: GMTestResourceFixtures testImagePathGIF) forms].