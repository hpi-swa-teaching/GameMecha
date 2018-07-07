as yet unclassified
testAnimatedImageLoading
	self assert: [self resourceManager cache size = 0].
	self resourceManager loadResourceFromDriveIntoCache: GMTestResourceFixtures testImagePathGIF.
	self assert: [self resourceManager cache size = 1].
	(self resourceManager at: GMTestResourceFixtures testImagePathGIF) 
		forms;
		delays.