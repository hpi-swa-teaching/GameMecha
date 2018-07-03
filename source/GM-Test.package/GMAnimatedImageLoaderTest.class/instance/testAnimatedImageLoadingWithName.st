as yet unclassified
testAnimatedImageLoadingWithName
	self executeIfLocal: 
		[self should: [self resourceManager at: GMTestResourceFixtures testImagePathGIF] raise: Error.
		self resourceManager loadResourceFromDriveIntoCache: GMTestResourceFixtures testImagePathGIF withName: 'testName'.
		self assert: [self resourceManager cache size = 1].
		(self resourceManager at: 'testName') forms].