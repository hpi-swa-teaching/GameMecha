as yet unclassified
testAnimatedImageLoading
	self should: [self resourceManager getAnimationGIFReader: 'squeak.gif' "GMTestResourceFixtures testImagePathPNG"] raise: Error.
	self resourceManager loadResourceFromDriveIntoCache: 'squeak.gif'.  "GMTestResourceFixtures testImagePathGIF."
	self assert: [self resourceManager cache size = 1].
	self resourceManager getAnimationGIFReader: 'squeak.gif' "GMTestResourceFixtures testImagePathGIF".