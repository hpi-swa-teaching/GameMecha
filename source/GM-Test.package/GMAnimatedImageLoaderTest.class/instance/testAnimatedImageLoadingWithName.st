as yet unclassified
testAnimatedImageLoadingWithName
	self executeIfLocal: 
		[self assert: [self resourceManager cache size = 0].
		self resourceManager loadResourceFromDriveIntoCache: GMTestResourceFixtures testImagePathGIF withName: 'testName'.
		self assert: [self resourceManager cache size = 1].
		(self resourceManager at: 'testName') forms; delays].